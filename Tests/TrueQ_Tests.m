(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[TrueQ,paclet:ref/TrueQ] will return \
RefLink[True,paclet:ref/True] only if the input is explicitly \
RefLink[True,paclet:ref/True]:"], TapTestSame[TrueQ[True], True], 
 TapTestSame[TrueQ[False], False], TapTestSame[TrueQ[x], False]]
