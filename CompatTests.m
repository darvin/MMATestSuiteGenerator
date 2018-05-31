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

outputFileName[] := FileNameJoin[{"output/Results/", systemFullName[], FileBaseName[$InputFileName]}]<>".json";

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
  Module[{r, json, testName, runTestOrComment, failed, total, disabled, 
    testResults}, (
    Print["# SYSTEM: ",systemFullName[]];
    testName = FileBaseName[$InputFileName];
    Print["# TEST: ", testName];
    Print["# OUTPUT: ", outputFileName[]];
    failed = 0;
    total = 0;
    disabled = 0;
    runTestOrComment[a_] := 
     Module[{type, comment, inStr, outStr, inExpr, outExpr, 
       isDisabled, result}, 
      If[a[[1]] == "Comment", ({type, comment} = a;
        Print["# ", comment];
        {"Comment" -> comment}), ({type, inStr, outStr, inExpr, 
          outExpr, isDisabled, result} = a;
        total++;
        If[! isDisabled, (
          
          Print[If[result, "ok ", "not ok "], 
           "\n ---\n IN: ", inStr, "\n (**  ", inExpr, 
           "  **) \n  OUT: ", outStr, "  \n   (**  ", outExpr, 
           "  **)"];
          If[! result, (
            failed++;
            )];
          ), disabled++
         ];
        {"Test" -> {inStr, outStr, ToString[inExpr], 
           ToString[outExpr], isDisabled, result}})]];
    testResults = Map[runTestOrComment, {tests}];
    json = {"Tests" -> testResults, 
     "Stats" -> {"Total" -> total, "Failed" -> failed, 
       "Disabled" -> disabled}};
    If[!DirectoryQ[DirectoryName[outputFileName[]]], CreateDirectory[DirectoryName[outputFileName[]]]];
    Export[outputFileName[], json];
    

       )];

