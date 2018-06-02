(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test if an expression is an integer:"], 
 ESameTest[MatchQ[12345, _Integer], True], 
 EComment["Test if an expression is a sum of two or more terms:"], 
 ESameTest[MatchQ[(x - 1)*(1 + 2*x + 3*x^2), _ + __], False], 
 ESameTest[MatchQ[Expand[x*(1 + 2*x + 3*x^2)], _ + __], True], 
 EComment["Test if an expression is explicitly zero:"], 
 ESameTest[MatchQ[1 + 1/GoldenRatio - GoldenRatio, 0], False], 
 ESameTest[MatchQ[Simplify[1 + 1/GoldenRatio - GoldenRatio], 0], True]]
