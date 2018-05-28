#!/Applications/Mathematica.app/Contents/MacOS/MathematicaScript  -script
Clear[ESimpleExamples, EComment, ESameTest, ESameTestBROKEN, 
  ESameTestDISABLED];
SetAttributes[ESameTest, HoldAllComplete];
SetAttributes[ESameTestBROKEN, HoldAllComplete];
SetAttributes[ESameTestDISABLED, HoldAllComplete];

EComment[txt_] := {"Comment", txt};

ESameTest[in_, out_, isDisabled_] := 
  Module[{inExpr, outExpr, inStr, outStr, result},
   Clear[inExpr, outExpr, inStr, outStr, result];
   result = False;
   inStr = ToString@HoldForm@in;
   outStr = ToString@HoldForm@out;
   
   If[! isDisabled, (
     inExpr = ReleaseHold[in];
     outExpr = ReleaseHold[out];
     result = inExpr === outExpr;
     )];
   {"Test", inStr, outStr, inExpr, outExpr, isDisabled, result}
   ];
ESameTest[in_, out_] := ESameTest[in, out, False];
ESameTestBROKEN[in_, out_] := ESameTest[in, out, False];
ESameTestDISABLED[in_, out_] := ESameTest[in, out, True];


ESimpleExamples[tests__] := 
  Module[{r, runTestOrComment, failed, total, disabled, testResults}, (
    failed = 0;
    total = 0;
    disabled = 0;
    runTestOrComment[a_] := 
     Module[{type,  comment, inStr, outStr, inExpr, outExpr, 
       isDisabled, result},
      If[a[[1]] == "Comment", (
        {type, comment} = a;
        Print["# ", comment];
        {"Comment" -> comment}
        ), (
        {type, inStr, outStr, inExpr, outExpr, isDisabled, result} = a;
        If[isDisabled, disabled++];
        If[! result, failed++];
        total++;
        If[! isDisabled, 
         Print["  - TEST: r: ", result, "  IN: ", inStr, " (", 
          inExpr, ")  OUT: ", outStr, "  (", outExpr, ")"]];
        {"Test" -> {inStr, outStr, ToString[inExpr], 
           ToString[outExpr], isDisabled, result}}
        )]
      
      ];
    testResults = Map[runTestOrComment, {tests}];
    {
     "Tests" -> testResults,
     "Stats" -> {
       "Total" -> total,
       "Failed" -> failed,
       "Disabled" -> disabled
       }
     }
    )];

Clear[runAllTestsInDir];
runAllTestsInDir[dirPath_, outDirPath_] := 
  Module[{runTestsInFile, failed, total, disabled, testResults, 
    testStats, testFilesResultsJSONs},
   Print["Running tests in dir: ", dirPath, "\nTest files: \n", 
    FileNames["*.m", {dirPath}]];
   If[! DirectoryQ[outDirPath], CreateDirectory[outDirPath]];
   
   failed = 0;
   total = 0;
   disabled = 0;
   runTestsInFile[file_] := Module[{results, outFile},
     Print["Running: ", file];
     results = Import[file];
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
outDir = FileNameJoin[{outBaseDir, ToString[$VersionNumber]}];
UsingFrontEnd[runAllTestsInDir["output/Tests/", 
  outDir]];