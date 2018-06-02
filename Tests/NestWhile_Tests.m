(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Keep dividing by 2 until the result is no longer an even number:"], 
 TapTestSame[NestWhile[#1/2 & , 123456, EvenQ], 1929], 
 TapComment[
  "Iterate taking logarithms until the result is no longer positive:"], 
 TapTestSame[NestWhile[Log, 100, #1 > 0 & ], Log[Log[Log[Log[100]]]]], 
 TapComment["Compare the last two values generated:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, UnsameQ, 2], 0], 
 TapComment["Always compare all values generated:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, (Print[{##1}]; UnsameQ[##1]) & , 
   All], 0], TapComment["Start comparisons after 4 iterations, and compare \
using the 4 last values:"], TapTestSame[NestWhile[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , 4], 0], TapComment["Start comparisons \
after 4 iterations, and compare using the 6 last values:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, (Print[{##1}]; UnsameQ[##1]) & , 
   {4, 6}], 0], TapComment["Stop after at most 4 iterations, even if the test \
is still RefLink[True,paclet:ref/True]:"], 
 TapTestSame[NestWhile[#1/2 & , 123456, EvenQ, 1, 4], 7716], 
 TapComment["Continue until the result is no longer greater than 1:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity], 1], 
 TapComment["Perform one more step after the condition is no longer \
RefLink[True,paclet:ref/True]:"], TapTestSame[NestWhile[Floor[#1/2] & , 20, 
   #1 > 1 & , 1, Infinity, 1], 0], TapComment["Return the last value for \
which the condition was still RefLink[True,paclet:ref/True]:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity, -1], 2], 
 TapComment["Find the next prime after 888:"], 
 TapTestSame[NestWhile[#1 + 1 & , 888,  !PrimeQ[#1] & ], 907], 
 TapComment["Find the next twin prime after 888:"], 
 TapTestSame[NestWhile[#1 + 1 & , 888,  !PrimeQ[#1] ||  !PrimeQ[#3] & , 3], 
  1021], TapComment[
  "Find the index of the first Fibonacci number above a million:"], 
 TapTestSame[NestWhile[#1 + 1 & , 1, Fibonacci[#1] <= 10^6 & ], 31], 
 TapTestSameBROKEN[Fibonacci[%], 1346269], 
 TapTestSameBROKEN[HoldComplete[ListLinePlot[
    Table[NestWhile[#1 + 1 & , 1, Fibonacci[#1] <= n & ], {n, 200}]]], 
  $Failed], TapComment[
  "Find the index of the last Fibonacci number below a million:"], 
 TapTestSame[NestWhile[#1 + 1 & , 1, Fibonacci[#1] <= 10^6 & , 1, Infinity, 
   -1], 30], TapComment["These two forms are equivalent:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, UnsameQ, {4, 4}], 0], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, UnsameQ, 4], 0], 
 TapComment["RefLink[NestWhile,paclet:ref/NestWhile] returns if the condition \
returns anything other then RefLink[True,paclet:ref/True]:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , a, Positive], a], 
 TapComment["The outcome of a condition need not be \
RefLink[True,paclet:ref/True] or RefLink[False,paclet:ref/False]:"], 
 TapTestSame[Positive[a], Positive[a]], TapComment["RefLink[FixedPoint,paclet\
:ref/FixedPoint] always compares the last two values; these two forms are \
equivalent:"], TapTestSameBROKEN[NestWhile[Cos, 1., UnsameQ, 2], 0.739085], 
 TapTestSameBROKEN[FixedPoint[Cos, 1.], 0.739085], 
 TapComment["RefLink[NestWhileList,paclet:ref/NestWhileList] applies the same \
stopping criteria, but returns all values generated:"], 
 TapTestSameBROKEN[NestWhileList[(#1 + 3/#1)/2 & , 1., Unequal, 2], 
  {1., 2., 1.75, 1.73214, 1.73205, 1.73205, 1.73205}], 
 TapComment["RefLink[NestWhile,paclet:ref/NestWhile] can be expressed in \
terms of a RefLink[While,paclet:ref/While] loop:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, #1 > 0 & ], 0], 
 TapTestSame[x = 10; While[x > 0, x = Floor[x/2]]; x, 0]]
