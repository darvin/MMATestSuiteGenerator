(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Evaluate different types of numbers:"], 
 ESameTest[Positive[{1.6, 3/4, Pi, 0, -5, 1 + I, Sin[10^5]}], 
  {True, True, True, False, False, False, True}], 
 EComment["Quantities that are not RefLink[NumericQ,paclet:ref/NumericQ] \
remain unevaluated:"], ESameTest[Positive[{x, Sin[y]}], 
  {Positive[x], Positive[Sin[y]]}]]
