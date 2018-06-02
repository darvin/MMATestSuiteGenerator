(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Keep dividing by 2 until the result is no longer an even number:"], 
 TapTestSame[NestWhileList[#1/2 & , 123456, EvenQ], 
  {123456, 61728, 30864, 15432, 7716, 3858, 1929}], 
 TapComment[
  "Iterate taking logarithms until the result is no longer positive:"], 
 TapTestSame[NestWhileList[Log, 100, #1 > 0 & ], 
  {100, Log[100], Log[Log[100]], Log[Log[Log[100]]], 
   Log[Log[Log[Log[100]]]]}], TapComment["Start comparisons after 4 \
iterations, and compare using the 4 last values:"], 
 TapTestSame[NestWhileList[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , 4], {10, 5, 2, 1, 0, 0}], 
 TapComment[
  "Start comparisons after 4 iterations, and compare using the 6 last \
values:"], TapTestSame[NestWhileList[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , {4, 6}], {10, 5, 2, 1, 0, 0}], 
 TapComment["Always compare all values generated:"], 
 TapTestSame[NestWhileList[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , All], {10, 5, 2, 1, 0, 0}], 
 TapComment["Stop after at most 4 steps, even if the condition is still \
RefLink[True,paclet:ref/True]:"], TapTestSame[NestWhileList[Floor[#1/2] & , 
   20, UnsameQ, 2, 4], {20, 10, 5, 2, 1}], 
 TapComment["Continue until the result is no longer greater than 1:"], 
 TapTestSame[NestWhileList[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity], 
  {20, 10, 5, 2, 1}], TapComment["Perform one more step after the condition \
is no longer RefLink[True,paclet:ref/True]:"], 
 TapTestSame[NestWhileList[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity, 1], 
  {20, 10, 5, 2, 1, 0}], TapComment["Drop the last value generated (for which \
the test was no longer RefLink[True,paclet:ref/True]):"], 
 TapTestSame[NestWhileList[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity, -1], 
  {20, 10, 5, 2}], TapComment[
  "Find successive integers until a prime is reached:"], 
 TapTestSame[NestWhileList[#1 + 1 & , 899,  !PrimeQ[#1] & ], 
  {899, 900, 901, 902, 903, 904, 905, 906, 907}], 
 TapComment["Find the multiplicative order of 2 modulo 19:"], 
 TapTestSame[NestWhileList[Mod[2*#1, 19] & , 2, #1 != 1 & ], 
  {2, 4, 8, 16, 13, 7, 14, 9, 18, 17, 15, 11, 3, 6, 12, 5, 10, 1}], 
 TapTestSameBROKEN[Length[%], 18], TapComment["Use \
RefLink[MultiplicativeOrder,paclet:ref/MultiplicativeOrder] to compute \
directly:"], TapTestSame[MultiplicativeOrder[2, 19], 18], 
 TapComment["Find the orbit of 4 under the mapping 5x  mod 7:"], 
 TapTestSame[NestWhileList[Mod[5*#1, 7] & , 4, Unequal, All], 
  {4, 6, 2, 3, 1, 5, 4}], TapComment[
  "Keep applying iterations in the 3n+1 problem until the results repeat:"], 
 TapTestSame[NestWhileList[If[EvenQ[#1], #1/2, (3*#1 + 1)/2] & , 400, 
   Unequal, All], {400, 200, 100, 50, 25, 38, 19, 29, 44, 22, 11, 17, 26, 13, 
   20, 10, 5, 8, 4, 2, 1, 2}], 
 TapComment["Exclude the first repeating element from the output:"], 
 TapTestSame[NestWhileList[If[EvenQ[#1], #1/2, (3*#1 + 1)/2] & , 400, 
   Unequal, All, Infinity, -1], {400, 200, 100, 50, 25, 38, 19, 29, 44, 22, 
   11, 17, 26, 13, 20, 10, 5, 8, 4, 2, 1}], TapComment["Apply Newton \
iterations for Sqrt[2] until successive results are within 0.001."], 
 TapTestSame[NestWhileList[(#1 + 2/#1)/2 & , 1, Abs[#1 - #2] > 0.001 & , 2], 
  {1, 3/2, 17/12, 577/408, 665857/470832}], 
 TapComment["These two forms are equivalent:"], 
 TapTestSame[NestWhileList[Floor[#1/2] & , 10, UnsameQ, {4, 4}], 
  {10, 5, 2, 1, 0, 0}], TapTestSame[NestWhileList[Floor[#1/2] & , 10, 
   UnsameQ, 4], {10, 5, 2, 1, 0, 0}], TapComment["RefLink[NestWhileList,pacle\
t:ref/NestWhileList] returns all intermediate values of \
RefLink[NestWhile,paclet:ref/NestWhile]:"], 
 TapTestSame[NestWhileList[#1/2 & , 123456, EvenQ], 
  {123456, 61728, 30864, 15432, 7716, 3858, 1929}], 
 TapTestSame[Reap[NestWhile[Sow[#1]/2 & , 123456, EvenQ]], 
  {1929, {{123456, 61728, 30864, 15432, 7716, 3858}}}], 
 TapComment["RefLink[FixedPointList,paclet:ref/FixedPointList] always \
compares the last two values; these two forms are equivalent:"], 
 TapTestSameBROKEN[NestWhileList[(#1 + 3/#1)/2 & , 1., UnsameQ, 2], 
  {1., 2., 1.75, 1.73214, 1.73205, 1.73205, 1.73205}], 
 TapTestSameBROKEN[FixedPointList[(#1 + 3/#1)/2 & , 1.], 
  {1., 2., 1.75, 1.73214, 1.73205, 1.73205, 1.73205}], 
 TapComment["Find the digits of a number:"], 
 TapTestSame[With[{n = 123456, k = 10}, 
   Reverse[Mod[NestWhileList[Quotient[#1, k] & , n, #1 >= k & ], k]]], 
  {1, 2, 3, 4, 5, 6}], TapTestSameBROKEN[Distance[dodec, {1, 11}], 5], 
 TapComment["A plot of the graph:"], TapTestSameBROKEN[
  HoldComplete[GraphPlot[Flatten[Thread /@ dodec], VertexLabeling -> True]], 
  $Failed]]
