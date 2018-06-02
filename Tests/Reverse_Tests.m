(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Reverse[{a, b, c, d}], {d, c, b, a}], 
 EComment["Reverse an RefLink[Association,paclet:ref/Association]:"], 
 ESameTestBROKEN[Reverse[\[LeftAssociation] a -> 1, b -> 2, 
    c -> 2 \[RightAssociation]], \[LeftAssociation] c -> 2, b -> 2, 
   a -> 1 \[RightAssociation]], EComment["Reverse an \
RefLink[Association,paclet:ref/Association] on the first and second levels:"]\
, ESameTestBROKEN[Reverse[\[LeftAssociation] a :> {1, 2}, b -> {3, 4}, 
    c -> {5, 6} \[RightAssociation], {1, 2}], \[LeftAssociation] c -> {6, 5}, 
   b -> {4, 3}, a :> {2, 1} \[RightAssociation]], 
 EComment["RefLink[Reverse,paclet:ref/Reverse] works with heads other than \
RefLink[List,paclet:ref/List]:"], ESameTest[Reverse[f[a, b, c]], f[c, b, a]], 
 EComment["RefLink[Reverse,paclet:ref/Reverse] sublists:"], 
 ESameTest[Reverse /@ {{a, b, c}, {d, e, f}}, {{c, b, a}, {f, e, d}}], 
 EComment["RefLink[Reverse,paclet:ref/Reverse] operands:"], 
 ESameTest[Reverse[a . b . c . d . e], e . d . c . b . a], 
 EComment["Turn an array plot upside down:"], 
 ESameTestBROKEN[HoldComplete[ArrayPlot[
    Reverse[CellularAutomaton[30, {{1}, 0}, 20]]]], $Failed], 
 EComment["RefLink[Reverse,paclet:ref/Reverse] is its own inverse:"], 
 ESameTest[Reverse[Reverse[{a, b, c, d}]], {a, b, c, d}]]
