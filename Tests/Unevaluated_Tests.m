(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Feed an unevaluated expression to RefLink[Length,paclet:ref/Length]: "], 
 TapTestSame[Length[Unevaluated[5 + 6 + 7 + 8]], 4], 
 TapComment["Find the length of a symbol's name even if it has a value:"], 
 TapTestSameBROKEN[xyzzy = 5 ;; symbolLength[xyzzy], 5], 
 TapComment["RefLink[Unevaluated,paclet:ref/Unevaluated] works only where it \
appears; it is not propagated:"], 
 TapTestSame[f[x_] := g[x]; f[Unevaluated[1 + 1]], g[2]], 
 TapComment["RefLink[Unevaluated,paclet:ref/Unevaluated] stops \
RefLink[Evaluate,paclet:ref/Evaluate]:"], 
 TapTestSame[Hold[Evaluate[Unevaluated[1 + 2]]], Hold[Unevaluated[1 + 2]]], 
 TapComment["RefLink[Unevaluated,paclet:ref/Unevaluated] inside a held \
function remains:"], TapTestSame[SetAttributes[f, HoldAll]; 
   f[Unevaluated[1 + 2]], f[Unevaluated[1 + 2]]]]
