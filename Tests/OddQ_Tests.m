(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test whether 9 is odd:"], ESameTest[OddQ[9], True], 
 EComment["RefLink[OddQ,paclet:ref/OddQ] gives \
RefLink[False,paclet:ref/False] for non-numeric expressions:"], 
 ESameTest[OddQ[x], False], 
 EComment["Test whether a vector consists of odd integers:"], 
 ESameTest[VectorQ[{1, 5, 7, 11}, OddQ], True], 
 ESameTest[VectorQ[{2, 5, 7, 11}, OddQ], False], 
 EComment["An integer is either odd or even. Use \
RefLink[EvenQ,paclet:ref/EvenQ] to check that an integer is even:"], 
 ESameTest[OddQ[2], False], ESameTest[EvenQ[2], True], 
 EComment["Odd integers are not divisible by 2:"], ESameTest[OddQ[15], True], 
 ESameTest[ !Divisible[15, 2], True], ESameTest[OddQ[x], False], 
 EComment["It is necessary to use symbolic simplification first:"], 
 ESameTestBROKEN[FullSimplify[x], 3]]
