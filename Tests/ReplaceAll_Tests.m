(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[{x, x^2, y, z} /. x -> a, {a, a^2, y, z}], 
 ESameTest[{x, x^2, y, z} /. x -> {a, b}, {{a, b}, {a^2, b^2}, y, z}], 
 ESameTest[Sin[x] /. Sin -> Cos, Cos[x]], 
 ESameTest[1 + x^2 + x^4 /. x^(p_) -> f[p], 1 + f[2] + f[4]], 
 ESameTest[x /. {x -> 1, x -> 3, x -> 7}, 1], 
 ESameTest[x /. {{x -> 1}, {x -> 3}, {x -> 7}}, {1, 3, 7}], 
 ESameTest[{a, b, c} /. List -> f, f[a, b, c]], 
 ESameTestBROKEN[{x, x, x} /. x :> RandomReal[], 
  {0.0163641, 0.727604, 0.469022}], 
 EComment["Structurally insert into a held expression:"], 
 ESameTest[Hold[x + x] /. x -> 7, Hold[7 + 7]], 
 EComment["Do not evaluate the right-hand side of the rule before doing the \
replacement:"], ESameTest[Hold[x + x] /. x :> 2^2, Hold[2^2 + 2^2]], 
 EComment["Evaluate before replacement:"], ESameTest[Hold[x + x] /. x -> 2^2, 
  Hold[4 + 4]], ESameTest[{a, b, c} /. a -> b /. b -> d, {d, d, c}], 
 ESameTest[{a, b, c} /. {a -> b, b -> d}, {b, d, c}], 
 ESameTest[{g[1], Hold[g[1]]} /. g[n_] :> n + 1, {2, Hold[1 + 1]}]]
