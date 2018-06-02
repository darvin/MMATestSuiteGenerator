(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTestBROKEN[Log[Sqrt[a*(b*c^d)^e]] //. rules, 
  (1/2)*(Log[a] + e*(Log[b] + d*Log[c]))], 
 EComment[
  "RefLink[ReplaceAll,paclet:ref/ReplaceAll] does just a single replacement:"]\
, ESameTestBROKEN[Log[Sqrt[a*(b*c^d)^e]] /. rules, (1/2)*Log[a*(b*c^d)^e]], 
 EComment["Undo \"currying\" of function arguments:"], 
 ESameTest[f[a][b][c][d] //. (g_)[x_][y__] -> g[x, y], f[a, b, c, d]]]
