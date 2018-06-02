(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Give the results of all possible replacements:"], 
 TapTestSame[ReplaceList[{a, b, c, d, e, f}, {x__, y__} -> {{x}, {y}}], 
  {{{a}, {b, c, d, e, f}}, {{a, b}, {c, d, e, f}}, {{a, b, c}, {d, e, f}}, 
   {{a, b, c, d}, {e, f}}, {{a, b, c, d, e}, {f}}}], 
 TapComment["Give only the first replacement that applies:"], 
 TapTestSame[Replace[{a, b, c, d, e, f}, {x__, y__} -> {{x}, {y}}], 
  {{a}, {b, c, d, e, f}}], TapComment["Use all rules that apply:"], 
 TapTestSame[ReplaceList[x, {x -> a, x -> b, x -> c}], {a, b, c}], 
 TapComment["Use only the first rule:"], 
 TapTestSame[Replace[x, {x -> a, x -> b, x -> c}], a], 
 TapComment["Find the possible values to break a sum of terms in two:"], 
 TapTestSame[ReplaceList[a + b + c, (x_) + (y_) -> g[x, y]], 
  {g[a, b + c], g[b, a + c], g[c, a + b], g[a + b, c], g[a + c, b], 
   g[b + c, a]}], TapComment["Generate all consecutive nonempty sublists:"], 
 TapTestSame[ReplaceList[{a, b, c, d}, {___, x__, ___} -> {x}], 
  {{a}, {a, b}, {a, b, c}, {a, b, c, d}, {b}, {b, c}, {b, c, d}, {c}, {c, d}, 
   {d}}], TapComment["Find all elements that appear twice:"], 
 TapTestSame[ReplaceList[{a, b, b, b, c, c, a}, {___, x_, x_, ___} -> x], 
  {b, b, c}], TapComment["Find all sublists flanked by the same element:"], 
 TapTestSame[ReplaceList[{a, b, c, a, d, b, d}, {___, x_, y__, x_, ___} -> 
    {x, {y}}], {{a, {b, c}}, {b, {c, a, d}}, {d, {b}}}]]
