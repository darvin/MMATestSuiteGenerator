(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Dimensions of a matrix:"], 
 ESameTest[Dimensions[{{a, b, c}, {d, e, f}}], {2, 3}], 
 EComment["RefLink[Dimensions,paclet:ref/Dimensions] counts only dimensions \
at which an expression is not \"ragged\":"], 
 ESameTest[Dimensions[{{a, b, c}, {d, e}, {f}}], {3}], 
 EComment[
  "RefLink[Dimensions,paclet:ref/Dimensions] works with arrays of any depth:"]\
, ESameTest[Dimensions[{{{{a, b}}}}], {1, 1, 1, 2}], 
 EComment["Give dimensions only down to level 2:"], 
 ESameTest[Dimensions[{{{{a, b}}}}, 2], {1, 1}], 
 EComment["RefLink[Dimensions,paclet:ref/Dimensions] works with any head, not \
just RefLink[List,paclet:ref/List]:"], 
 ESameTest[Dimensions[f[f[x, y], f[a, b], f[s, t]]], {3, 2}], 
 EComment["The \"array\" is considered full only when it has the same head as \
at the top:"], ESameTest[Dimensions[f[g[x, y], g[a, b], g[s, t]]], {3}], 
 EComment["RefLink[Dimensions,paclet:ref/Dimensions] works with \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 ESameTestBROKEN[HoldComplete[SparseArray[{{{a, b}}}]], $Failed], 
 ESameTestBROKEN[Dimensions[%], {1, 1, 2}], EComment["Find dimensions of \
regions filled by 10 steps of cellular automaton evolution:"], 
 ESameTest[Table[Dimensions[CellularAutomaton[n, {{1}, 0}, 10]], {n, 20}], 
  {{11, 3}, {11, 11}, {11, 6}, {11, 1}, {11, 3}, {11, 11}, {11, 2}, {11, 1}, 
   {11, 12}, {11, 11}, {11, 11}, {11, 1}, {11, 12}, {11, 11}, {11, 11}, 
   {11, 11}, {11, 6}, {11, 21}, {11, 1}, {11, 11}}], 
 ESameTest[Dimensions[Array[a, {2, 1, 4, 3}]], {2, 1, 4, 3}]]
