#!/Applications/Mathematica.app/Contents/MacOS/WolframKernel  -script


Print["$CommandLine ", $CommandLine];

noBroken =  False;


whitelist = Import["WHITELIST","List"];

Print["whitelist: ", whitelist];

outputDir = "output/Tests/";
If[! DirectoryQ[outputDir], CreateDirectory[outputDir]];


rootDirectory = FileNameJoin[{Directory[], "build_docs/"}]; 
  
Print["Documentation Root: ", rootDirectory];

subDirectories = {
   FileNameJoin[{"ReferencePages", "Symbols"}]
   };


Clear[ESimpleExamples, ESameTest, ESameTestBROKEN, EComment, 
  getExamplesFromNotebook];
getExamplesFromNotebook[nbImported_] := 
  Module[{getInputFromCell, nb}, (Clear[getInputFromCell];
    getInputFromCell[Cell[content_, "ExampleText", rest__]] := 
     First[FrontEndExecute[
        FrontEnd`ExportPacket[Cell[content, "ExampleText", rest], 
         "PlainText"]]] // TEMPTxt;
    getInputFromCell[Cell[content_, "Input", rest__]] := 
     First[FrontEndExecute[
        FrontEnd`ExportPacket[Cell[content, "Input", rest], 
         "PlainText"]]] // TEMPIn;
    getInputFromCell[Cell[content_, "Output", rest__]] := 
     First[FrontEndExecute[
        FrontEnd`ExportPacket[Cell[content, "Output", rest], 
         "PlainText"]]] // TEMPOut;
    getInputFromCell[Cell[content_, style_String, rest__]] := 
     First[FrontEndExecute[
        FrontEnd`ExportPacket[Cell[content, style, rest], 
         "PlainText"]]] // TEMPUNDEFINED;
    nb = Cases[nbImported, 
      Cell[content_, 
        style_ /; MemberQ[{"Input", "Output", "ExampleText"}, style], 
        rest__] -> getInputFromCell[Cell[content, style, rest]], {0, 
       Infinity}];
    nb = nb //. {p___, TEMPIn[in_], TEMPOut[out_], n___} -> {p, 
        TEMPExample[in, out], n};
    nb = nb //. {p___, TEMPTxt[txt_], TEMPExample[in_, out_], 
        n___} -> {p, TEMPExample[in, out, txt], n};
    nb = Select[nb, MatchQ[#, _TEMPExample] &];
    nb)];

Clear[testFunc, exportTests];
testFunc[in_, out_, noBroken_] := 
  Module[{isGood, inExpr, outExpr, inInact, outInact}, 
   inExpr = ToExpression[in, StandardForm];
   outExpr = ToExpression[out, StandardForm];
   inInact = ToExpression[in, StandardForm, HoldComplete];
   outInact = ToExpression[out, StandardForm, HoldComplete];
   isGood = inExpr === outExpr;
   
   Print["ok ", If[isGood, " "," # skip ERROR "], in];
   If[isGood, ESameTest[inInact, outInact], 
    If[! noBroken, ESameTestBROKEN[inInact, outInact], 
     Unevaluated@Sequence[]]]];

SetAttributes[ESimpleExamples, HoldAllComplete];
exportTests[fileName_, noBroken_] := 
  Module[{nb, processNotebook}, 
   nb = getExamplesFromNotebook[Import[fileName]];
   processNotebook[nb_] := 
    Module[{result, finalResult, replaceExampleWithTest},
     Clear[replaceExampleWithTest, result, finalResult];
     result = 
      nb //. {p___, TEMPExample[in_, out_, txt_], n___} -> {p, 
         EComment[txt], TEMPExample[in, out], n};
     replaceExampleWithTest[{p___, TEMPExample[in_, out_], 
        n___}] := {p, testFunc[in, out, noBroken], n};
     replaceExampleWithTest[any_List] := any;
     
     result = FixedPoint[replaceExampleWithTest, result];
     
     finalResult = ESimpleExamples @@ result;
     finalResult = 
      finalResult /. {ESameTest[HoldComplete[in_], 
          HoldComplete[out_]] -> ESameTest[in, out], 
        ESameTestBROKEN[HoldComplete[in_], HoldComplete[out_]] -> 
         ESameTestBROKEN[in, out]};
     finalResult];
   processNotebook[nb]];


exportFile[nbFileName_, outputFile_] := Module[{exportedCode}, (
    If[!MemberQ[whitelist, FileBaseName@nbFileName], Return[]];
    Print[">> ", nbFileName];
    exportedCode = exportTests[nbFileName, noBroken];
    If[FileExistsQ[outputFile], DeleteFile[outputFile]];
    Export[outputFile, {HoldComplete[Import["CompatTests.m"];], HoldComplete@#&@exportedCode}, "HeldExpressions"]
    Print["> >>> ", outputFile];
    )];



processDirectory[subDirectory_] := Module[{outFileName, fullDirName}, (
    Print["Processing directory: ", subDirectory];
    fullDirName = FileNameJoin[{rootDirectory, subDirectory}];
    Map[TimeConstrained[exportFile[#, FileNameJoin[{outputDir, FileBaseName[#]<>"_Tests.m"}] ], 50 ] &,
      FileNames["*.nb", {fullDirName}]];
    )];




UsingFrontEnd[Map[processDirectory, subDirectories]];

