(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["RefLink[BooleanQ,paclet:ref/BooleanQ] gives \
RefLink[True,paclet:ref/True] on either RefLink[True,paclet:ref/True] or \
RefLink[False,paclet:ref/False]:"], ESameTestBROKEN[BooleanQ[False], True], 
 EComment["On anything else it gives RefLink[False,paclet:ref/False]:"], 
 ESameTestBROKEN[BooleanQ[x], False]]
