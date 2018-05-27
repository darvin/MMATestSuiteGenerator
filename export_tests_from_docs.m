#!/usr/bin/env wolframscript



noBroken =  False;


whitelist = Import["WHITELIST","List"];

Print["whitelist: ", whitelist];

outputDir = "output";
If[! DirectoryQ[outputDir], CreateDirectory[outputDir]];


rootDirectory = If[Length@$ScriptCommandLine==0, 
  FileNameJoin[{Directory[], "build_docs/"}], 
  FileNameJoin[{$InstallationDirectory, "Documentation", "English", 
    "System"}]
  ]; (*  means we are running on docker *)

  
Print["Documentation Root: ", rootDirectory];

subDirectories = {
   FileNameJoin[{"ReferencePages", "Symbols"}]
   };



SetAttributes[ESimpleExamples, HoldAllComplete];
exportTests[fileName_, noBroken_] := 
  Module[{nb, processNotebook}, Print["getting tests from ", fileName];
   nb = NotebookImport[fileName, "ExampleText" | "Input" | "Output", 
     "StyleImportRules" -> {"ExampleText" -> "Text", 
       "Input" -> "Boxes", "Output" -> "Boxes"}, 
     "FlattenCellGroups" -> True];
   Print[nb];
   processNotebook[nb_] := Module[{result, testFunc, finalResult},
     testFunc[in_, out_] := 
      Module[{isGood, inExpr, outExpr, inInact, outInact}, 
       inExpr = ToExpression[in, StandardForm];
       outExpr = ToExpression[out, StandardForm];
       inInact = ToExpression[in, StandardForm, HoldComplete];
       outInact = ToExpression[out, StandardForm, HoldComplete];
       isGood = inExpr === outExpr;
       If[isGood, ESameTest[inInact, outInact], 
        If[! noBroken, ESameTestBROKEN[inInact, outInact], 
         Unevaluated@Sequence[]]]];
     result = {};
     For[i = 1, i < Length[nb], i++, 
      Module[{current, next},
       current = nb[[i]];
       next = nb[[i + 1]];
       Print[" -  ", i, "  ", current];
       If[
        MatchQ[current, _BoxData] && 
         MatchQ[next, _BoxData], (result = 
          Append[result, testFunc[current, next]];
         i++;)];
       If[
        MatchQ[current, _String], (result = 
           Append[result, EComment[current]];)];
      If[
        MatchQ[current, _TextData], (result = 
           Append[result, EComment[current]];)];
       ]];
     finalResult = ESimpleExamples @@ result;
     Print["- Result: ", finalResult];
     finalResult = 
      finalResult /. {ESameTest[HoldComplete[in_], 
          HoldComplete[out_]] -> ESameTest[in, out], 
        ESameTestBROKEN[HoldComplete[in_], HoldComplete[out_]] -> 
         ESameTestBROKEN[in, out]};
     finalResult];
   processNotebook[nb]];


exportFile[nbFileName_, outputFile_] := Module[{exportedCode}, (
    If[!MemberQ[whitelist, FileBaseName@nbFileName], Return[]];
    exportedCode = exportTests[nbFileName, noBroken];
    If[FileExistsQ[outputFile], DeleteFile[outputFile]];
    Put[exportedCode, outputFile];
    Print["Exported doc tests from", nbFileName, "to ", outputFile];
    )];



processDirectory[subDirectory_] := Module[{outFileName, fullDirName}, (
    Print["Processing directory: ", subDirectory];
    fullDirName = FileNameJoin[{rootDirectory, subDirectory}];
    Map[TimeConstrained[exportFile[#, FileNameJoin[{outputDir, FileBaseName[#]<>"_Tests.m"}] ], 5 ] &,
      FileNames["*.nb", {fullDirName}]];
    )];




Map[processDirectory, subDirectories];