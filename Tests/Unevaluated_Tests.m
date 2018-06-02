(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Feed an unevaluated expression to RefLink[Length,paclet:ref/Length]: "], 
 ESameTest[Length[Unevaluated[5 + 6 + 7 + 8]], 4], 
 ESameTestBROKEN[symbolLength[xyzzy], 5], 
 ESameTestBROKEN[f[Unevaluated[1 + 1]], g[2]], 
 EComment["RefLink[Unevaluated,paclet:ref/Unevaluated] stops \
RefLink[Evaluate,paclet:ref/Evaluate]:"], 
 ESameTest[Hold[Evaluate[Unevaluated[1 + 2]]], Hold[Unevaluated[1 + 2]]], 
 ESameTest[f[Unevaluated[1 + 2]], f[Unevaluated[1 + 2]]]]
