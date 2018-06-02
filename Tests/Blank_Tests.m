(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["A pattern that matches any expression:"], 
 TapTestSame[MatchQ[any[expression], _], True], 
 TapComment["A pattern that matches any symbol:"], 
 TapTestSame[MatchQ[symbol, _Symbol], True], 
 TapTestSameBROKEN[{f[1], f[a + b*c]}, {4, (1 + a + b*c)^2}], 
 TapTestSameBROKEN[{g[10], g[z]}, {19, g[z]}]]
