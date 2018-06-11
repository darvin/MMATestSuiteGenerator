(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["A pattern that matches any expression:"], 
 TapTestSame[MatchQ[any[expression], _], True], 
 TapComment["A pattern that matches any symbol:"], 
 TapTestSame[MatchQ[symbol, _Symbol], True], 
 TapComment["A function definition that will take any single argument:"], 
 TapTestSame[f[x_] := (x + 1)^2; {f[1], f[a + b*c]}, {4, (1 + a + b*c)^2}], 
 TapComment["A function definition for integer arguments only:"], 
 TapTestSame[g[x_Integer] := Prime[x] - x; {g[10], g[z]}, {19, g[z]}]]
