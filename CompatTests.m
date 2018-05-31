systemFullName[] := Module[{systemName, versionName},
   systemName = Which[
      MemberQ[Attributes[WolframLanguageData], Protected], 
     "Mathematica",
     MemberQ[Attributes[ExpreduceFactorConstant], Protected], 
     "Mathematica"
     ];
   versionName = StringTrim[ToString[$VersionNumber], "."];
   systemName <> "_" <> versionName
   ];


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
  Module[{r, json, testName runTestOrComment, failed, total, disabled, 
    testResults}, (
    Print["# RUNNING ON ",systemFullName[]];
    testName = FileBaseName[$InputFileName];
    Print["# TEST: ", testName];
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
    

       )];

Clear[runAllTestsInDir];
runAllTestsInDir[dirPath_, outDirPath_] := 
  UsingFrontEnd@Module[{runTestsInFile, failed, total, disabled, testResults, 
    testStats, testFilesResultsJSONs},
   Print["Running tests in dir: ", dirPath, "\nTest files: \n", 
    FileNames["*.m", {dirPath}]];
   
   failed = 0;
   total = 0;
   disabled = 0;
   runTestsInFile[file_] := Module[{results, outFile},
     Print["Running: ", file];
     results = Import[file];
     failed += "Failed" /. ("Stats" /. results);
     total += "Total" /. ("Stats" /. results);
     disabled += "Disabled" /. ("Stats" /. results);
     outFile = 
      FileNameJoin[{outDirPath, FileBaseName[file] <> ".json"}];
     Export[outFile, results];
     FileNameTake@outFile
     ];
   testFilesResultsJSONs = 
    Map[TimeConstrained[runTestsInFile[#], 50] &, 
     FileNames["*.m", {dirPath}]];
   testStats = {
     "Stats" -> {
       "TestFiles" -> testFilesResultsJSONs,
       "Total" -> total,
       "Failed" -> failed,
       "Disabled" -> disabled
       }
     };
   Export[FileNameJoin[{outDirPath, "__index.json"}], testStats];
   ];





outBaseDir = "output/Results/";
outDir = FileNameJoin[{outBaseDir, systemFullName[]}];
UsingFrontEnd[runAllTestsInDir["output/Tests/", 
  outDir]];
