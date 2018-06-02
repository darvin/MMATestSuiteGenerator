(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether 9 is odd:"], TapTestSame[OddQ[9], True], 
 TapComment["RefLink[OddQ,paclet:ref/OddQ] gives \
RefLink[False,paclet:ref/False] for non-numeric expressions:"], 
 TapTestSame[OddQ[x], False], 
 TapComment["Test whether a vector consists of odd integers:"], 
 TapTestSame[VectorQ[{1, 5, 7, 11}, OddQ], True], 
 TapTestSame[VectorQ[{2, 5, 7, 11}, OddQ], False], 
 TapComment["An integer is either odd or even. Use \
RefLink[EvenQ,paclet:ref/EvenQ] to check that an integer is even:"], 
 TapTestSame[OddQ[2], False], TapTestSame[EvenQ[2], True], 
 TapComment["Odd integers are not divisible by 2:"], 
 TapTestSame[OddQ[15], True], TapTestSame[ !Divisible[15, 2], True], 
 TapTestSame[OddQ[x], False], 
 TapComment["It is necessary to use symbolic simplification first:"], 
 TapTestSameBROKEN[FullSimplify[x], 3]]
