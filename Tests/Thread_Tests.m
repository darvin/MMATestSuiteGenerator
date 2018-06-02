(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Thread[f[{a, b, c}]], {f[a], f[b], f[c]}], 
 ESameTest[Thread[f[{a, b, c}, x]], {f[a, x], f[b, x], f[c, x]}], 
 ESameTest[Thread[f[{a, b, c}, {x, y, z}]], {f[a, x], f[b, y], f[c, z]}], 
 EComment["Convert equations for lists to lists of equations:"], 
 ESameTest[Thread[{a, b, c} == {x, y, z}], {a == x, b == y, c == z}], 
 EComment["Apply a function to both sides of an equation:"], 
 ESameTest[Thread[Log[x == y], Equal], Log[x] == Log[y]], 
 EComment["By default, thread over all arguments:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List], 
  {f[a, r, u, x], f[b, s, v, y]}], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, All], 
  {f[a, r, u, x], f[b, s, v, y]}], EComment["Do not thread at all:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, None], 
  f[{a, b}, {r, s}, {u, v}, {x, y}]], 
 EComment["Thread over the first two arguments only:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, 2], 
  {f[a, r, {u, v}, {x, y}], f[b, s, {u, v}, {x, y}]}], 
 EComment["Thread over the last two arguments only:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, -2], 
  {f[{a, b}, {r, s}, u, x], f[{a, b}, {r, s}, v, y]}], 
 EComment["Thread over argument 2 only:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, {2}], 
  {f[{a, b}, r, {u, v}, {x, y}], f[{a, b}, s, {u, v}, {x, y}]}], 
 EComment["Thread over arguments 2 through 4:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, {2, 4}], 
  {f[{a, b}, r, u, x], f[{a, b}, s, v, y]}], 
 EComment["Thread over every other argument:"], 
 ESameTest[Thread[f[{a, b}, {r, s}, {u, v}, {x, y}], List, {1, -1, 2}], 
  {f[a, {r, s}, u, {x, y}], f[b, {r, s}, v, {x, y}]}], 
 EComment["By default, thread over lists:"], 
 ESameTest[Thread[f[{a, b}, {c, d}]], {f[a, c], f[b, d]}], 
 ESameTest[Thread[f[{a, b}, {c, d}], List], {f[a, c], f[b, d]}], 
 EComment["By default, does not thread over heads other than \
RefLink[List,paclet:ref/List]:"], ESameTest[Thread[f[a + b, c + d]], 
  f[a + b, c + d]], 
 EComment["Thread with respect to RefLink[Plus,paclet:ref/Plus]:"], 
 ESameTest[Thread[f[a + b, c + d], Plus], f[a, c] + f[b, d]], 
 EComment["Elements that are not lists are repeated:"], 
 ESameTest[Thread[f[{a, b, c}, h, {x, y, z}]], {f[a, h, x], f[b, h, y], 
   f[c, h, z]}], ESameTest[{1, 2, 3}^2, {1, 4, 9}], 
 EComment["Build a list of rules:"], 
 ESameTest[Thread[{a, b, c} -> {1, 2, 3}], {a -> 1, b -> 2, c -> 3}], 
 EComment["Equate coefficients in a polynomial equation:"], 
 ESameTest[(CoefficientList[#1, x] & ) /@ (1 + 2*x + 3*x^2 == 
    a + b*x + c*x^2), {1, 2, 3} == {a, b, c}], 
 ESameTestBROKEN[Thread[%], {1 == a, 2 == b, 3 == c}], 
 EComment["Alternatively, use RefLink[SolveAlways,paclet:ref/SolveAlways]:"], 
 ESameTest[SolveAlways[1 + 2*x + 3*x^2 == a + b*x + c*x^2, x], 
  {{a -> 1, b -> 2, c -> 3}}], 
 EComment["Form pairs with a constant second element:"], 
 ESameTest[Thread[{{a, b, c}, 0}], {{a, 0}, {b, 0}, {c, 0}}], 
 EComment["Functions with attribute RefLink[Listable,paclet:ref/Listable] are \
threaded automatically over lists:"], ESameTest[Sqrt[{1, 2, 3, 4}], 
  {1, Sqrt[2], Sqrt[3], 2}], ESameTest[{1, 2, 3, 4} + 1, {2, 3, 4, 5}], 
 ESameTest[{1, 2, 3, 4} + {a, b, c, d}, {1 + a, 2 + b, 3 + c, 4 + d}], 
 EComment["RefLink[MapThread,paclet:ref/MapThread] works like \
RefLink[Thread,paclet:ref/Thread], but takes the function and arguments \
separately:"], ESameTest[MapThread[f, {{a, b, c}, {x, y, z}}], 
  {f[a, x], f[b, y], f[c, z]}], ESameTest[Thread[f[{a, b, c}, {x, y, z}]], 
  {f[a, x], f[b, y], f[c, z]}], 
 EComment[
  "The function to thread over can be RefLink[List,paclet:ref/List] as well:"]\
, ESameTest[Thread[{{a, b, c}, {x, y, z}}], {{a, x}, {b, y}, {c, z}}], 
 EComment["In this case, the result is the same as a transposition:"], 
 ESameTest[Transpose[{{a, b, c}, {x, y, z}}], {{a, x}, {b, y}, {c, z}}], 
 EComment["RefLink[Thread,paclet:ref/Thread] evaluates the whole expression \
before threading:"], ESameTest[Thread[D[{x, x*y, x*z}, {x, y, z}]], 
  {1, x, x}], EComment["RefLink[MapThread,paclet:ref/MapThread] takes the \
function and its arguments separately:"], 
 ESameTest[MapThread[D, {{x, x*y, x*z}, {x, y, z}}], {1, x, x}], 
 EComment["Suppressing evaluation has a similar effect:"], 
 ESameTest[Thread[Unevaluated[D[{x, x*y, x*z}, {x, y, z}]]], {1, x, x}]]
