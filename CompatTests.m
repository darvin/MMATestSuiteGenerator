
systemFullName[] := Module[{systemName, versionName},
   systemName = Which[
      MatchQ[SystemInformation["Kernel", "LicenseID"], _String], 
     "Mathematica",
     MemberQ[Attributes[ExpreduceFactorConstant], Protected], 
     "Expreduce"
     ];
   versionName = StringTrim[ToString[$VersionNumber], "."];
   systemName <> "_" <> versionName
   ];


outputFileNameNoExt[] := FileNameJoin[{"output/Results/", systemFullName[], FileBaseName[$InputFileName]}];
outputFileName[] := outputFileNameNoExt[] <>".json";
If[!DirectoryQ[DirectoryName[outputFileName[]]], CreateDirectory[DirectoryName[outputFileName[]]]];

(* $Messages = {OpenWrite[outputFileNameNoExt[]<>".err.log", FormatType -> OutputForm]};
 *)
outputTapFileName[] := outputFileNameNoExt[] <>".tap";



Clear[ESimpleExamples, EComment, ESameTest, ESameTestBROKEN, 
  ESameTestDISABLED];
SetAttributes[ESameTest, HoldAllComplete];
SetAttributes[ESameTestBROKEN, HoldAllComplete];
SetAttributes[ESameTestDISABLED, HoldAllComplete];

EComment[txt_] := {"Comment", txt};

ESameTest[in_, out_, isDisabled_] := 
  Module[{inExpr, outExpr, inStrEvaluated, outStrEvaluated, inStr, 
    outStr, result}, Clear[inExpr, outExpr, inStr, outStr, result];
   result = False;
   inStr = ToString[Unevaluated@InputForm[in]];
   outStr = ToString[Unevaluated@InputForm[out]];
   If[! isDisabled, (inExpr = ReleaseHold[in];
     outExpr = ReleaseHold[out];
     result = inExpr === outExpr;
     inStrEvaluated = ToString[InputForm[inExpr]];
     outStrEvaluated = ToString[InputForm[outExpr]];
     )];
   {"Test", inStr, outStr, inStrEvaluated, outStrEvaluated, 
    isDisabled, result}];
ESameTest[in_, out_] := ESameTest[in, out, False];
ESameTestBROKEN[in_, out_] := ESameTest[in, out, True];
ESameTestDISABLED[in_, out_] := ESameTest[in, out, True];


ESimpleExamples[tests__] := 
  Module[{outputTapStream, PrintTap, json, testName, runTestOrComment, failed, total, disabled, 
    testResults}, (
    outputTapStream = OpenWrite[outputTapFileName[]];
    PrintTap[arg___]:= (
      WriteString["stdout", arg];
      WriteString[outputTapStream, arg];
      );
    PrintTap["# SYSTEM: ",systemFullName[], "\n"];
    testName = FileBaseName[$InputFileName];
    PrintTap["# TEST: ", testName, "\n"];
    PrintTap["# OUTPUT: ", outputFileName[], "\n"];
    failed = 0;
    total = 0;
    disabled = 0;
    runTestOrComment[a_] := 
     Module[{type, comment, inStr, outStr, inExpr, outExpr, 
       isDisabled, result}, 
      If[a[[1]] == "Comment", ({type, comment} = a;
        PrintTap["# ", comment, "\n"];
        {"Comment" -> comment}), (
        {type, inStr, outStr, inExpr, outExpr, isDisabled, result} = a;
        total++;
        If[! isDisabled, (
          If[! result, (
            failed++;
            )];
          ), disabled++
         ];

        PrintTap[If[result||isDisabled, "ok ", "not ok "], 
           " - ", inStr];

        If[!isDisabled, PrintTap[
           "\n  ---\n",
           "  data:\n",
           "    got: ",inExpr,"\n",
           "    expect: ",outStr,"\n",
           "    expect_evaluated: ",outExpr,"\n"
           ], PrintTap[" # skip\n"]];


        {"Test" -> {inStr, outStr, ToString[inExpr], 
           ToString[outExpr], isDisabled, result}})]];
    (* testResults = Map[runTestOrComment, {tests}]; *)
    Scan[runTestOrComment, {tests}];
    json = {(* "Tests" -> testResults,  *)
     "Stats" -> {"Total" -> total, "Failed" -> failed, 
       "Disabled" -> disabled}};
    Export[outputFileName[], json];
    Print[json];
    Close[outputTapStream];
       )];


