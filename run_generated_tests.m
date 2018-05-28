#!/Applications/Mathematica.app/Contents/MacOS/MathematicaScript

testDir = FileNameJoin[{Directory[], "output/"};

testFile = FileNameJoin[{testDir, "For_Tests.m"}];

ESimpleExamples[lst_] := lst;
ESimpleExamples[EComment["Break breaks out of For:"], 
 ESameTest[For[i = 1, i < 1000, i++, If[i > 10, Break[]]]; i, 11]]

Import[testFile]