(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{d, c, b, a}]], 
 TapComment["Reverse an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSameBROKEN[Reverse[\[LeftAssociation] a -> 1, b -> 2, 
    c -> 2 \[RightAssociation]], \[LeftAssociation] c -> 2, b -> 2, 
   a -> 1 \[RightAssociation]], TapComment["Reverse an \
RefLink[Association,paclet:ref/Association] on the first and second levels:"]\
, TapTestSameBROKEN[Reverse[\[LeftAssociation] a :> {1, 2}, b -> {3, 4}, 
    c -> {5, 6} \[RightAssociation], {1, 2}], \[LeftAssociation] c -> {6, 5}, 
   b -> {4, 3}, a :> {2, 1} \[RightAssociation]], 
 TapComment["RefLink[Reverse,paclet:ref/Reverse] works with heads other than \
RefLink[List,paclet:ref/List]:"], TapTestSame[Reverse[f[a, b, c]], 
  f[c, b, a]], TapComment["RefLink[Reverse,paclet:ref/Reverse] sublists:"], 
 TapTestSame[Reverse /@ {{a, b, c}, {d, e, f}}, {{c, b, a}, {f, e, d}}], 
 TapComment["RefLink[Reverse,paclet:ref/Reverse] operands:"], 
 TapTestSame[Reverse[a . b . c . d . e], e . d . c . b . a], 
 TapComment["Turn an array plot upside down:"], 
 TapTestSame[HoldComplete[ArrayPlot[Reverse[CellularAutomaton[30, {{1}, 0}, 
      20]]]], $Failed], TapComment[
  "RefLink[Reverse,paclet:ref/Reverse] is its own inverse:"], 
 TapTestSame[Reverse[Reverse[{a, b, c, d}]], {a, b, c, d}]]
