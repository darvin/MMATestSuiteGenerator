(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The body can be included as part of the test:"], 
 TapTestSame[n = 1; While[++n < 4]; n, 4], 
 TapTestSame[n = 1; While[n < 4, n++]; n, 4], TapTestSameBROKEN[n, 11], 
 TapComment["Compute the GCD of two numbers:"], 
 TapTestSame[{a, b} = {27, 6}; While[b != 0, {a, b} = {b, Mod[a, b]}]; a, 3], 
 TapComment["Count the number of iterations in a fixed-point calculation:"], 
 TapTestSameBROKEN[x = 1.; i = 0; While[Cos[x] != x, x = Cos[x]; i++]; 
   {x, i}, {0.739085, 80}], 
 TapComment[
  "RefLink[While,paclet:ref/While] returns RefLink[Null,paclet:ref/Null]:"], 
 TapTestSameBROKEN[FullForm[n = 1; While[n < 5, n++]], Null], 
 TapComment["Use RefLink[Print,paclet:ref/Print] to see the iterations:"], 
 TapTestSame[n = 17; While[(n = Floor[n/2]) != 0, Print[n]]; n, 0], 
 TapComment["RefLink[Do,paclet:ref/Do] iterates a fixed number of times:"], 
 TapTestSameBROKEN[x = 1.; Do[x = (x + 2/x)/2, {5}]; x, 1.41421], 
 TapComment["RefLink[NestWhile,paclet:ref/NestWhile] is a functional form of \
RefLink[While,paclet:ref/While]:"], 
 TapTestSame[NestWhile[Floor[#1/2] & , 10, #1 > 0 & ], 0], 
 TapTestSame[x = 10; While[x > 0, x = Floor[x/2]]; x, 0]]
