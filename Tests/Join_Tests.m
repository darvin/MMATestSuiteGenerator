(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Join[{a, b, c}, {x, y}, {u, v, w}], 
  {a, b, c, x, y, u, v, w}], EComment["Infix syntax:"], 
 ESameTest[Join[Join[{a, b, c}, {x, y}], {u, v, w}], 
  {a, b, c, x, y, u, v, w}], EComment["Join two associations:"], 
 ESameTest[Join[\[LeftAssociation] a -> b \[RightAssociation], 
   \[LeftAssociation] c -> d, a -> e \[RightAssociation]], 
  \[LeftAssociation] a -> e, c -> d \[RightAssociation]], 
 EComment["Join two matrices to make longer columns:"], 
 ESameTest[Join[{{a, b}, {c, d}}, {{1, 2}, {3, 4}}], 
  {{a, b}, {c, d}, {1, 2}, {3, 4}}], 
 EComment["Join columns of two matrices to make longer rows:"], 
 ESameTest[Join[{{a, b}, {c, d}}, {{1, 2}, {3, 4}}, 2], 
  {{a, b, 1, 2}, {c, d, 3, 4}}], 
 EComment[
  "With ragged arrays, successive elements are effectively concatenated:"], 
 ESameTest[Join[{{1}, {5, 6}}, {{2, 3}, {7}}, {{4}, {8}}, 2], 
  {{1, 2, 3, 4}, {5, 6, 7, 8}}], 
 EComment["The second row comes from the concatenation of nothing with \
{3,4}:"], ESameTest[Join[{{x}}, {{1, 2}, {3, 4}}, 2], {{x, 1, 2}, {3, 4}}], 
 ESameTestBROKEN[Join[aa, bb], {{{Subscript[a, 1], Subscript[a, 1]}, 
    {Subscript[a, 1], Subscript[a, 1]}}, {{Subscript[a, 2], Subscript[a, 2]}, 
    {Subscript[a, 2], Subscript[a, 2]}}, {{Subscript[b, 1], Subscript[b, 1]}, 
    {Subscript[b, 1], Subscript[b, 1]}}, {{Subscript[b, 2], Subscript[b, 2]}, 
    {Subscript[b, 2], Subscript[b, 2]}}}], ESameTestBROKEN[Join[aa, bb, 2], 
  {{{Subscript[a, 1], Subscript[a, 1]}, {Subscript[a, 1], Subscript[a, 1]}, 
    {Subscript[b, 1], Subscript[b, 1]}, {Subscript[b, 1], Subscript[b, 1]}}, 
   {{Subscript[a, 2], Subscript[a, 2]}, {Subscript[a, 2], Subscript[a, 2]}, 
    {Subscript[b, 2], Subscript[b, 2]}, {Subscript[b, 2], 
     Subscript[b, 2]}}}], ESameTestBROKEN[Join[aa, bb, 3], 
  {{{Subscript[a, 1], Subscript[a, 1], Subscript[b, 1], Subscript[b, 1]}, 
    {Subscript[a, 1], Subscript[a, 1], Subscript[b, 1], Subscript[b, 1]}}, 
   {{Subscript[a, 2], Subscript[a, 2], Subscript[b, 2], Subscript[b, 2]}, 
    {Subscript[a, 2], Subscript[a, 2], Subscript[b, 2], Subscript[b, 2]}}}], 
 EComment["Join expressions with any head:"], 
 ESameTest[Join[f[a, b, c], f[x, y], f[u, v, w]], f[a, b, c, x, y, u, v, w]], 
 EComment["RefLink[Join,paclet:ref/Join] works with \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 ESameTestBROKEN[HoldComplete[SparseArray[Range[5]]], $Failed], 
 ESameTestBROKEN[HoldComplete[Join[%, %, %]], $Failed], 
 EComment["Augment a matrix by adding a row:"], 
 ESameTestBROKEN[MatrixForm[Join[IdentityMatrix[3], {{1, 2, 3}}]], 
  1*0*0*0*1*0*0*0*1*1*2*3], EComment["Augment by a column:"], 
 ESameTestBROKEN[MatrixForm[Join[IdentityMatrix[3], Transpose[{{1, 2, 3}}], 
    2]], 1*0*0*1*0*1*0*2*0*0*1*3], EComment["Make a block matrix:"], 
 ESameTestBROKEN[MatrixForm[Join[Join[Subscript[a, 1]*Subscript[a, 1]*
      Subscript[a, 1]*Subscript[a, 2]*Subscript[a, 2]*Subscript[a, 2]*
      Subscript[a, 3]*Subscript[a, 3]*Subscript[a, 3], 
     Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 2]*
      Subscript[b, 2]*Subscript[b, 2]*Subscript[b, 3]*Subscript[b, 3]*
      Subscript[b, 3], 2], Join[Subscript[c, 1]*Subscript[c, 1]*
      Subscript[c, 1]*Subscript[c, 2]*Subscript[c, 2]*Subscript[c, 2]*
      Subscript[c, 3]*Subscript[c, 3]*Subscript[c, 3], 
     Subscript[d, 1]*Subscript[d, 1]*Subscript[d, 1]*Subscript[d, 2]*
      Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 3]*Subscript[d, 3]*
      Subscript[d, 3], 2]]], Subscript[a, 1]*Subscript[a, 1]*Subscript[a, 1]*
   Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*Subscript[a, 2]*
   Subscript[a, 2]*Subscript[a, 2]*Subscript[b, 2]*Subscript[b, 2]*
   Subscript[b, 2]*Subscript[a, 3]*Subscript[a, 3]*Subscript[a, 3]*
   Subscript[b, 3]*Subscript[b, 3]*Subscript[b, 3]*Subscript[c, 1]*
   Subscript[c, 1]*Subscript[c, 1]*Subscript[d, 1]*Subscript[d, 1]*
   Subscript[d, 1]*Subscript[c, 2]*Subscript[c, 2]*Subscript[c, 2]*
   Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 2]*Subscript[c, 3]*
   Subscript[c, 3]*Subscript[c, 3]*Subscript[d, 3]*Subscript[d, 3]*
   Subscript[d, 3]], EComment["This can also be done with \
RefLink[ArrayFlatten,paclet:ref/ArrayFlatten]:"], 
 ESameTestBROKEN[MatrixForm[ArrayFlatten[
    (Subscript[a, 1]*Subscript[a, 1]*Subscript[a, 1]*Subscript[a, 2]*
      Subscript[a, 2]*Subscript[a, 2]*Subscript[a, 3]*Subscript[a, 3]*
      Subscript[a, 3])*(Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*
      Subscript[b, 2]*Subscript[b, 2]*Subscript[b, 2]*Subscript[b, 3]*
      Subscript[b, 3]*Subscript[b, 3])*(Subscript[c, 1]*Subscript[c, 1]*
      Subscript[c, 1]*Subscript[c, 2]*Subscript[c, 2]*Subscript[c, 2]*
      Subscript[c, 3]*Subscript[c, 3]*Subscript[c, 3])*
     (Subscript[d, 1]*Subscript[d, 1]*Subscript[d, 1]*Subscript[d, 2]*
      Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 3]*Subscript[d, 3]*
      Subscript[d, 3])]], Subscript[a, 1]*Subscript[a, 1]*Subscript[a, 1]*
   Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*Subscript[a, 2]*
   Subscript[a, 2]*Subscript[a, 2]*Subscript[b, 2]*Subscript[b, 2]*
   Subscript[b, 2]*Subscript[a, 3]*Subscript[a, 3]*Subscript[a, 3]*
   Subscript[b, 3]*Subscript[b, 3]*Subscript[b, 3]*Subscript[c, 1]*
   Subscript[c, 1]*Subscript[c, 1]*Subscript[d, 1]*Subscript[d, 1]*
   Subscript[d, 1]*Subscript[c, 2]*Subscript[c, 2]*Subscript[c, 2]*
   Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 2]*Subscript[c, 3]*
   Subscript[c, 3]*Subscript[c, 3]*Subscript[d, 3]*Subscript[d, 3]*
   Subscript[d, 3]], EComment["RefLink[Join,paclet:ref/Join][Subscript[list, \
1],Subscript[list, 2],\\[Ellipsis]] is equivalent to \
RefLink[Flatten,paclet:ref/Flatten][{Subscript[list, 1],Subscript[list, \
2],\\[Ellipsis]},1]:"], ESameTest[Join[{1, 2}, {{a, b}, {c, d}}, {3, 4, 5}], 
  {1, 2, {a, b}, {c, d}, 3, 4, 5}], 
 ESameTest[Flatten[{{1, 2}, {{a, b}, {c, d}}, {3, 4, 5}}, 1], 
  {1, 2, {a, b}, {c, d}, 3, 4, 5}], 
 EComment["Successively double a list by joining to itself:"], 
 ESameTest[NestList[Join[#1, #1] & , {x}, 4], {{x}, {x, x}, {x, x, x, x}, 
   {x, x, x, x, x, x, x, x}, {x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, 
    x}}], EComment["Build up the Thue\\[Dash]Morse sequence [WebLink[more \
info,http://www.wolframscience.com/nksonline/page-889c-text]]:"], 
 ESameTest[NestList[Join[#1, 1 - #1] & , {1}, 5], 
  {{1}, {1, 0}, {1, 0, 0, 1}, {1, 0, 0, 1, 0, 1, 1, 0}, 
   {1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1}, 
   {1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 
    1, 0, 0, 1, 0, 1, 1, 0}}]]
