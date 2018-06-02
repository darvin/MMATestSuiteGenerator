(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Evaluate different types of numbers:"], 
 ESameTest[Negative[{1.6, 3/4, Pi, 0, -5, 1 + I, Sin[10^5]}], 
  {False, False, False, False, True, False, False}], 
 EComment["Quantities that are not RefLink[NumericQ,paclet:ref/NumericQ] \
remain unevaluated:"], ESameTest[Negative[{x, Sin[y]}], 
  {Negative[x], Negative[Sin[y]]}]]
