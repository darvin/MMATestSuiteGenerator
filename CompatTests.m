
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



Clear[TapSuite, TapComment, TapTestSame, TapTestSameBROKEN, 
  TapTestSameDISABLED];
SetAttributes[TapTestSame, HoldAllComplete];
SetAttributes[TapTestSameBROKEN, HoldAllComplete];
SetAttributes[TapTestSameDISABLED, HoldAllComplete];

TapComment[txt_] := {"Comment", txt};
lastOutputVar = Null;

TapTestSame[in_, out_, isDisabled_] := 
  Module[{inExpr, outExpr, inStrEvaluated, outStrEvaluated, inStr, 
    outStr, result}, Clear[inExpr, outExpr, inStr, outStr, result];
   result = False;
   inStr = ToString[Unevaluated@InputForm[in]];
   outStr = ToString[Unevaluated@InputForm[out]];
     inExpr = ReleaseHold[in]  /. % -> lastOutputVar;
     outExpr = ReleaseHold[out];
     lastOutputVar = outExpr;
     inStrEvaluated = ToString[inExpr, OutputForm];
     outStrEvaluated = ToString[outExpr, OutputForm];
     result = inStrEvaluated === outStrEvaluated;
   {"Test", inStr, outStr, inStrEvaluated, outStrEvaluated, 
    isDisabled, result}];
TapTestSame[in_, out_] := TapTestSame[in, out, False];
TapTestSameBROKEN[in_, out_] := TapTestSame[in, out, True];
TapTestSameDISABLED[in_, out_] := TapTestSame[in, out, True];


TapSuite[tests__] := 
  UsingFrontEnd[TimeConstrained[Module[{outputTapStream, PrintTap, json, testName, runTestOrComment, failed, total, disabled, 
    testResults}, (
    PrintTap[arg___]:= (
      WriteString["stdout", arg];
      );
    PrintTap["# SYSTEM: ",systemFullName[], "\n"];
    testName = FileBaseName[$InputFileName];
    PrintTap["# TEST: ", testName, "\n"];
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
           " ", inStr, "    \[DoubleLongRightArrow]     ", outStr];

        If[!isDisabled, PrintTap[
           "\n    ---\n",
           "    data:\n",
           "        got: ",inExpr,"\n",
           "        expect: ",outStr,"\n",
           "        expect_evaluated: ",outExpr,"\n",
           "    ...\n"
           ], PrintTap[" # skip\n"]];


        {"Test" -> {inStr, outStr, ToString[inExpr], 
           ToString[outExpr], isDisabled, result}})]];
    Scan[runTestOrComment, {tests}];
    json = {(* "Tests" -> testResults,  *)
     "Stats" -> {"Total" -> total, "Failed" -> failed, 
       "Disabled" -> disabled}};
       )], 60]];


