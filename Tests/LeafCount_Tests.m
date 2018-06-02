(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the number of \"leaves\" in an expression tree:"], 
 TapTestSame[LeafCount[1 + a + b^2], 6], 
 TapTestSame[Level[1 + a + b^2, {-1}, Heads -> True], 
  {Plus, 1, a, Power, b, 2}], 
 TapComment["Find leafcount measures of the sizes of successive integrals:"], 
 TapTestSameBROKEN[Table[LeafCount[Integrate[1/(x^n - 1), x]], {n, 10}], 
  {4, 17, 39, 23, 146, 73, 164, 97, 184, 287}], 
 TapComment["Make RefLink[Simplify,paclet:ref/Simplify] pick expressions with \
minimum RefLink[LeafCount,paclet:ref/LeafCount]:"], 
 TapTestSame[Simplify[4*Log[10]], 4*Log[10]], 
 TapTestSame[Simplify[4*Log[10], ComplexityFunction -> LeafCount], 
  Log[10000]], TapComment["Find leafcounts in combinator expressions \
WebLink[[more \
info]:,http://www.wolframscience.com/nksonline/page-1122a-text]"], 
 TapTestSame[NestList[#1 /. s[x_][y_][z_] -> x[z][y[z]] & , 
   s[s][s][s[s]][s][s], 4], {s[s][s][s[s]][s][s], s[s[s]][s[s[s]]][s][s], 
   s[s][s][s[s[s]][s]][s], s[s[s[s]][s]][s[s[s[s]][s]]][s], 
   s[s[s]][s][s][s[s[s[s]][s]][s]]}], TapTestSameBROKEN[LeafCount /@ %, 
  {7, 8, 8, 11, 11}], TapComment["RefLink[LeafCount,paclet:ref/LeafCount] \
includes the head and all elements inside it:"], 
 TapTestSame[LeafCount[f[x, y]], 3], TapTestSame[LeafCount[f[a, b][x, y]], 
  5], TapComment["For most expressions, \
RefLink[LeafCount,paclet:ref/LeafCount] equals the count matching \
RefLink[Blank,paclet:ref/Blank][] at level {-1}:"], 
 TapTestSame[LeafCount[1 + a + b^2], 6], 
 TapTestSame[Count[1 + a + b^2, _, {-1}, Heads -> True], 6], 
 TapComment["RefLink[LeafCount,paclet:ref/LeafCount] counts \
RefLink[Rational,paclet:ref/Rational] and RefLink[Complex,paclet:ref/Complex] \
numbers using their RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSameBROKEN[FullForm[{1/2, 1 + I}], {Rational[1, 2], Complex[1, 1]}], 
 TapTestSame[LeafCount[{1/2, 1 + I}], 7], TapComment["RefLink[Count,paclet:re\
f/Count] treats RefLink[Rational,paclet:ref/Rational] and \
RefLink[Complex,paclet:ref/Complex] as atoms:"], 
 TapTestSame[AtomQ /@ {1/2, 1 + I}, {True, True}], 
 TapTestSame[Count[{1/2, 1 + I}, _, {-1}, Heads -> True], 3], 
 TapComment["RefLink[LeafCount,paclet:ref/LeafCount] is based on the \
RefLink[FullForm,paclet:ref/FullForm] of expressions:"], 
 TapTestSame[Sqrt[x], Sqrt[x]], TapTestSame[LeafCount[Sqrt[x]], 5], 
 TapTestSameBROKEN[FullForm[Sqrt[x]], Sqrt[x]], 
 TapComment["RefLink[LeafCount,paclet:ref/LeafCount] counts elements in \
rational and complex numbers just as in \
RefLink[FullForm,paclet:ref/FullForm]:"], TapTestSame[LeafCount[10 + I], 3], 
 TapTestSameBROKEN[FullForm[10 + I], Complex[10, 1]], 
 TapComment[
  "Integers of any size are still treated as single expression leaves:"], 
 TapTestSame[LeafCount[1000!], 1], TapComment["RefLink[LeafCount,paclet:ref/L\
eafCount] treats RefLink[SparseArray,paclet:ref/SparseArray] objects as \
single expression leaves:"], TapTestSameBROKEN[
  HoldComplete[SparseArray[{a, b, c, d}]], $Failed], 
 TapTestSameBROKEN[LeafCount[%], 1], TapComment["Unlike \
RefLink[TreeForm,paclet:ref/TreeForm], \
RefLink[LeafCount,paclet:ref/LeafCount] takes into consideration the \
structure of expression heads:"], TapTestSameBROKEN[
  HoldComplete[TreeForm[f[a[b]][c, d]]], $Failed], 
 TapTestSame[LeafCount[f[a[b]][c, d]], 5], TapComment["This shows the \
expression tree whose leaves are counted by \
RefLink[LeafCount,paclet:ref/LeafCount]:"], 
 TapTestSameBROKEN[HoldComplete[LayeredGraphPlot[{f[a[b]][c, d] -> f[a[b]], 
     f[a[b]][c, d] -> c, f[a[b]][c, d] -> d, f[a[b]] -> f, f[a[b]] -> a[b], 
     a[b] -> a, a[b] -> b}, VertexLabeling -> True, DirectedEdges -> True, 
    VertexCoordinateRules -> {{0, 0}, {-1, -1}, {0, -1}, {1, -1}, {-2, -2}, 
      {0, -2}, {-1, -3}, {1, -3}}]], $Failed]]
