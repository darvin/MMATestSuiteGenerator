(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Evaluate different types of numbers:"], 
 TapTestSame[Positive[{1.6, 3/4, Pi, 0, -5, 1 + I, Sin[10^5]}], 
  {True, True, True, False, False, False, True}], 
 TapComment["Quantities that are not RefLink[NumericQ,paclet:ref/NumericQ] \
remain unevaluated:"], TapTestSame[Positive[{x, Sin[y]}], 
  {Positive[x], Positive[Sin[y]]}]]
