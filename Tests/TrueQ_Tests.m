(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["RefLink[TrueQ,paclet:ref/TrueQ] will return \
RefLink[True,paclet:ref/True] only if the input is explicitly \
RefLink[True,paclet:ref/True]:"], ESameTest[TrueQ[True], True], 
 ESameTest[TrueQ[False], False], ESameTest[TrueQ[x], False]]
