(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Keep dividing by 2 until the result is no longer an even number:"], 
 ESameTest[NestWhileList[#1/2 & , 123456, EvenQ], 
  {123456, 61728, 30864, 15432, 7716, 3858, 1929}], 
 EComment[
  "Iterate taking logarithms until the result is no longer positive:"], 
 ESameTest[NestWhileList[Log, 100, #1 > 0 & ], {100, Log[100], Log[Log[100]], 
   Log[Log[Log[100]]], Log[Log[Log[Log[100]]]]}], 
 EComment[
  "Start comparisons after 4 iterations, and compare using the 4 last \
values:"], ESameTest[NestWhileList[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , 4], {10, 5, 2, 1, 0, 0}], 
 EComment[
  "Start comparisons after 4 iterations, and compare using the 6 last \
values:"], ESameTest[NestWhileList[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , {4, 6}], {10, 5, 2, 1, 0, 0}], 
 EComment["Always compare all values generated:"], 
 ESameTest[NestWhileList[Floor[#1/2] & , 10, (Print[{##1}]; UnsameQ[##1]) & , 
   All], {10, 5, 2, 1, 0, 0}], EComment["Stop after at most 4 steps, even if \
the condition is still RefLink[True,paclet:ref/True]:"], 
 ESameTest[NestWhileList[Floor[#1/2] & , 20, UnsameQ, 2, 4], 
  {20, 10, 5, 2, 1}], 
 EComment["Continue until the result is no longer greater than 1:"], 
 ESameTest[NestWhileList[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity], 
  {20, 10, 5, 2, 1}], EComment["Perform one more step after the condition is \
no longer RefLink[True,paclet:ref/True]:"], 
 ESameTest[NestWhileList[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity, 1], 
  {20, 10, 5, 2, 1, 0}], EComment["Drop the last value generated (for which \
the test was no longer RefLink[True,paclet:ref/True]):"], 
 ESameTest[NestWhileList[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity, -1], 
  {20, 10, 5, 2}], 
 EComment["Find successive integers until a prime is reached:"], 
 ESameTest[NestWhileList[#1 + 1 & , 899,  !PrimeQ[#1] & ], 
  {899, 900, 901, 902, 903, 904, 905, 906, 907}], 
 EComment["Find the multiplicative order of 2 modulo 19:"], 
 ESameTest[NestWhileList[Mod[2*#1, 19] & , 2, #1 != 1 & ], 
  {2, 4, 8, 16, 13, 7, 14, 9, 18, 17, 15, 11, 3, 6, 12, 5, 10, 1}], 
 ESameTestBROKEN[Length[%], 18], EComment["Use \
RefLink[MultiplicativeOrder,paclet:ref/MultiplicativeOrder] to compute \
directly:"], ESameTest[MultiplicativeOrder[2, 19], 18], 
 EComment["Find the orbit of 4 under the mapping 5x  mod 7:"], 
 ESameTest[NestWhileList[Mod[5*#1, 7] & , 4, Unequal, All], 
  {4, 6, 2, 3, 1, 5, 4}], 
 EComment[
  "Keep applying iterations in the 3n+1 problem until the results repeat:"], 
 ESameTest[NestWhileList[If[EvenQ[#1], #1/2, (3*#1 + 1)/2] & , 400, Unequal, 
   All], {400, 200, 100, 50, 25, 38, 19, 29, 44, 22, 11, 17, 26, 13, 20, 10, 
   5, 8, 4, 2, 1, 2}], 
 EComment["Exclude the first repeating element from the output:"], 
 ESameTest[NestWhileList[If[EvenQ[#1], #1/2, (3*#1 + 1)/2] & , 400, Unequal, 
   All, Infinity, -1], {400, 200, 100, 50, 25, 38, 19, 29, 44, 22, 11, 17, 
   26, 13, 20, 10, 5, 8, 4, 2, 1}], EComment["Apply Newton iterations for \
Sqrt[2] until successive results are within 0.001."], 
 ESameTest[NestWhileList[(#1 + 2/#1)/2 & , 1, Abs[#1 - #2] > 0.001 & , 2], 
  {1, 3/2, 17/12, 577/408, 665857/470832}], 
 EComment["These two forms are equivalent:"], 
 ESameTest[NestWhileList[Floor[#1/2] & , 10, UnsameQ, {4, 4}], 
  {10, 5, 2, 1, 0, 0}], ESameTest[NestWhileList[Floor[#1/2] & , 10, UnsameQ, 
   4], {10, 5, 2, 1, 0, 0}], EComment["RefLink[NestWhileList,paclet:ref/NestW\
hileList] returns all intermediate values of \
RefLink[NestWhile,paclet:ref/NestWhile]:"], 
 ESameTest[NestWhileList[#1/2 & , 123456, EvenQ], 
  {123456, 61728, 30864, 15432, 7716, 3858, 1929}], 
 ESameTest[Reap[NestWhile[Sow[#1]/2 & , 123456, EvenQ]], 
  {1929, {{123456, 61728, 30864, 15432, 7716, 3858}}}], 
 EComment["RefLink[FixedPointList,paclet:ref/FixedPointList] always compares \
the last two values; these two forms are equivalent:"], 
 ESameTestBROKEN[NestWhileList[(#1 + 3/#1)/2 & , 1., UnsameQ, 2], 
  {1., 2., 1.75, 1.73214, 1.73205, 1.73205, 1.73205}], 
 ESameTestBROKEN[FixedPointList[(#1 + 3/#1)/2 & , 1.], 
  {1., 2., 1.75, 1.73214, 1.73205, 1.73205, 1.73205}], 
 EComment["Find the digits of a number:"], 
 ESameTest[With[{n = 123456, k = 10}, 
   Reverse[Mod[NestWhileList[Quotient[#1, k] & , n, #1 >= k & ], k]]], 
  {1, 2, 3, 4, 5, 6}], ESameTestBROKEN[Distance[dodec, {1, 11}], 5], 
 EComment["A plot of the graph:"], ESameTestBROKEN[
  HoldComplete[GraphPlot[Flatten[Thread /@ dodec], VertexLabeling -> True]], 
  $Failed]]
