(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Use a rule that replaces x by 3:"], 
 ESameTest[{x, x^2, a, b} /. x -> 3, {3, 9, a, b}], 
 EComment["Any expression or pattern can appear in a rule:"], 
 ESameTest[{x, x^2, x^3, a, b} /. x^2 -> y, {x, y, x^3, a, b}], 
 ESameTest[{x, x^2, x^3, a, b} /. x^(n_) -> f[n], {x, f[2], f[3], a, b}], 
 EComment["-> evaluates when it is first entered; :> when it is used:"], 
 ESameTestBROKEN[{x, x, x, x} /. x -> RandomReal[], 
  {0.526621, 0.526621, 0.526621, 0.526621}], 
 ESameTestBROKEN[{x, x, x, x} /. x :> RandomReal[], 
  {0.123567, 0.815383, 0.768442, 0.930826}], 
 EComment["-> groups to the right:"], ESameTestBROKEN[FullForm[x -> y -> z], 
  x -> y -> z], ESameTest[x /. x -> y -> z, y -> z]]
