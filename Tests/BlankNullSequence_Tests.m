(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTestBROKEN[{f[], f[1], f[1, a]}, 
  {p[], p[1, 1], p[1, a, 1, a]}], ESameTestBROKEN[
  {f[], f[1], f[1, 2, 3], f[1, b, 3]}, {p[0], p[1, 1], p[1, 2, 3, 6], 
   f[1, b, 3]}], ESameTestBROKEN[{f[1], f[1, 2.], f[1, 2., x], f[x, 1, y]}, 
  {0, 2., 2. + x, f[x, 1, y]}]]
