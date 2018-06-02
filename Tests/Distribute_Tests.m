(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Apply the distributive law:"], 
 ESameTest[Distribute[(a + b) . (x + y + z)], a . x + a . y + a . z + b . x + 
   b . y + b . z], 
 EComment["Distribute f over RefLink[Plus,paclet:ref/Plus]:"], 
 ESameTest[Distribute[f[a + b, c + d + e]], f[a, c] + f[a, d] + f[a, e] + 
   f[b, c] + f[b, d] + f[b, e]], EComment["Distribute f over g:"], 
 ESameTest[Distribute[f[g[a, b], g[c, d, e]], g], 
  g[f[a, c], f[a, d], f[a, e], f[b, c], f[b, d], f[b, e]]], 
 EComment["By default, distribute over RefLink[Plus,paclet:ref/Plus]:"], 
 ESameTest[Distribute[(a + b + c)*(u + v), Plus], 
  a*u + b*u + c*u + a*v + b*v + c*v], 
 EComment["Distribute only a product of sums:"], 
 ESameTest[Distribute[(a + b + c)*(u + v), Plus, Times], 
  a*u + b*u + c*u + a*v + b*v + c*v], 
 ESameTest[Distribute[(a + b + c)^(u + v), Plus, Times], 
  (a + b + c)^(u + v)], 
 EComment["Distributive laws for logical operators: "], 
 ESameTest[Distribute[(a || b || c) && (u || v), Or, And], 
  (a && u) || (a && v) || (b && u) || (b && v) || (c && u) || (c && v)], 
 ESameTest[Distribute[(a && b && c) || (u && v), And, Or], 
  (a || u) && (a || v) && (b || u) && (b || v) && (c || u) && (c || v)], 
 ESameTest[Distribute[(Xor[a, b, c]) && (Xor[u, v]), Xor, And], 
  Xor[a && u, a && v, b && u, b && v, c && u, c && v]], 
 EComment["Apply the distributive law to arbitrary operators:"], 
 ESameTest[Distribute[(a \[CirclePlus] b \[CirclePlus] c) \[CircleTimes] 
    (u \[CirclePlus] v), CirclePlus, CircleTimes], 
  a \[CircleTimes] u \[CirclePlus] a \[CircleTimes] v \[CirclePlus] 
   b \[CircleTimes] u \[CirclePlus] b \[CircleTimes] v \[CirclePlus] 
   c \[CircleTimes] u \[CirclePlus] c \[CircleTimes] v], 
 EComment["Distribute f over g to give fp and gp:"], 
 ESameTest[Distribute[f[g[a, b], g[c, d, e]], g, f, gp, fp], 
  gp[fp[a, c], fp[a, d], fp[a, e], fp[b, c], fp[b, d], fp[b, e]]], 
 ESameTest[Distribute[(a + b + c)*(u + v), Plus, Times, plus, times], 
  plus[times[a, u], times[a, v], times[b, u], times[b, v], times[c, u], 
   times[c, v]]], 
 EComment["Expand symbolic matrix and vector expressions: "], 
 ESameTest[Distribute[(m1 + m2) . (m3 + m4)], m1 . m3 + m1 . m4 + m2 . m3 + 
   m2 . m4], ESameTest[Distribute[Cross[v1 + v2, v3 + v4]], 
  Cross[v1, v3] + Cross[v1, v4] + Cross[v2, v3] + Cross[v2, v4]], 
 EComment["Apply the distributive law with any operator:"], 
 ESameTest[Distribute[(a + b) \[CirclePlus] (x + y + z) \[CirclePlus] 
    (s + t)], a \[CirclePlus] x \[CirclePlus] s + 
   a \[CirclePlus] x \[CirclePlus] t + a \[CirclePlus] y \[CirclePlus] s + 
   a \[CirclePlus] y \[CirclePlus] t + a \[CirclePlus] z \[CirclePlus] s + 
   a \[CirclePlus] z \[CirclePlus] t + b \[CirclePlus] x \[CirclePlus] s + 
   b \[CirclePlus] x \[CirclePlus] t + b \[CirclePlus] y \[CirclePlus] s + 
   b \[CirclePlus] y \[CirclePlus] t + b \[CirclePlus] z \[CirclePlus] s + 
   b \[CirclePlus] z \[CirclePlus] t], 
 EComment["Find the list of all possible combinations of elements:"], 
 ESameTest[Distribute[{{a, b}, {x, y, z}, {s, t}}, List], 
  {{a, x, s}, {a, x, t}, {a, y, s}, {a, y, t}, {a, z, s}, {a, z, t}, 
   {b, x, s}, {b, x, t}, {b, y, s}, {b, y, t}, {b, z, s}, {b, z, t}}], 
 EComment["Generate a powerset:"], 
 ESameTest[Distribute[({{}, {#1}} & ) /@ {a, b, c}, List, List, List, Join], 
  {{}, {c}, {b}, {b, c}, {a}, {a, c}, {a, b}, {a, b, c}}], 
 EComment[
  "Find intermediate terms from a direct application of the distributive \
law:"], ESameTest[Distribute[Factor[x^6 - 1], Plus, Times, List, Times], 
  {-1, -x, -x^2, x, x^2, x^3, -x^2, -x^3, -x^4, -x, -x^2, -x^3, x^2, x^3, 
   x^4, -x^3, -x^4, -x^5, x, x^2, x^3, -x^2, -x^3, -x^4, x^3, x^4, x^5, x^2, 
   x^3, x^4, -x^3, -x^4, -x^5, x^4, x^5, x^6}], 
 ESameTestBROKEN[Plus @@ %, -1 + x^6], EComment["For pure products, \
RefLink[Distribute,paclet:ref/Distribute] gives the same results as \
RefLink[Expand,paclet:ref/Expand]:"], ESameTest[Factor[x^10 - 1], 
  (-1 + x)*(1 + x)*(1 - x + x^2 - x^3 + x^4)*(1 + x + x^2 + x^3 + x^4)], 
 ESameTestBROKEN[Distribute[%], -1 + x^10], EComment["RefLink[PowerExpand,pac\
let:ref/PowerExpand] corresponds to distribution over \
RefLink[Times,paclet:ref/Times]:"], ESameTest[PowerExpand[(x*y*z)^n], 
  x^n*y^n*z^n], ESameTest[Distribute[(x*y*z)^n, Times], x^n*y^n*z^n], 
 EComment["RefLink[Outer,paclet:ref/Outer] forms the same combinations of all \
elements, but in a nested structure:"], 
 ESameTest[Outer[List, {a, b, c}, {x, y}], {{{a, x}, {a, y}}, 
   {{b, x}, {b, y}}, {{c, x}, {c, y}}}], 
 ESameTest[Distribute[{{a, b, c}, {x, y}}, List], 
  {{a, x}, {a, y}, {b, x}, {b, y}, {c, x}, {c, y}}], 
 EComment["This use of RefLink[Distribute,paclet:ref/Distribute] does not \
give the expected result:"], ESameTest[Distribute[(a + b)*(a + b)], 
  a^2 + b^2], EComment["The reason is that the argument is evaluated first \
and the product vanishes:"], ESameTest[(a + b)*(a + b), (a + b)^2], 
 ESameTestBROKEN[Distribute[%], a^2 + b^2], EComment["Prevent evaluation of \
the argument before RefLink[Distribute,paclet:ref/Distribute] sees it:"], 
 ESameTest[Distribute[Unevaluated[(a + b)*(a + b)]], a^2 + 2*a*b + b^2], 
 EComment["Find all possible sums of sublists of a list:"], 
 ESameTest[Union[Distribute[Thread[{{1, 2, 2, 8}, 0}], List, List, List, 
    Plus]], {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13}]]
