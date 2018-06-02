(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["A pattern that matches any expression:"], 
 ESameTest[MatchQ[any[expression], _], True], 
 EComment["A pattern that matches any symbol:"], 
 ESameTest[MatchQ[symbol, _Symbol], True], 
 ESameTestBROKEN[{f[1], f[a + b*c]}, {4, (1 + a + b*c)^2}], 
 ESameTestBROKEN[{g[10], g[z]}, {19, g[z]}]]
