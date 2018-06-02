(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Use a rule that replaces x by 3:"], 
 TapTestSame[{x, x^2, a, b} /. x -> 3, {3, 9, a, b}], 
 TapComment["Any expression or pattern can appear in a rule:"], 
 TapTestSame[{x, x^2, x^3, a, b} /. x^2 -> y, {x, y, x^3, a, b}], 
 TapTestSame[{x, x^2, x^3, a, b} /. x^(n_) -> f[n], {x, f[2], f[3], a, b}], 
 TapComment["-> evaluates when it is first entered; :> when it is used:"], 
 TapTestSameBROKEN[{x, x, x, x} /. x -> RandomReal[], 
  {0.526621, 0.526621, 0.526621, 0.526621}], 
 TapTestSameBROKEN[{x, x, x, x} /. x :> RandomReal[], 
  {0.123567, 0.815383, 0.768442, 0.930826}], 
 TapComment["-> groups to the right:"], TapTestSameBROKEN[
  FullForm[x -> y -> z], x -> y -> z], TapTestSame[x /. x -> y -> z, y -> z]]
