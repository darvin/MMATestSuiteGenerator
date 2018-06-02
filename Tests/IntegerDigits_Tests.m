(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find digits in base 10:"], 
 TapTestSame[IntegerDigits[58127], {5, 8, 1, 2, 7}], 
 TapComment["Find digits in base 2:"], TapTestSame[IntegerDigits[58127, 2], 
  {1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1}], 
 TapComment["Bases larger than 10 can be used:"], 
 TapTestSame[IntegerDigits[58127, 16], {14, 3, 0, 15}], 
 TapComment["RefLink[IntegerDigits,paclet:ref/IntegerDigits] threads itself \
over elements of lists:"], TapTestSame[IntegerDigits[{6, 7, 2}, 2], 
  {{1, 1, 0}, {1, 1, 1}, {1, 0}}], 
 TapComment["Find the digits of 7 in different bases:"], 
 TapTestSame[IntegerDigits[7, {2, 3, 4}], {{1, 1, 1}, {2, 1}, {1, 3}}], 
 TapComment["By default, RefLink[IntegerDigits,paclet:ref/IntegerDigits] \
includes no leading zeros:"], TapTestSame[IntegerDigits[Range[0, 7], 2], 
  {{0}, {1}, {1, 0}, {1, 1}, {1, 0, 0}, {1, 0, 1}, {1, 1, 0}, {1, 1, 1}}], 
 TapComment["Pad all digit lists to be length 3:"], 
 TapTestSame[IntegerDigits[Range[0, 7], 2, 3], 
  {{0, 0, 0}, {0, 0, 1}, {0, 1, 0}, {0, 1, 1}, {1, 0, 0}, {1, 0, 1}, 
   {1, 1, 0}, {1, 1, 1}}], TapComment["Find only the last 4 digits:"], 
 TapTestSame[IntegerDigits[6345354, 10, 4], {5, 3, 5, 4}], 
 TapComment["Leading digits of factorials:"], 
 TapTestSame[Table[First[IntegerDigits[n!]], {n, 50}], 
  {1, 2, 6, 2, 1, 7, 5, 4, 3, 3, 3, 4, 6, 8, 1, 2, 3, 6, 1, 2, 5, 1, 2, 6, 1, 
   4, 1, 3, 8, 2, 8, 2, 8, 2, 1, 3, 1, 5, 2, 8, 3, 1, 6, 2, 1, 5, 2, 1, 6, 
   3}], TapComment["RefLink[ChampernowneNumber,paclet:ref/ChampernowneNumber] \
has a decimal expansion that is a concatenation of consecutive integers:"], 
 TapTestSame[Join @@ Table[IntegerDigits[i], {i, 30}], 
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 
   1, 8, 1, 9, 2, 0, 2, 1, 2, 2, 2, 3, 2, 4, 2, 5, 2, 6, 2, 7, 2, 8, 2, 9, 3, 
   0}], TapComment[
  "Compare to RefLink[ChampernowneNumber,paclet:ref/ChampernowneNumber]: "], 
 TapTestSame[N[ChampernowneNumber[10], Length[%]], 
  0.12345678910111213141516171819202122232425262728293`50.091514977524966], 
 TapComment["Cantor set construction:"], 
 TapTestSame[Table[If[FreeQ[IntegerDigits[n - 1, 3], 1], 1, 0], {n, 27}], 
  {1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 
   0, 1}], TapComment["Find all combinations of 3 binary digits:"], 
 TapTestSame[Table[IntegerDigits[i, 2, 3], {i, 0, 7}], 
  {{0, 0, 0}, {0, 0, 1}, {0, 1, 0}, {0, 1, 1}, {1, 0, 0}, {1, 0, 1}, 
   {1, 1, 0}, {1, 1, 1}}], TapTestSame[Tuples[{0, 1}, 3], 
  {{0, 0, 0}, {0, 0, 1}, {0, 1, 0}, {0, 1, 1}, {1, 0, 0}, {1, 0, 1}, 
   {1, 1, 0}, {1, 1, 1}}], 
 TapComment["Pad digit lists to be the same length:"], 
 TapTestSame[PadLeft[Table[IntegerDigits[i^2, 2], {i, 5}]], 
  {{0, 0, 0, 0, 1}, {0, 0, 1, 0, 0}, {0, 1, 0, 0, 1}, {1, 0, 0, 0, 0}, 
   {1, 1, 0, 0, 1}}], TapComment["The sign is ignored:"], 
 TapTestSame[IntegerDigits[-3134], {3, 1, 3, 4}], 
 TapComment["Leading digits of factorials in base 100:"], 
 TapTestSameBROKEN[HoldComplete[ListLinePlot[
    Table[First[IntegerDigits[n!, 100]], {n, 300}]]], $Failed]]
