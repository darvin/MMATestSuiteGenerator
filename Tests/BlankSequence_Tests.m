(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "A function definition that works with any nonzero number of arguments:"], 
 TapTestSame[f[x__] := Length[{x}]; {f[x, y, z], f[]}, {3, f[]}], 
 TapComment["A function definition that works with any nonzero number of real \
arguments:"], TapTestSame[f[x__Real] := (Plus[x])/Length[{x}]; 
   {f[1., N[Pi]], f[1, N[Pi]]}, {2.0708, f[1, 3.14159]}], 
 TapComment["A function definition for a symbol followed by any nonzero \
number of integer arguments:"], 
 TapTestSame[f[x_Symbol, p__Integer] := Plus @@ (x^{p}); 
   {f[x, 1, 2], f[0, 1, 2], f[x, 1, 2.]}, {x + x^2, f[0, 1, 2], f[x, 1, 2.]}]]
