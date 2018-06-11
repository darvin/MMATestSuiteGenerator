(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[
   {f[a, {1}], f[b, {2}], f[c, {3}], f[d, {4}]}]], 
 TapComment["#2 gives the indices of each part:"], 
 TapTestSame[MapIndexed[First[#2] + f[#1] & , {a, b, c, d}], 
  {1 + f[a], 2 + f[b], 3 + f[c], 4 + f[d]}], 
 TapTestSame[MapIndexed[f, {{a, b}, {c, d, e}}], 
  {f[{a, b}, {1}], f[{c, d, e}, {2}]}], 
 TapTestSame[MapIndexed[f, {{a, b}, {c, d, e}}, {2}], 
  {{f[a, {1, 1}], f[b, {1, 2}]}, {f[c, {2, 1}], f[d, {2, 2}], 
    f[e, {2, 3}]}}], TapComment["Map over an association:"], 
 TapTestSameBROKEN[MapIndexed[f, \[LeftAssociation] "a" -> 1, a -> 2, 
    1 -> 1 \[RightAssociation]], \[LeftAssociation] a -> f[1, {Key[a]}], 
   a -> f[2, {Key[a]}], 1 -> f[1, {Key[1]}] \[RightAssociation]], 
 TapComment["Map over nested associations:"], 
 TapTestSame[MapIndexed[h, \[LeftAssociation] 
    a -> \[LeftAssociation] b -> c, p -> \[LeftAssociation] 
        q -> r \[RightAssociation] \[RightAssociation], 
    d -> {e} \[RightAssociation], {2}], \[LeftAssociation] 
   a -> \[LeftAssociation] b -> h[c, {Key[a], Key[b]}], 
     p -> h[\[LeftAssociation] q -> r \[RightAssociation], 
       {Key[a], Key[p]}] \[RightAssociation], 
   d -> {h[e, {Key[d], 1}]} \[RightAssociation]], 
 TapComment[
  "Use the operator form of RefLink[MapIndexed,paclet:ref/MapIndexed]:"], 
 TapTestSameBROKEN[MapIndexed[f][{a, b, c, d}], 
  {f[a, {1}], f[b, {2}], f[c, {3}], f[d, {4}]}], 
 TapComment["Map at level 1 (default):"], 
 TapTestSame[MapIndexed[f, {{{{{a}}}}}], {f[{{{{a}}}}, {1}]}], 
 TapComment["Map down to level 2:"], 
 TapTestSame[MapIndexed[f, {{{{{a}}}}}, 2], {f[{f[{{{a}}}, {1, 1}]}, {1}]}], 
 TapComment["Map at level 2:"], TapTestSame[MapIndexed[f, {{{{{a}}}}}, {2}], 
  {{f[{{{a}}}, {1, 1}]}}], TapComment["Map down to level 3:"], 
 TapTestSame[MapIndexed[f, {{{{{a}}}}}, 3], 
  {f[{f[{f[{{a}}, {1, 1, 1}]}, {1, 1}]}, {1}]}], 
 TapComment["Map onto all elements of an expression:"], 
 TapTestSame[MapIndexed[f, {{a, b}, {c, d, {e}}}, Infinity], 
  {f[{f[a, {1, 1}], f[b, {1, 2}]}, {1}], 
   f[{f[c, {2, 1}], f[d, {2, 2}], f[{f[e, {2, 3, 1}]}, {2, 3}]}, {2}]}], 
 TapComment["Map only onto the \"leaves\" of the expression:"], 
 TapTestSame[MapIndexed[f, {{a, b}, {c, d, {e}}}, {-1}], 
  {{f[a, {1, 1}], f[b, {1, 2}]}, {f[c, {2, 1}], f[d, {2, 2}], 
    {f[e, {2, 3, 1}]}}}], TapComment["Negative levels:"], 
 TapTestSame[MapIndexed[f, {{{{a}}}}, -1], 
  {f[{f[{f[{f[a, {1, 1, 1, 1}]}, {1, 1, 1}]}, {1, 1}]}, {1}]}], 
 TapTestSame[MapIndexed[f, {{{{a}}}}, -2], 
  {f[{f[{f[{a}, {1, 1, 1}]}, {1, 1}]}, {1}]}], 
 TapTestSame[MapIndexed[f, {{{{a}}}}, -3], {f[{f[{{a}}, {1, 1}]}, {1}]}], 
 TapComment["Different heads at each level:"], 
 TapTestSame[MapIndexed[f, h0[h1[h2[h3[h4[a]]]]], {2, -3}], 
  h0[h1[f[h2[f[h3[h4[a]], {1, 1, 1}]], {1, 1}]]]], 
 TapComment["Map on levels 0 through 1; the head has index {}:"], 
 TapTestSame[MapIndexed[f, {a, b}, {0, 1}], f[{f[a, {1}], f[b, {2}]}, {}]], 
 TapComment["RefLink[MapIndexed,paclet:ref/MapIndexed] can be used on \
expressions with any head:"], TapTestSame[MapIndexed[f, a + b + c + d], 
  f[a, {1}] + f[b, {2}] + f[c, {3}] + f[d, {4}]], 
 TapComment["The function can be mapped onto the heads as well:"], 
 TapTestSame[MapIndexed[f, {a, b, c}, Heads -> True], 
  f[List, {0}][f[a, {1}], f[b, {2}], f[c, {3}]]], 
 TapComment[
  "RefLink[MapIndexed,paclet:ref/MapIndexed] works on sparse arrays:"], 
 TapTestSame[MapIndexed[f, SparseArray[3 -> a, 5]], 
  {f[0, {1}], f[0, {2}], f[a, {3}], f[0, {4}], f[0, {5}]}], 
 TapComment["By default, the function is not mapped onto the heads:"], 
 TapTestSame[MapIndexed[f, {a, b, c}], {f[a, {1}], f[b, {2}], f[c, {3}]}], 
 TapTestSame[MapIndexed[f, {a, b, c}, Heads -> True], 
  f[List, {0}][f[a, {1}], f[b, {2}], f[c, {3}]]], 
 TapComment["Map onto the heads at all levels:"], 
 TapTestSame[MapIndexed[f, p[x][a, b, c], Infinity, Heads -> True], 
  f[f[p, {0, 0}][f[x, {0, 1}]], {0}][f[a, {1}], f[b, {2}], f[c, {3}]]], 
 TapComment["Label parts by position:"], TapTestSameBROKEN[
  MapIndexed[Labeled, {x^2, x + y, y^2, y^3}], {x^2*{1}, x + y*{2}, y^2*{3}, 
   y^3*{4}}], TapTestSameBROKEN[HoldComplete[
   MapIndexed[Framed[Labeled[#1, #2]] & , {x^2, x + y, y^2, y^3}, Infinity]], 
  $Failed], TapComment[
  "Use tooltips to show part numbers of subexpressions:"], 
 TapTestSameBROKEN[MapIndexed[Tooltip, Integrate[1/(x^4 - 1), x], Infinity], 
  (-(1/2))*ArcTan[x] + (1/4)*Log[-1 + x] + (-(1/4))*Log[1 + x]], 
 TapComment["Convert a list to a polynomial:"], 
 TapTestSame[Total[MapIndexed[#1*x^First[#2] & , {a, b, c, d, e}]], 
  a*x + b*x^2 + c*x^3 + d*x^4 + e*x^5], 
 TapComment["Rotate lists based on position:"], 
 TapTestSame[MapIndexed[RotateLeft, Table[{a, b, c}, {6}]], 
  {{b, c, a}, {c, a, b}, {a, b, c}, {b, c, a}, {c, a, b}, {a, b, c}}], 
 TapTestSameBROKEN[HoldComplete[MatrixForm[MapIndexed[RotateLeft, 
     Table[{{a, b}, {c, d}}, {3}, {3}], {2}]]], $Failed], 
 TapComment["Obtain a list of all parts in an expression:"], 
 TapTestSame[First[Last[Reap[MapIndexed[Sow[#2] & , {{a, b}, {c}, {{d}}}, 
      {1, Infinity}]]]], {{1, 1}, {1, 2}, {1}, {2, 1}, {2}, {3, 1, 1}, 
   {3, 1}, {3}}], TapTestSame[Position[{{a, b}, {c}, {{d}}}, _, Infinity, 
   Heads -> False], {{1, 1}, {1, 2}, {1}, {2, 1}, {2}, {3, 1, 1}, {3, 1}, 
   {3}}], TapComment["Using only the first argument is equivalent to using \
RefLink[Map,paclet:ref/Map]:"], TapTestSame[MapIndexed[f[#1] & , {a, b, c}], 
  {f[a], f[b], f[c]}], TapTestSame[f /@ {a, b, c}, {f[a], f[b], f[c]}]]