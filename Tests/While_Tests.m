(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["The body can be included as part of the test:"], 
 ESameTest[n = 1; While[++n < 4]; n, 4], 
 ESameTest[n = 1; While[n < 4, n++]; n, 4], ESameTestBROKEN[n, 11], 
 EComment["Compute the GCD of two numbers:"], 
 ESameTest[{a, b} = {27, 6}; While[b != 0, {a, b} = {b, Mod[a, b]}]; a, 3], 
 EComment["Count the number of iterations in a fixed-point calculation:"], 
 ESameTestBROKEN[x = 1.; i = 0; While[Cos[x] != x, x = Cos[x]; i++]; {x, i}, 
  {0.739085, 80}], 
 EComment[
  "RefLink[While,paclet:ref/While] returns RefLink[Null,paclet:ref/Null]:"], 
 ESameTestBROKEN[FullForm[n = 1; While[n < 5, n++]], Null], 
 EComment["Use RefLink[Print,paclet:ref/Print] to see the iterations:"], 
 ESameTest[n = 17; While[(n = Floor[n/2]) != 0, Print[n]]; n, 0], 
 EComment["RefLink[Do,paclet:ref/Do] iterates a fixed number of times:"], 
 ESameTestBROKEN[x = 1.; Do[x = (x + 2/x)/2, {5}]; x, 1.41421], 
 EComment["RefLink[NestWhile,paclet:ref/NestWhile] is a functional form of \
RefLink[While,paclet:ref/While]:"], 
 ESameTest[NestWhile[Floor[#1/2] & , 10, #1 > 0 & ], 0], 
 ESameTest[x = 10; While[x > 0, x = Floor[x/2]]; x, 0]]
