(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[Log[Sqrt[a*(b*c^d)^e]] //. rules, 
  (1/2)*(Log[a] + e*(Log[b] + d*Log[c]))], 
 TapComment[
  "RefLink[ReplaceAll,paclet:ref/ReplaceAll] does just a single replacement:"]\
, TapTestSameBROKEN[Log[Sqrt[a*(b*c^d)^e]] /. rules, (1/2)*Log[a*(b*c^d)^e]], 
 TapComment["Undo \"currying\" of function arguments:"], 
 TapTestSame[f[a][b][c][d] //. (g_)[x_][y__] -> g[x, y], f[a, b, c, d]]]
