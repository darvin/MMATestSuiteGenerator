(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[1 + 2 + 3, 6], 
 EComment["RefLink[Plus,paclet:ref/Plus] threads element-wise over lists:"], 
 ESameTest[{1, 2, 3} + x, {1 + x, 2 + x, 3 + x}], 
 ESameTest[{10, 20, 30} + {1, 2, 3}, {11, 22, 33}], 
 EComment["Explicit RefLink[FullForm,paclet:ref/FullForm]:"], 
 ESameTest[1 + 2 + 3, 6], 
 EComment["If any number is approximate, the whole result will be as \
follows:"], ESameTest[1. + 2 + 3/4, 3.75], 
 EComment["Complex numbers add their components:"], 
 ESameTest[(2 + I) + (3 - 7*I), 5 - 6*I], 
 EComment["RefLink[Plus,paclet:ref/Plus] threads element-wise over lists:"], 
 ESameTest[{a, b} + {c, d}, {a + c, b + d}], ESameTest[{a, b, c} + x, 
  {a + x, b + x, c + x}], ESameTest[{{a, b}, {c, d}} + x, 
  {{a + x, b + x}, {c + x, d + x}}], EComment["Matrices add element-wise:"], 
 ESameTest[{{1, 2}, {3, 4}} + {{a, b}, {c, d}}, 
  {{1 + a, 2 + b}, {3 + c, 4 + d}}], 
 EComment["RefLink[Plus,paclet:ref/Plus] sorts its arguments:"], 
 ESameTest[b + c + a, a + b + c], ESameTest[Sum[x^n, {n, 0, 5}], 
  1 + x + x^2 + x^3 + x^4 + x^5], ESameTest[Sum[x^i*y^j, {i, 3}, {j, 3}], 
  x*y + x^2*y + x^3*y + x*y^2 + x^2*y^2 + x^3*y^2 + x*y^3 + x^2*y^3 + 
   x^3*y^3], EComment["Display terms in a sum in a traditional order:"], 
 ESameTestBROKEN[
    5     n
  \[Sum] x
  n = 0, x^5 + x^4 + x^3 + x^2 + x + 1], ESameTestBROKEN[
    3      3     i  j
  \[Sum] \[Sum] x  y
    i      j, y^3*x^3 + y^2*x^3 + y*x^3 + y^3*x^2 + y^2*x^2 + y*x^2 + y^3*x + 
   y^2*x + y*x], EComment["Display a sum without evaluation:"], 
 ESameTestBROKEN[HoldForm[1 + 3 + 2], 1 + 3 + 2], 
 EComment["Display the RefLink[FullForm,paclet:ref/FullForm] of a sum:"], 
 ESameTestBROKEN[FullForm[a + b + c + d], a + b + c + d], 
 EComment["Find the length of a sum:"], ESameTest[Length[a + b + c + d], 4], 
 EComment["RefLink[Total,paclet:ref/Total] applies \
RefLink[Plus,paclet:ref/Plus] to a list:"], ESameTest[Plus @@ {a, b, c, d}, 
  a + b + c + d], ESameTest[Total[{a, b, c, d}], a + b + c + d], 
 EComment["Pattern matching works with RefLink[Plus,paclet:ref/Plus]:"], 
 ESameTest[a + b + c + d /. a + d -> x, b + c + x], 
 ESameTest[a + b + c + d /. a + c + (x_) -> f[x], f[b + d]], 
 ESameTest[{a, a + b, a + b + c} /. a + (x_.) -> f[x], 
  {f[0], f[b], f[b + c]}], 
 EComment["Distribute a function over RefLink[Plus,paclet:ref/Plus]:"], 
 ESameTest[f[a + b, c + d], f[a + b, c + d]], 
 ESameTest[Distribute[f[a + b, c + d]], f[a, c] + f[a, d] + f[b, c] + 
   f[b, d]], EComment[
  "Distribute RefLink[Plus,paclet:ref/Plus] through a head:"], 
 ESameTest[(f + g)[x], (f + g)[x]], ESameTest[Through[(f + g)[x]], 
  f[x] + g[x]], EComment[
  "RefLink[Accumulate,paclet:ref/Accumulate] makes a cumulative sum:"], 
 ESameTest[FoldList[Plus, 0, {a, b, c}], {0, a, a + b, a + b + c}], 
 ESameTest[Accumulate[{a, b, c}], {a, a + b, a + b + c}]]
