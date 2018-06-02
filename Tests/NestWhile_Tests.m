(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Keep dividing by 2 until the result is no longer an even number:"], 
 ESameTest[NestWhile[#1/2 & , 123456, EvenQ], 1929], 
 EComment[
  "Iterate taking logarithms until the result is no longer positive:"], 
 ESameTest[NestWhile[Log, 100, #1 > 0 & ], Log[Log[Log[Log[100]]]]], 
 EComment["Compare the last two values generated:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, UnsameQ, 2], 0], 
 EComment["Always compare all values generated:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, (Print[{##1}]; UnsameQ[##1]) & , 
   All], 0], EComment["Start comparisons after 4 iterations, and compare \
using the 4 last values:"], ESameTest[NestWhile[Floor[#1/2] & , 10, 
   (Print[{##1}]; UnsameQ[##1]) & , 4], 0], EComment["Start comparisons after \
4 iterations, and compare using the 6 last values:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, (Print[{##1}]; UnsameQ[##1]) & , 
   {4, 6}], 0], EComment["Stop after at most 4 iterations, even if the test \
is still RefLink[True,paclet:ref/True]:"], 
 ESameTest[NestWhile[#1/2 & , 123456, EvenQ, 1, 4], 7716], 
 EComment["Continue until the result is no longer greater than 1:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity], 1], 
 EComment["Perform one more step after the condition is no longer \
RefLink[True,paclet:ref/True]:"], ESameTest[NestWhile[Floor[#1/2] & , 20, 
   #1 > 1 & , 1, Infinity, 1], 0], EComment["Return the last value for which \
the condition was still RefLink[True,paclet:ref/True]:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 20, #1 > 1 & , 1, Infinity, -1], 2], 
 EComment["Find the next prime after 888:"], 
 ESameTest[NestWhile[#1 + 1 & , 888,  !PrimeQ[#1] & ], 907], 
 EComment["Find the next twin prime after 888:"], 
 ESameTest[NestWhile[#1 + 1 & , 888,  !PrimeQ[#1] ||  !PrimeQ[#3] & , 3], 
  1021], EComment[
  "Find the index of the first Fibonacci number above a million:"], 
 ESameTest[NestWhile[#1 + 1 & , 1, Fibonacci[#1] <= 10^6 & ], 31], 
 ESameTestBROKEN[Fibonacci[%], 1346269], 
 ESameTestBROKEN[HoldComplete[ListLinePlot[
    Table[NestWhile[#1 + 1 & , 1, Fibonacci[#1] <= n & ], {n, 200}]]], 
  $Failed], EComment[
  "Find the index of the last Fibonacci number below a million:"], 
 ESameTest[NestWhile[#1 + 1 & , 1, Fibonacci[#1] <= 10^6 & , 1, Infinity, 
   -1], 30], EComment["These two forms are equivalent:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, UnsameQ, {4, 4}], 0], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, UnsameQ, 4], 0], 
 EComment["RefLink[NestWhile,paclet:ref/NestWhile] returns if the condition \
returns anything other then RefLink[True,paclet:ref/True]:"], 
 ESameTest[NestWhile[Floor[#1/2] & , a, Positive], a], 
 EComment["The outcome of a condition need not be \
RefLink[True,paclet:ref/True] or RefLink[False,paclet:ref/False]:"], 
 ESameTest[Positive[a], Positive[a]], EComment["RefLink[FixedPoint,paclet:ref\
/FixedPoint] always compares the last two values; these two forms are \
equivalent:"], ESameTestBROKEN[NestWhile[Cos, 1., UnsameQ, 2], 0.739085], 
 ESameTestBROKEN[FixedPoint[Cos, 1.], 0.739085], 
 EComment["RefLink[NestWhileList,paclet:ref/NestWhileList] applies the same \
stopping criteria, but returns all values generated:"], 
 ESameTestBROKEN[NestWhileList[(#1 + 3/#1)/2 & , 1., Unequal, 2], 
  {1., 2., 1.75, 1.73214, 1.73205, 1.73205, 1.73205}], 
 EComment["RefLink[NestWhile,paclet:ref/NestWhile] can be expressed in terms \
of a RefLink[While,paclet:ref/While] loop:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, #1 > 0 & ], 0], 
 ESameTest[x = 10; While[x > 0, x = Floor[x/2]]; x, 0]]
