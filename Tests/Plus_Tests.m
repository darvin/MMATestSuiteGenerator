(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[1 + 2 + 3, 6], 
 TapComment[
  "RefLink[Plus,paclet:ref/Plus] threads element-wise over lists:"], 
 TapTestSame[{1, 2, 3} + x, {1 + x, 2 + x, 3 + x}], 
 TapTestSame[{10, 20, 30} + {1, 2, 3}, {11, 22, 33}], 
 TapComment["Explicit RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSame[1 + 2 + 3, 6], 
 TapComment[
  "If any number is approximate, the whole result will be as follows:"], 
 TapTestSame[1. + 2 + 3/4, 3.75], 
 TapComment["Complex numbers add their components:"], 
 TapTestSame[(2 + I) + (3 - 7*I), 5 - 6*I], 
 TapComment[
  "RefLink[Plus,paclet:ref/Plus] threads element-wise over lists:"], 
 TapTestSame[{a, b} + {c, d}, {a + c, b + d}], 
 TapTestSame[{a, b, c} + x, {a + x, b + x, c + x}], 
 TapTestSame[{{a, b}, {c, d}} + x, {{a + x, b + x}, {c + x, d + x}}], 
 TapComment["Matrices add element-wise:"], 
 TapTestSame[{{1, 2}, {3, 4}} + {{a, b}, {c, d}}, 
  {{1 + a, 2 + b}, {3 + c, 4 + d}}], 
 TapComment["RefLink[Plus,paclet:ref/Plus] sorts its arguments:"], 
 TapTestSame[b + c + a, a + b + c], TapTestSame[Sum[x^n, {n, 0, 5}], 
  1 + x + x^2 + x^3 + x^4 + x^5], TapTestSame[Sum[x^i*y^j, {i, 3}, {j, 3}], 
  x*y + x^2*y + x^3*y + x*y^2 + x^2*y^2 + x^3*y^2 + x*y^3 + x^2*y^3 + 
   x^3*y^3], TapComment["Display terms in a sum in a traditional order:"], 
 TapTestSameBROKEN[
    5     n
  \[Sum] x
  n = 0, x^5 + x^4 + x^3 + x^2 + x + 1], TapTestSameBROKEN[
    3      3     i  j
  \[Sum] \[Sum] x  y
    i      j, y^3*x^3 + y^2*x^3 + y*x^3 + y^3*x^2 + y^2*x^2 + y*x^2 + y^3*x + 
   y^2*x + y*x], TapComment["Display a sum without evaluation:"], 
 TapTestSameBROKEN[HoldForm[1 + 3 + 2], 1 + 3 + 2], 
 TapComment["Display the RefLink[FullForm,paclet:ref/FullForm] of a sum:"], 
 TapTestSameBROKEN[FullForm[a + b + c + d], a + b + c + d], 
 TapComment["Find the length of a sum:"], TapTestSame[Length[a + b + c + d], 
  4], TapComment["RefLink[Total,paclet:ref/Total] applies \
RefLink[Plus,paclet:ref/Plus] to a list:"], TapTestSame[Plus @@ {a, b, c, d}, 
  a + b + c + d], TapTestSame[Total[{a, b, c, d}], a + b + c + d], 
 TapComment["Pattern matching works with RefLink[Plus,paclet:ref/Plus]:"], 
 TapTestSame[a + b + c + d /. a + d -> x, b + c + x], 
 TapTestSame[a + b + c + d /. a + c + (x_) -> f[x], f[b + d]], 
 TapTestSame[{a, a + b, a + b + c} /. a + (x_.) -> f[x], 
  {f[0], f[b], f[b + c]}], 
 TapComment["Distribute a function over RefLink[Plus,paclet:ref/Plus]:"], 
 TapTestSame[f[a + b, c + d], f[a + b, c + d]], 
 TapTestSame[Distribute[f[a + b, c + d]], f[a, c] + f[a, d] + f[b, c] + 
   f[b, d]], TapComment[
  "Distribute RefLink[Plus,paclet:ref/Plus] through a head:"], 
 TapTestSame[(f + g)[x], (f + g)[x]], TapTestSame[Through[(f + g)[x]], 
  f[x] + g[x]], TapComment[
  "RefLink[Accumulate,paclet:ref/Accumulate] makes a cumulative sum:"], 
 TapTestSame[FoldList[Plus, 0, {a, b, c}], {0, a, a + b, a + b + c}], 
 TapTestSame[Accumulate[{a, b, c}], {a, a + b, a + b + c}]]
