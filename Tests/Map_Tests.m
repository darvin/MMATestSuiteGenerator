ESimpleExamples[ESameTest[f /@ {a, b, c, d, e}, 
  {f[a], f[b], f[c], f[d], f[e]}], EComment["Alternative input form:"], 
 ESameTest[f /@ {a, b, c, d, e}, {f[a], f[b], f[c], f[d], f[e]}], 
 EComment["Use explicit pure functions:"], 
 ESameTest[(1 + g[#1] & ) /@ {a, b, c, d, e}, {1 + g[a], 1 + g[b], 1 + g[c], 
   1 + g[d], 1 + g[e]}], ESameTest[Function[x, x^2] /@ {1, 2, 3, 4}, 
  {1, 4, 9, 16}], EComment["Map at top level:"], 
 ESameTest[f /@ {{a, b}, {c, d, e}}, {f[{a, b}], f[{c, d, e}]}], 
 EComment["Map at level 2:"], ESameTest[Map[f, {{a, b}, {c, d, e}}, {2}], 
  {{f[a], f[b]}, {f[c], f[d], f[e]}}], EComment["Map at levels 1 and 2:"], 
 ESameTest[Map[f, {{a, b}, {c, d, e}}, 2], {f[{f[a], f[b]}], 
   f[{f[c], f[d], f[e]}]}], EComment["Use a map operator:"], 
 ESameTest[(Map[f])[{a, b, c, d}], {f[a], f[b], f[c], f[d]}], 
 EComment[
  "Map a function over values in \
RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[h /@ \[LeftAssociation] a -> b, c -> d \[RightAssociation], 
  \[LeftAssociation] a -> h[b], c -> h[d] \[RightAssociation]], 
 EComment["Map at the second level of a nested \
RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[Map[h, \[LeftAssociation] 
    a -> \[LeftAssociation] b -> c \[RightAssociation], 
    d -> \[LeftAssociation] e -> f \[RightAssociation] \[RightAssociation], 
   {2}], \[LeftAssociation] a -> \[LeftAssociation] 
     b -> h[c] \[RightAssociation], 
   d -> \[LeftAssociation] 
     e -> h[f] \[RightAssociation] \[RightAssociation]], 
 EComment[
  "Map at several levels in an RefLink[Association,paclet:ref/Association]:"]\
, ESameTest[Map[h, \[LeftAssociation] 
    a -> \[LeftAssociation] b -> c \[RightAssociation], 
    d -> {\[LeftAssociation] e -> f \[RightAssociation]} \[RightAssociation], 
   {1, 3}], \[LeftAssociation] 
   a -> h[\[LeftAssociation] b -> h[c] \[RightAssociation]], 
   d -> h[{h[\[LeftAssociation] 
        e -> h[f] \[RightAssociation]]}] \[RightAssociation]], 
 EComment["Map at level 1 (default):"], ESameTest[f /@ {{{{{a}}}}}, 
  {f[{{{{a}}}}]}], EComment["Map down to level 2:"], 
 ESameTest[Map[f, {{{{{a}}}}}, 2], {f[{f[{{{a}}}]}]}], 
 EComment["Map at level 2:"], ESameTest[Map[f, {{{{{a}}}}}, {2}], 
  {{f[{{{a}}}]}}], EComment["Map on levels 0 through 2:"], 
 ESameTest[Map[f, {{{{{a}}}}}, {0, 2}], f[{f[{f[{{{a}}}]}]}]], 
 EComment["Map down to level 3:"], ESameTest[Map[f, {{{{{a}}}}}, 3], 
  {f[{f[{f[{{a}}]}]}]}], EComment["Map on all levels, starting at level 1:"], 
 ESameTestBROKEN[f //@ {{{{{a}}}}}, {f[{f[{f[{f[{f[a]}]}]}]}]}], 
 EComment["Map also at level 0:"], ESameTestBROKEN[
  Map[f, {{{{{a}}}}}, {0, Infinity}], f[{f[{f[{f[{f[{f[a]}]}]}]}]}]], 
 EComment["Negative levels:"], ESameTestBROKEN[Map[f, {{{{{a}}}}}, -1], 
  {f[{f[{f[{f[{f[a]}]}]}]}]}], ESameTestBROKEN[Map[f, {{{{{a}}}}}, -2], 
  {f[{f[{f[{f[{a}]}]}]}]}], ESameTestBROKEN[Map[f, {{{{{a}}}}}, -3], 
  {f[{f[{f[{{a}}]}]}]}], 
 EComment["Positive and negative levels can be mixed:"], 
 ESameTestBROKEN[Map[f, {{{{{a}}}}}, {2, -3}], {{f[{f[{{a}}]}]}}], 
 EComment["Different heads at each level:"], 
 ESameTestBROKEN[Map[f, h0[h1[h2[h3[h4[a]]]]], {2, -3}], 
  h0[h1[f[h2[f[h3[h4[a]]]]]]]], 
 EComment["Include heads in the levels specified:"], 
 ESameTest[Map[f, {{{{a}}}}, 2, Heads -> True], 
  f[List][f[f[List][f[{{a}}]]]]], 
 EComment[
  "RefLink[Map,paclet:ref/Map] can be used on expressions with any head:"], 
 ESameTest[f /@ (a + b + c + d), f[a] + f[b] + f[c] + f[d]], 
 ESameTest[Map[f, x^2 + y^2, 2], f[f[x]^f[2]] + f[f[y]^f[2]]], 
 EComment["The function can be mapped onto the heads as well:"], 
 ESameTest[Map[f, {a, b, c}, Heads -> True], f[List][f[a], f[b], f[c]]], 
 EComment["Functions with attribute RefLink[Listable,paclet:ref/Listable] are \
mapped automatically:"], ESameTest[Sqrt[{1, 2, 3, 4}], 
  {1, Sqrt[2], Sqrt[3], 2}], ESameTest[Sqrt /@ {1, 2, 3, 4}, 
  {1, Sqrt[2], Sqrt[3], 2}], 
 EComment["RefLink[Map,paclet:ref/Map] can be used on sparse arrays:"], 
 ESameTestBROKEN[HoldComplete[SparseArray[{1 -> 1, 2 -> 2, 100 -> 100}]], 
  $Failed], ESameTestBROKEN[HoldComplete[f /@ %], $Failed], 
 ESameTestBROKEN[%[[2]], f[2]], 
 EComment["By default, the function is not mapped onto the heads:"], 
 ESameTest[f /@ {a, b, c}, {f[a], f[b], f[c]}], 
 ESameTest[Map[f, {a, b, c}, Heads -> True], f[List][f[a], f[b], f[c]]], 
 EComment["Reverse all sublists:"], 
 ESameTest[Reverse /@ {{a, b}, {c, d}, {e, f}}, {{b, a}, {d, c}, {f, e}}], 
 EComment["Add the same vector to every vector in a list:"], 
 ESameTest[(#1 + {x, y} & ) /@ {{1, 1}, {2, 2}, {3, 3}, {4, 4}}, 
  {{1 + x, 1 + y}, {2 + x, 2 + y}, {3 + x, 3 + y}, {4 + x, 4 + y}}], 
 EComment["Frame integers that are prime:"], 
 ESameTestBROKEN[(If[PrimeQ[#1], Framed[#1], #1] & ) /@ Range[20], 
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}], 
 EComment["A function of several arguments can be mapped with \
RefLink[MapThread,paclet:ref/MapThread]:"], 
 ESameTest[MapThread[f, {{1, 2, 3}, {a, b, c}}], 
  {f[1, a], f[2, b], f[3, c]}], EComment["RefLink[MapIndexed,paclet:ref/MapIn\
dexed] passes the index of an element to the mapped function:"], 
 ESameTest[MapIndexed[f, {a, b, c}], {f[a, {1}], f[b, {2}], f[c, {3}]}], 
 EComment["RefLink[MapAll,paclet:ref/MapAll] is equivalent to a specific \
level specification in RefLink[Map,paclet:ref/Map]:"], 
 ESameTestBROKEN[Map[f, {{a, b}, {c}, {{d}}}, {0, Infinity}], 
  f[{f[{f[a], f[b]}], f[{f[c]}], f[{f[{f[d]}]}]}]], 
 ESameTestBROKEN[f //@ {{a, b}, {c}, {{d}}}, 
  f[{f[{f[a], f[b]}], f[{f[c]}], f[{f[{f[d]}]}]}]], 
 EComment["RefLink[Scan,paclet:ref/Scan] does the same as \
RefLink[Map,paclet:ref/Map], but without returning a result:"], 
 ESameTest[Print /@ {a, b}, {Null, Null}], EComment["RefLink[Map,paclet:ref/M\
ap] by default starts at level 1, so does not apply the function to the whole \
expression:"], ESameTest[Map[f, h1[h2[h3[x]]], -1], h1[f[h2[f[h3[f[x]]]]]]], 
 ESameTest[Map[f, h1[h2[h3[x]]], {0, -1}], f[h1[f[h2[f[h3[f[x]]]]]]]], 
 EComment["Show nesting structure of an expression:"], 
 ESameTestBROKEN[Integrate[1/(x^3 - 1), x], 
  -(ArcTan[(1 + 2*x)/Sqrt[3]]/Sqrt[3]) + (1/3)*Log[-1 + x] - 
   (1/6)*Log[1 + x + x^2]], ESameTestBROKEN[Framed //@ %, 
  -(ArcTan[1/3^(1/2) + 2*x]/3^(1/2)) + (1/3)*Log[-1 + x] + 
   (-(1/6))*Log[1 + x + x^2]]]
