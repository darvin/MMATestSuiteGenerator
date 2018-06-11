(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{a, a^2, y, z}]], 
 TapTestSame[{x, x^2, y, z} /. x -> {a, b}, {{a, b}, {a^2, b^2}, y, z}], 
 TapTestSame[Sin[x] /. Sin -> Cos, Cos[x]], 
 TapTestSame[1 + x^2 + x^4 /. x^(p_) -> f[p], 1 + f[2] + f[4]], 
 TapTestSame[x /. {x -> 1, x -> 3, x -> 7}, 1], 
 TapTestSame[x /. {{x -> 1}, {x -> 3}, {x -> 7}}, {1, 3, 7}], 
 TapTestSame[{a, b, c} /. List -> f, f[a, b, c]], 
 TapTestSameBROKEN[{x, x, x} /. x :> RandomReal[], 
  {0.0163641, 0.727604, 0.469022}], 
 TapComment["Structurally insert into a held expression:"], 
 TapTestSame[Hold[x + x] /. x -> 7, Hold[7 + 7]], 
 TapComment["Do not evaluate the right-hand side of the rule before doing the \
replacement:"], TapTestSame[Hold[x + x] /. x :> 2^2, Hold[2^2 + 2^2]], 
 TapComment["Evaluate before replacement:"], 
 TapTestSame[Hold[x + x] /. x -> 2^2, Hold[4 + 4]], 
 TapTestSame[{a, b, c} /. a -> b /. b -> d, {d, d, c}], 
 TapTestSame[{a, b, c} /. {a -> b, b -> d}, {b, d, c}], 
 TapTestSame[{g[1], Hold[g[1]]} /. g[n_] :> n + 1, {2, Hold[1 + 1]}]]
