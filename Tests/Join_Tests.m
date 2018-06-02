(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[Join[{a, b, c}, {x, y}, {u, v, w}], 
  {a, b, c, x, y, u, v, w}], TapComment["Infix syntax:"], 
 TapTestSame[Join[Join[{a, b, c}, {x, y}], {u, v, w}], 
  {a, b, c, x, y, u, v, w}], TapComment["Join two associations:"], 
 TapTestSame[Join[\[LeftAssociation] a -> b \[RightAssociation], 
   \[LeftAssociation] c -> d, a -> e \[RightAssociation]], 
  \[LeftAssociation] a -> e, c -> d \[RightAssociation]], 
 TapComment["Join two matrices to make longer columns:"], 
 TapTestSame[Join[{{a, b}, {c, d}}, {{1, 2}, {3, 4}}], 
  {{a, b}, {c, d}, {1, 2}, {3, 4}}], 
 TapComment["Join columns of two matrices to make longer rows:"], 
 TapTestSame[Join[{{a, b}, {c, d}}, {{1, 2}, {3, 4}}, 2], 
  {{a, b, 1, 2}, {c, d, 3, 4}}], 
 TapComment[
  "With ragged arrays, successive elements are effectively concatenated:"], 
 TapTestSame[Join[{{1}, {5, 6}}, {{2, 3}, {7}}, {{4}, {8}}, 2], 
  {{1, 2, 3, 4}, {5, 6, 7, 8}}], 
 TapComment[
  "The second row comes from the concatenation of nothing with {3,4}:"], 
 TapTestSame[Join[{{x}}, {{1, 2}, {3, 4}}, 2], {{x, 1, 2}, {3, 4}}], 
 TapTestSameBROKEN[Join[aa, bb], {{{Subscript[a, 1], Subscript[a, 1]}, 
    {Subscript[a, 1], Subscript[a, 1]}}, {{Subscript[a, 2], Subscript[a, 2]}, 
    {Subscript[a, 2], Subscript[a, 2]}}, {{Subscript[b, 1], Subscript[b, 1]}, 
    {Subscript[b, 1], Subscript[b, 1]}}, {{Subscript[b, 2], Subscript[b, 2]}, 
    {Subscript[b, 2], Subscript[b, 2]}}}], TapTestSameBROKEN[Join[aa, bb, 2], 
  {{{Subscript[a, 1], Subscript[a, 1]}, {Subscript[a, 1], Subscript[a, 1]}, 
    {Subscript[b, 1], Subscript[b, 1]}, {Subscript[b, 1], Subscript[b, 1]}}, 
   {{Subscript[a, 2], Subscript[a, 2]}, {Subscript[a, 2], Subscript[a, 2]}, 
    {Subscript[b, 2], Subscript[b, 2]}, {Subscript[b, 2], 
     Subscript[b, 2]}}}], TapTestSameBROKEN[Join[aa, bb, 3], 
  {{{Subscript[a, 1], Subscript[a, 1], Subscript[b, 1], Subscript[b, 1]}, 
    {Subscript[a, 1], Subscript[a, 1], Subscript[b, 1], Subscript[b, 1]}}, 
   {{Subscript[a, 2], Subscript[a, 2], Subscript[b, 2], Subscript[b, 2]}, 
    {Subscript[a, 2], Subscript[a, 2], Subscript[b, 2], Subscript[b, 2]}}}], 
 TapComment["Join expressions with any head:"], 
 TapTestSame[Join[f[a, b, c], f[x, y], f[u, v, w]], 
  f[a, b, c, x, y, u, v, w]], TapComment["RefLink[Join,paclet:ref/Join] works \
with RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSameBROKEN[HoldComplete[SparseArray[Range[5]]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Join[%, %, %]], $Failed], 
 TapComment["Augment a matrix by adding a row:"], 
 TapTestSameBROKEN[MatrixForm[Join[IdentityMatrix[3], {{1, 2, 3}}]], 
  1*0*0*0*1*0*0*0*1*1*2*3], TapComment["Augment by a column:"], 
 TapTestSameBROKEN[MatrixForm[Join[IdentityMatrix[3], Transpose[{{1, 2, 3}}], 
    2]], 1*0*0*1*0*1*0*2*0*0*1*3], TapComment["Make a block matrix:"], 
 TapTestSameBROKEN[MatrixForm[
   Join[Join[Subscript[a, 1]*Subscript[a, 1]*Subscript[a, 1]*Subscript[a, 2]*
      Subscript[a, 2]*Subscript[a, 2]*Subscript[a, 3]*Subscript[a, 3]*
      Subscript[a, 3], Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*
      Subscript[b, 2]*Subscript[b, 2]*Subscript[b, 2]*Subscript[b, 3]*
      Subscript[b, 3]*Subscript[b, 3], 2], 
    Join[Subscript[c, 1]*Subscript[c, 1]*Subscript[c, 1]*Subscript[c, 2]*
      Subscript[c, 2]*Subscript[c, 2]*Subscript[c, 3]*Subscript[c, 3]*
      Subscript[c, 3], Subscript[d, 1]*Subscript[d, 1]*Subscript[d, 1]*
      Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 3]*
      Subscript[d, 3]*Subscript[d, 3], 2]]], Subscript[a, 1]*Subscript[a, 1]*
   Subscript[a, 1]*Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*
   Subscript[a, 2]*Subscript[a, 2]*Subscript[a, 2]*Subscript[b, 2]*
   Subscript[b, 2]*Subscript[b, 2]*Subscript[a, 3]*Subscript[a, 3]*
   Subscript[a, 3]*Subscript[b, 3]*Subscript[b, 3]*Subscript[b, 3]*
   Subscript[c, 1]*Subscript[c, 1]*Subscript[c, 1]*Subscript[d, 1]*
   Subscript[d, 1]*Subscript[d, 1]*Subscript[c, 2]*Subscript[c, 2]*
   Subscript[c, 2]*Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 2]*
   Subscript[c, 3]*Subscript[c, 3]*Subscript[c, 3]*Subscript[d, 3]*
   Subscript[d, 3]*Subscript[d, 3]], TapComment["This can also be done with \
RefLink[ArrayFlatten,paclet:ref/ArrayFlatten]:"], 
 TapTestSameBROKEN[$Failed, HoldComplete[Subscript[a, 1]*Subscript[a, 1]*
    Subscript[a, 1]*Subscript[b, 1]*Subscript[b, 1]*Subscript[b, 1]*
    Subscript[a, 2]*Subscript[a, 2]*Subscript[a, 2]*Subscript[b, 2]*
    Subscript[b, 2]*Subscript[b, 2]*Subscript[a, 3]*Subscript[a, 3]*
    Subscript[a, 3]*Subscript[b, 3]*Subscript[b, 3]*Subscript[b, 3]*
    Subscript[c, 1]*Subscript[c, 1]*Subscript[c, 1]*Subscript[d, 1]*
    Subscript[d, 1]*Subscript[d, 1]*Subscript[c, 2]*Subscript[c, 2]*
    Subscript[c, 2]*Subscript[d, 2]*Subscript[d, 2]*Subscript[d, 2]*
    Subscript[c, 3]*Subscript[c, 3]*Subscript[c, 3]*Subscript[d, 3]*
    Subscript[d, 3]*Subscript[d, 3]]], TapComment["RefLink[Join,paclet:ref/Jo\
in][Subscript[list, 1],Subscript[list, 2],\\[Ellipsis]] is equivalent to \
RefLink[Flatten,paclet:ref/Flatten][{Subscript[list, 1],Subscript[list, \
2],\\[Ellipsis]},1]:"], TapTestSame[Join[{1, 2}, {{a, b}, {c, d}}, 
   {3, 4, 5}], {1, 2, {a, b}, {c, d}, 3, 4, 5}], 
 TapTestSame[Flatten[{{1, 2}, {{a, b}, {c, d}}, {3, 4, 5}}, 1], 
  {1, 2, {a, b}, {c, d}, 3, 4, 5}], 
 TapComment["Successively double a list by joining to itself:"], 
 TapTestSame[NestList[Join[#1, #1] & , {x}, 4], 
  {{x}, {x, x}, {x, x, x, x}, {x, x, x, x, x, x, x, x}, 
   {x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x}}], 
 TapComment["Build up the Thue\\[Dash]Morse sequence [WebLink[more \
info,http://www.wolframscience.com/nksonline/page-889c-text]]:"], 
 TapTestSame[NestList[Join[#1, 1 - #1] & , {1}, 5], 
  {{1}, {1, 0}, {1, 0, 0, 1}, {1, 0, 0, 1, 0, 1, 1, 0}, 
   {1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1}, 
   {1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 
    1, 0, 0, 1, 0, 1, 1, 0}}]]
