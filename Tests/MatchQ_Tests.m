(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test if an expression is an integer:"], 
 TapTestSame[MatchQ[12345, _Integer], True], 
 TapComment["Test if an expression is a sum of two or more terms:"], 
 TapTestSame[MatchQ[(x - 1)*(1 + 2*x + 3*x^2), _ + __], False], 
 TapTestSame[MatchQ[Expand[x*(1 + 2*x + 3*x^2)], _ + __], True], 
 TapComment["Test if an expression is explicitly zero:"], 
 TapTestSame[MatchQ[1 + 1/GoldenRatio - GoldenRatio, 0], False], 
 TapTestSame[MatchQ[Simplify[1 + 1/GoldenRatio - GoldenRatio], 0], True]]
