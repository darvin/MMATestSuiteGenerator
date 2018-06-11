(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[
   {f[a], f[b], f[c], f[d], f[e]}]], TapComment["Alternative input form:"], 
 TapTestSame[f /@ {a, b, c, d, e}, {f[a], f[b], f[c], f[d], f[e]}], 
 TapComment["Use explicit pure functions:"], 
 TapTestSame[(1 + g[#1] & ) /@ {a, b, c, d, e}, 
  {1 + g[a], 1 + g[b], 1 + g[c], 1 + g[d], 1 + g[e]}], 
 TapTestSame[Function[x, x^2] /@ {1, 2, 3, 4}, {1, 4, 9, 16}], 
 TapComment["Map at top level:"], TapTestSame[f /@ {{a, b}, {c, d, e}}, 
  {f[{a, b}], f[{c, d, e}]}], TapComment["Map at level 2:"], 
 TapTestSame[Map[f, {{a, b}, {c, d, e}}, {2}], 
  {{f[a], f[b]}, {f[c], f[d], f[e]}}], TapComment["Map at levels 1 and 2:"], 
 TapTestSame[Map[f, {{a, b}, {c, d, e}}, 2], 
  {f[{f[a], f[b]}], f[{f[c], f[d], f[e]}]}], 
 TapComment["Use a map operator:"], TapTestSame[(Map[f])[{a, b, c, d}], 
  {f[a], f[b], f[c], f[d]}], TapComment["Map a function over values in \
RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[h /@ \[LeftAssociation] a -> b, c -> d \[RightAssociation], 
  \[LeftAssociation] a -> h[b], c -> h[d] \[RightAssociation]], 
 TapComment["Map at the second level of a nested \
RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Map[h, \[LeftAssociation] 
    a -> \[LeftAssociation] b -> c \[RightAssociation], 
    d -> \[LeftAssociation] e -> f \[RightAssociation] \[RightAssociation], 
   {2}], \[LeftAssociation] a -> \[LeftAssociation] 
     b -> h[c] \[RightAssociation], 
   d -> \[LeftAssociation] 
     e -> h[f] \[RightAssociation] \[RightAssociation]], 
 TapComment[
  "Map at several levels in an RefLink[Association,paclet:ref/Association]:"]\
, TapTestSame[Map[h, \[LeftAssociation] 
    a -> \[LeftAssociation] b -> c \[RightAssociation], 
    d -> {\[LeftAssociation] e -> f \[RightAssociation]} \[RightAssociation], 
   {1, 3}], \[LeftAssociation] 
   a -> h[\[LeftAssociation] b -> h[c] \[RightAssociation]], 
   d -> h[{h[\[LeftAssociation] 
        e -> h[f] \[RightAssociation]]}] \[RightAssociation]], 
 TapComment["Map at level 1 (default):"], TapTestSame[f /@ {{{{{a}}}}}, 
  {f[{{{{a}}}}]}], TapComment["Map down to level 2:"], 
 TapTestSame[Map[f, {{{{{a}}}}}, 2], {f[{f[{{{a}}}]}]}], 
 TapComment["Map at level 2:"], TapTestSame[Map[f, {{{{{a}}}}}, {2}], 
  {{f[{{{a}}}]}}], TapComment["Map on levels 0 through 2:"], 
 TapTestSame[Map[f, {{{{{a}}}}}, {0, 2}], f[{f[{f[{{{a}}}]}]}]], 
 TapComment["Map down to level 3:"], TapTestSame[Map[f, {{{{{a}}}}}, 3], 
  {f[{f[{f[{{a}}]}]}]}], TapComment[
  "Map on all levels, starting at level 1:"], TapTestSame[f //@ {{{{{a}}}}}, 
  {f[{f[{f[{f[{f[a]}]}]}]}]}], TapComment["Map also at level 0:"], 
 TapTestSame[Map[f, {{{{{a}}}}}, {0, Infinity}], 
  f[{f[{f[{f[{f[{f[a]}]}]}]}]}]], TapComment["Negative levels:"], 
 TapTestSame[Map[f, {{{{{a}}}}}, -1], {f[{f[{f[{f[{f[a]}]}]}]}]}], 
 TapTestSame[Map[f, {{{{{a}}}}}, -2], {f[{f[{f[{f[{a}]}]}]}]}], 
 TapTestSame[Map[f, {{{{{a}}}}}, -3], {f[{f[{f[{{a}}]}]}]}], 
 TapComment["Positive and negative levels can be mixed:"], 
 TapTestSame[Map[f, {{{{{a}}}}}, {2, -3}], {{f[{f[{{a}}]}]}}], 
 TapComment["Different heads at each level:"], 
 TapTestSame[Map[f, h0[h1[h2[h3[h4[a]]]]], {2, -3}], 
  h0[h1[f[h2[f[h3[h4[a]]]]]]]], 
 TapComment["Include heads in the levels specified:"], 
 TapTestSame[Map[f, {{{{a}}}}, 2, Heads -> True], 
  f[List][f[f[List][f[{{a}}]]]]], 
 TapComment[
  "RefLink[Map,paclet:ref/Map] can be used on expressions with any head:"], 
 TapTestSame[f /@ (a + b + c + d), f[a] + f[b] + f[c] + f[d]], 
 TapTestSame[Map[f, x^2 + y^2, 2], f[f[x]^f[2]] + f[f[y]^f[2]]], 
 TapComment["The function can be mapped onto the heads as well:"], 
 TapTestSame[Map[f, {a, b, c}, Heads -> True], f[List][f[a], f[b], f[c]]], 
 TapComment["Functions with attribute RefLink[Listable,paclet:ref/Listable] \
are mapped automatically:"], TapTestSame[Sqrt[{1, 2, 3, 4}], 
  {1, Sqrt[2], Sqrt[3], 2}], TapTestSame[Sqrt /@ {1, 2, 3, 4}, 
  {1, Sqrt[2], Sqrt[3], 2}], 
 TapComment["RefLink[Map,paclet:ref/Map] can be used on sparse arrays:"], 
 TapTestSameBROKEN[HoldComplete[SparseArray[{1 -> 1, 2 -> 2, 100 -> 100}]], 
  $Failed], TapTestSameBROKEN[HoldComplete[f /@ %], $Failed], 
 TapTestSameBROKEN[%[[2]], f[2]], 
 TapComment["By default, the function is not mapped onto the heads:"], 
 TapTestSame[f /@ {a, b, c}, {f[a], f[b], f[c]}], 
 TapTestSame[Map[f, {a, b, c}, Heads -> True], f[List][f[a], f[b], f[c]]], 
 TapComment["Reverse all sublists:"], 
 TapTestSame[Reverse /@ {{a, b}, {c, d}, {e, f}}, {{b, a}, {d, c}, {f, e}}], 
 TapComment["Add the same vector to every vector in a list:"], 
 TapTestSame[(#1 + {x, y} & ) /@ {{1, 1}, {2, 2}, {3, 3}, {4, 4}}, 
  {{1 + x, 1 + y}, {2 + x, 2 + y}, {3 + x, 3 + y}, {4 + x, 4 + y}}], 
 TapComment["Frame integers that are prime:"], 
 TapTestSameBROKEN[(If[PrimeQ[#1], Framed[#1], #1] & ) /@ Range[20], 
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}], 
 TapComment["A function of several arguments can be mapped with \
RefLink[MapThread,paclet:ref/MapThread]:"], 
 TapTestSame[MapThread[f, {{1, 2, 3}, {a, b, c}}], 
  {f[1, a], f[2, b], f[3, c]}], TapComment["RefLink[MapIndexed,paclet:ref/Map\
Indexed] passes the index of an element to the mapped function:"], 
 TapTestSame[MapIndexed[f, {a, b, c}], {f[a, {1}], f[b, {2}], f[c, {3}]}], 
 TapComment["RefLink[MapAll,paclet:ref/MapAll] is equivalent to a specific \
level specification in RefLink[Map,paclet:ref/Map]:"], 
 TapTestSame[Map[f, {{a, b}, {c}, {{d}}}, {0, Infinity}], 
  f[{f[{f[a], f[b]}], f[{f[c]}], f[{f[{f[d]}]}]}]], 
 TapTestSame[f //@ {{a, b}, {c}, {{d}}}, 
  f[{f[{f[a], f[b]}], f[{f[c]}], f[{f[{f[d]}]}]}]], 
 TapComment["RefLink[Scan,paclet:ref/Scan] does the same as \
RefLink[Map,paclet:ref/Map], but without returning a result:"], 
 TapTestSame[Print /@ {a, b}, {Null, Null}], TapComment["RefLink[Map,paclet:r\
ef/Map] by default starts at level 1, so does not apply the function to the \
whole expression:"], TapTestSame[Map[f, h1[h2[h3[x]]], -1], 
  h1[f[h2[f[h3[f[x]]]]]]], TapTestSame[Map[f, h1[h2[h3[x]]], {0, -1}], 
  f[h1[f[h2[f[h3[f[x]]]]]]]], 
 TapComment["Show nesting structure of an expression:"], 
 TapTestSameBROKEN[Integrate[1/(x^3 - 1), x], 
  -(ArcTan[(1 + 2*x)/Sqrt[3]]/Sqrt[3]) + (1/3)*Log[-1 + x] - 
   (1/6)*Log[1 + x + x^2]], TapTestSameBROKEN[Framed //@ %, 
  -(ArcTan[1/3^(1/2) + 2*x]/3^(1/2)) + (1/3)*Log[-1 + x] + 
   (-(1/6))*Log[1 + x + x^2]]]
