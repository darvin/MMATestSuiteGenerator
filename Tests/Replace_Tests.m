(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[Replace,paclet:ref/Replace] by default applies \
rules only to complete expressions:"], 
 TapTestSame[Replace[x^2, x^2 -> a + b], a + b], 
 TapComment["It does not map down to subparts:"], 
 TapTestSame[Replace[1 + x^2, x^2 -> a + b], 1 + x^2], 
 TapComment["A list of rules gives a list of results:"], 
 TapTestSame[Replace[x, {{x -> a}, {x -> b}}], {a, b}], 
 TapComment["Replace at level 1:"], 
 TapTestSame[Replace[1 + x^2, x^2 -> a + b, {1}], 1 + a + b], 
 TapComment["RefLink[Replace,paclet:ref/Replace] also works with \
RefLink[RuleDelayed,paclet:ref/RuleDelayed]:"], 
 TapTestSameBROKEN[Replace[{x, x, x}, x :> RandomReal[], {1}], 
  {0.921434, 0.760332, 0.860225}]]
