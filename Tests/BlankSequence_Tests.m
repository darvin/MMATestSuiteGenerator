(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTestBROKEN[{f[x, y, z], f[]}, {3, f[]}], 
 ESameTestBROKEN[{f[1., N[Pi]], f[1, N[Pi]]}, {2.0708, f[1, 3.14159]}], 
 ESameTestBROKEN[{f[x, 1, 2], f[0, 1, 2], f[x, 1, 2.]}, 
  {x + x^2, f[0, 1, 2], f[x, 1, 2.]}]]
