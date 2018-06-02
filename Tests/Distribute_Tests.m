(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Apply the distributive law:"], 
 TapTestSame[Distribute[(a + b) . (x + y + z)], 
  a . x + a . y + a . z + b . x + b . y + b . z], 
 TapComment["Distribute f over RefLink[Plus,paclet:ref/Plus]:"], 
 TapTestSame[Distribute[f[a + b, c + d + e]], f[a, c] + f[a, d] + f[a, e] + 
   f[b, c] + f[b, d] + f[b, e]], TapComment["Distribute f over g:"], 
 TapTestSame[Distribute[f[g[a, b], g[c, d, e]], g], 
  g[f[a, c], f[a, d], f[a, e], f[b, c], f[b, d], f[b, e]]], 
 TapComment["By default, distribute over RefLink[Plus,paclet:ref/Plus]:"], 
 TapTestSame[Distribute[(a + b + c)*(u + v), Plus], 
  a*u + b*u + c*u + a*v + b*v + c*v], 
 TapComment["Distribute only a product of sums:"], 
 TapTestSame[Distribute[(a + b + c)*(u + v), Plus, Times], 
  a*u + b*u + c*u + a*v + b*v + c*v], 
 TapTestSame[Distribute[(a + b + c)^(u + v), Plus, Times], 
  (a + b + c)^(u + v)], TapComment[
  "Distributive laws for logical operators: "], 
 TapTestSame[Distribute[(a || b || c) && (u || v), Or, And], 
  (a && u) || (a && v) || (b && u) || (b && v) || (c && u) || (c && v)], 
 TapTestSame[Distribute[(a && b && c) || (u && v), And, Or], 
  (a || u) && (a || v) && (b || u) && (b || v) && (c || u) && (c || v)], 
 TapTestSame[Distribute[(Xor[a, b, c]) && (Xor[u, v]), Xor, And], 
  Xor[a && u, a && v, b && u, b && v, c && u, c && v]], 
 TapComment["Apply the distributive law to arbitrary operators:"], 
 TapTestSame[Distribute[(a \[CirclePlus] b \[CirclePlus] c) \[CircleTimes] 
    (u \[CirclePlus] v), CirclePlus, CircleTimes], 
  a \[CircleTimes] u \[CirclePlus] a \[CircleTimes] v \[CirclePlus] 
   b \[CircleTimes] u \[CirclePlus] b \[CircleTimes] v \[CirclePlus] 
   c \[CircleTimes] u \[CirclePlus] c \[CircleTimes] v], 
 TapComment["Distribute f over g to give fp and gp:"], 
 TapTestSame[Distribute[f[g[a, b], g[c, d, e]], g, f, gp, fp], 
  gp[fp[a, c], fp[a, d], fp[a, e], fp[b, c], fp[b, d], fp[b, e]]], 
 TapTestSame[Distribute[(a + b + c)*(u + v), Plus, Times, plus, times], 
  plus[times[a, u], times[a, v], times[b, u], times[b, v], times[c, u], 
   times[c, v]]], TapComment[
  "Expand symbolic matrix and vector expressions: "], 
 TapTestSame[Distribute[(m1 + m2) . (m3 + m4)], 
  m1 . m3 + m1 . m4 + m2 . m3 + m2 . m4], 
 TapTestSame[Distribute[Cross[v1 + v2, v3 + v4]], 
  Cross[v1, v3] + Cross[v1, v4] + Cross[v2, v3] + Cross[v2, v4]], 
 TapComment["Apply the distributive law with any operator:"], 
 TapTestSame[Distribute[(a + b) \[CirclePlus] (x + y + z) \[CirclePlus] 
    (s + t)], a \[CirclePlus] x \[CirclePlus] s + 
   a \[CirclePlus] x \[CirclePlus] t + a \[CirclePlus] y \[CirclePlus] s + 
   a \[CirclePlus] y \[CirclePlus] t + a \[CirclePlus] z \[CirclePlus] s + 
   a \[CirclePlus] z \[CirclePlus] t + b \[CirclePlus] x \[CirclePlus] s + 
   b \[CirclePlus] x \[CirclePlus] t + b \[CirclePlus] y \[CirclePlus] s + 
   b \[CirclePlus] y \[CirclePlus] t + b \[CirclePlus] z \[CirclePlus] s + 
   b \[CirclePlus] z \[CirclePlus] t], 
 TapComment["Find the list of all possible combinations of elements:"], 
 TapTestSame[Distribute[{{a, b}, {x, y, z}, {s, t}}, List], 
  {{a, x, s}, {a, x, t}, {a, y, s}, {a, y, t}, {a, z, s}, {a, z, t}, 
   {b, x, s}, {b, x, t}, {b, y, s}, {b, y, t}, {b, z, s}, {b, z, t}}], 
 TapComment["Generate a powerset:"], 
 TapTestSame[Distribute[({{}, {#1}} & ) /@ {a, b, c}, List, List, List, 
   Join], {{}, {c}, {b}, {b, c}, {a}, {a, c}, {a, b}, {a, b, c}}], 
 TapComment[
  "Find intermediate terms from a direct application of the distributive \
law:"], TapTestSame[Distribute[Factor[x^6 - 1], Plus, Times, List, Times], 
  {-1, -x, -x^2, x, x^2, x^3, -x^2, -x^3, -x^4, -x, -x^2, -x^3, x^2, x^3, 
   x^4, -x^3, -x^4, -x^5, x, x^2, x^3, -x^2, -x^3, -x^4, x^3, x^4, x^5, x^2, 
   x^3, x^4, -x^3, -x^4, -x^5, x^4, x^5, x^6}], 
 TapTestSameBROKEN[Plus @@ %, -1 + x^6], TapComment["For pure products, \
RefLink[Distribute,paclet:ref/Distribute] gives the same results as \
RefLink[Expand,paclet:ref/Expand]:"], TapTestSame[Factor[x^10 - 1], 
  (-1 + x)*(1 + x)*(1 - x + x^2 - x^3 + x^4)*(1 + x + x^2 + x^3 + x^4)], 
 TapTestSameBROKEN[Distribute[%], -1 + x^10], TapComment["RefLink[PowerExpand\
,paclet:ref/PowerExpand] corresponds to distribution over \
RefLink[Times,paclet:ref/Times]:"], TapTestSame[PowerExpand[(x*y*z)^n], 
  x^n*y^n*z^n], TapTestSame[Distribute[(x*y*z)^n, Times], x^n*y^n*z^n], 
 TapComment["RefLink[Outer,paclet:ref/Outer] forms the same combinations of \
all elements, but in a nested structure:"], 
 TapTestSame[Outer[List, {a, b, c}, {x, y}], 
  {{{a, x}, {a, y}}, {{b, x}, {b, y}}, {{c, x}, {c, y}}}], 
 TapTestSame[Distribute[{{a, b, c}, {x, y}}, List], 
  {{a, x}, {a, y}, {b, x}, {b, y}, {c, x}, {c, y}}], 
 TapComment["This use of RefLink[Distribute,paclet:ref/Distribute] does not \
give the expected result:"], TapTestSame[Distribute[(a + b)*(a + b)], 
  a^2 + b^2], TapComment["The reason is that the argument is evaluated first \
and the product vanishes:"], TapTestSame[(a + b)*(a + b), (a + b)^2], 
 TapTestSameBROKEN[Distribute[%], a^2 + b^2], TapComment["Prevent evaluation \
of the argument before RefLink[Distribute,paclet:ref/Distribute] sees it:"], 
 TapTestSame[Distribute[Unevaluated[(a + b)*(a + b)]], a^2 + 2*a*b + b^2], 
 TapComment["Find all possible sums of sublists of a list:"], 
 TapTestSame[Union[Distribute[Thread[{{1, 2, 2, 8}, 0}], List, List, List, 
    Plus]], {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13}]]
