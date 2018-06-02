#!/Applications/Mathematica.app/Contents/MacOS/WolframKernel  -script



noBroken =  False;


Clear[TapSuite, TapTestSame, TapTestSameBROKEN, TapComment, 
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
   If[isGood, TapTestSame[inInact, outInact], 
    If[! noBroken, TapTestSameBROKEN[inInact, outInact], 
     Unevaluated@Sequence[]]]];

SetAttributes[TapSuite, HoldAllComplete];
exportTests[fileName_, noBroken_] := 
  Module[{nb, processNotebook}, 
   nb = getExamplesFromNotebook[Import[fileName]];
   processNotebook[nb_] := 
    Module[{result, finalResult, replaceExampleWithTest},
     Clear[replaceExampleWithTest, result, finalResult];
     result = 
      nb //. {p___, TEMPExample[in_, out_, txt_], n___} -> {p, 
         TapComment[txt], TEMPExample[in, out], n};
     replaceExampleWithTest[{p___, TEMPExample[in_, out_], 
        n___}] := {p, testFunc[in, out, noBroken], n};
     replaceExampleWithTest[any_List] := any;
     
     result = FixedPoint[replaceExampleWithTest, result];
     
     finalResult = TapSuite @@ result;
     finalResult = 
      finalResult /. {TapTestSame[HoldComplete[in_], 
          HoldComplete[out_]] -> TapTestSame[in, out], 
        TapTestSameBROKEN[HoldComplete[in_], HoldComplete[out_]] -> 
         TapTestSameBROKEN[in, out]};
     finalResult];
   processNotebook[nb]];


exportFile[nbFileName_, outputFile_] := Module[{exportedCode}, (
    Print["# GENERATING TESTS FROM: ", nbFileName];
    Print["# WRITING OUTPUT TO:     ", outputFile];

    exportedCode = exportTests[nbFileName, noBroken];
    If[!DirectoryQ[DirectoryName[outputFile]], CreateDirectory[DirectoryName[outputFile]]];
    If[FileExistsQ[outputFile], DeleteFile[outputFile]];
    Export[outputFile, {HoldComplete[Import["CompatTests.m"];], HoldComplete@#&@exportedCode}, "HeldExpressions"]
    )];

run[]:=exportFile[$CommandLine[[-2]], $CommandLine[[-1]]];
UsingFrontEnd[TimeConstrained[run[], 15]];

