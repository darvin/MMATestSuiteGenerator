(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[1]], 
 TapTestSame[Depth[{a}], 2], TapTestSame[Depth[{{{a}}}], 4], 
 TapTestSame[Depth[{{{a}, b}}], 4], 
 TapComment["Depth of an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Depth[\[LeftAssociation] 1 -> a \[RightAssociation]], 2], 
 TapTestSame[Depth[\[LeftAssociation] 1 -> {a} \[RightAssociation]], 3], 
 TapComment[
  "Depth of a nested RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Depth[\[LeftAssociation] 
    1 -> \[LeftAssociation] 2 -> 3 \[RightAssociation] \[RightAssociation]], 
  3], TapComment[
  "RefLink[Depth,paclet:ref/Depth] works on any expression, not just lists:"]\
, TapTestSame[Depth[1 + x + x^2 + x^5], 3], 
 TapComment["RefLink[Depth,paclet:ref/Depth] does not distinguish heads:"], 
 TapTestSame[Depth[f[g[h[x]]]], 4], TapComment["All numbers have depth 1:"], 
 TapTestSame[Depth[12345], 1], TapTestSame[Depth[3 + I], 1], 
 TapComment["RefLink[Depth,paclet:ref/Depth] works with \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSameBROKEN[HoldComplete[SparseArray[{{{{x}}}}]], $Failed], 
 TapTestSameBROKEN[Depth[%], 5], 
 TapComment["Find how deeply nested results from integrals are:"], 
 TapTestSameBROKEN[Table[Depth[Integrate[1/(x^n - 1), x]], {n, 10}], 
  {3, 5, 7, 5, 10, 8, 8, 8, 9, 10}], TapComment["Find the depths of \
combinator expressions WebLink[[more \
info]:,http://www.wolframscience.com/nksonline/page-1122a-text]"], 
 TapTestSame[NestList[#1 /. s[x_][y_][z_] -> x[z][y[z]] & , 
   s[s][s][s[s]][s][s], 4], {s[s][s][s[s]][s][s], s[s[s]][s[s[s]]][s][s], 
   s[s][s][s[s[s]][s]][s], s[s[s[s]][s]][s[s[s[s]][s]]][s], 
   s[s[s]][s][s][s[s[s[s]][s]][s]]}], TapTestSameBROKEN[Depth /@ %, 
  {2, 2, 2, 2, 3}], TapTestSame[
  Depth /@ NestList[#1 /. s[x_][y_][z_] -> x[z][y[z]] & , 
    s[s][s][s[s]][s][s], 30], {2, 2, 2, 2, 3, 3, 3, 4, 5, 6, 6, 6, 7, 8, 8, 
   8, 9, 10, 11, 11, 11, 12, 13, 13, 13, 14, 14, 14, 14, 14, 14}], 
 TapComment["RefLink[Depth,paclet:ref/Depth] gives the length of the maximum \
index, plus 1:"], TapTestSame[Position[(1 + x)*(2 + y^3), _], 
  {{0}, {1, 0}, {1, 1}, {1, 2}, {1}, {2, 0}, {2, 1}, {2, 2, 0}, {2, 2, 1}, 
   {2, 2, 2}, {2, 2}, {2}, {}}], TapTestSame[Depth[(1 + x)*(2 + y^3)], 4], 
 TapComment["Successive elements from RefLink[NestList,paclet:ref/NestList] \
have larger depths:"], TapTestSame[NestList[f, x, 5], 
  {x, f[x], f[f[x]], f[f[f[x]]], f[f[f[f[x]]]], f[f[f[f[f[x]]]]]}], 
 TapTestSameBROKEN[Depth /@ %, {1, 2, 3, 4, 5, 6}], 
 TapComment[
  "RefLink[Depth,paclet:ref/Depth] does not count depth in the head:"], 
 TapTestSame[Depth[h[{{{a}}}][x, y]], 2], TapComment["RefLink[Depth,paclet:re\
f/Depth] counts an RefLink[Association,paclet:ref/Association] as a single \
level:"], TapTestSame[Depth[\[LeftAssociation] a -> x, 
    b -> y \[RightAssociation]], 2], 
 TapComment["It counts a list of rules as two levels:"], 
 TapTestSame[Depth[{a -> x, b -> y}], 3]]
