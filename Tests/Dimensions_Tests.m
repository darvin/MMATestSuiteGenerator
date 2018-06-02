(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Dimensions of a matrix:"], 
 TapTestSame[Dimensions[{{a, b, c}, {d, e, f}}], {2, 3}], 
 TapComment["RefLink[Dimensions,paclet:ref/Dimensions] counts only dimensions \
at which an expression is not \"ragged\":"], 
 TapTestSame[Dimensions[{{a, b, c}, {d, e}, {f}}], {3}], 
 TapComment[
  "RefLink[Dimensions,paclet:ref/Dimensions] works with arrays of any depth:"]\
, TapTestSame[Dimensions[{{{{a, b}}}}], {1, 1, 1, 2}], 
 TapComment["Give dimensions only down to level 2:"], 
 TapTestSame[Dimensions[{{{{a, b}}}}, 2], {1, 1}], 
 TapComment["RefLink[Dimensions,paclet:ref/Dimensions] works with any head, \
not just RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Dimensions[f[f[x, y], f[a, b], f[s, t]]], {3, 2}], 
 TapComment["The \"array\" is considered full only when it has the same head \
as at the top:"], TapTestSame[Dimensions[f[g[x, y], g[a, b], g[s, t]]], {3}], 
 TapComment["RefLink[Dimensions,paclet:ref/Dimensions] works with \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSameBROKEN[HoldComplete[SparseArray[{{{a, b}}}]], $Failed], 
 TapTestSameBROKEN[Dimensions[%], {1, 1, 2}], TapComment["Find dimensions of \
regions filled by 10 steps of cellular automaton evolution:"], 
 TapTestSame[Table[Dimensions[CellularAutomaton[n, {{1}, 0}, 10]], {n, 20}], 
  {{11, 3}, {11, 11}, {11, 6}, {11, 1}, {11, 3}, {11, 11}, {11, 2}, {11, 1}, 
   {11, 12}, {11, 11}, {11, 11}, {11, 1}, {11, 12}, {11, 11}, {11, 11}, 
   {11, 11}, {11, 6}, {11, 21}, {11, 1}, {11, 11}}], 
 TapTestSame[Dimensions[Array[a, {2, 1, 4, 3}]], {2, 1, 4, 3}]]
