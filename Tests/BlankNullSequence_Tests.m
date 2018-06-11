(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["A function that works with any number of arguments:"], 
 TapTestSame[f[x___] := p[x, x]; {f[], f[1], f[1, a]}, 
  {p[], p[1, 1], p[1, a, 1, a]}], 
 TapComment["A function that works with any number of integer arguments:"], 
 TapTestSame[f[x___Integer] := p[x, Plus[x]]; {f[], f[1], f[1, 2, 3], 
    f[1, b, 3]}, {p[0], p[1, 1], p[1, 2, 3, 6], f[1, b, 3]}], 
 TapComment[
  "A function that works with an integer followed by any number of \
arguments:"], TapTestSameBROKEN[f[x_Integer, y___] := (Plus[y])^x; 
   {f[1], f[1, 2.], f[1, 2., x], f[x, 1, y]}, {0, 2., 2. + x, f[x, 1, y]}]]
