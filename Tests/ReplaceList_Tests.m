(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Give the results of all possible replacements:"], 
 ESameTest[ReplaceList[{a, b, c, d, e, f}, {x__, y__} -> {{x}, {y}}], 
  {{{a}, {b, c, d, e, f}}, {{a, b}, {c, d, e, f}}, {{a, b, c}, {d, e, f}}, 
   {{a, b, c, d}, {e, f}}, {{a, b, c, d, e}, {f}}}], 
 EComment["Give only the first replacement that applies:"], 
 ESameTest[Replace[{a, b, c, d, e, f}, {x__, y__} -> {{x}, {y}}], 
  {{a}, {b, c, d, e, f}}], EComment["Use all rules that apply:"], 
 ESameTest[ReplaceList[x, {x -> a, x -> b, x -> c}], {a, b, c}], 
 EComment["Use only the first rule:"], 
 ESameTest[Replace[x, {x -> a, x -> b, x -> c}], a], 
 EComment["Find the possible values to break a sum of terms in two:"], 
 ESameTest[ReplaceList[a + b + c, (x_) + (y_) -> g[x, y]], 
  {g[a, b + c], g[b, a + c], g[c, a + b], g[a + b, c], g[a + c, b], 
   g[b + c, a]}], EComment["Generate all consecutive nonempty sublists:"], 
 ESameTest[ReplaceList[{a, b, c, d}, {___, x__, ___} -> {x}], 
  {{a}, {a, b}, {a, b, c}, {a, b, c, d}, {b}, {b, c}, {b, c, d}, {c}, {c, d}, 
   {d}}], EComment["Find all elements that appear twice:"], 
 ESameTest[ReplaceList[{a, b, b, b, c, c, a}, {___, x_, x_, ___} -> x], 
  {b, b, c}], EComment["Find all sublists flanked by the same element:"], 
 ESameTest[ReplaceList[{a, b, c, a, d, b, d}, {___, x_, y__, x_, ___} -> 
    {x, {y}}], {{a, {b, c}}, {b, {c, a, d}}, {d, {b}}}]]
