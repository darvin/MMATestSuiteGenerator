(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Feed an unevaluated expression to RefLink[Length,paclet:ref/Length]: "], 
 TapTestSame[Length[Unevaluated[5 + 6 + 7 + 8]], 4], 
 TapTestSameBROKEN[symbolLength[xyzzy], 5], 
 TapTestSameBROKEN[f[Unevaluated[1 + 1]], g[2]], 
 TapComment["RefLink[Unevaluated,paclet:ref/Unevaluated] stops \
RefLink[Evaluate,paclet:ref/Evaluate]:"], 
 TapTestSame[Hold[Evaluate[Unevaluated[1 + 2]]], Hold[Unevaluated[1 + 2]]], 
 TapTestSame[f[Unevaluated[1 + 2]], f[Unevaluated[1 + 2]]]]
