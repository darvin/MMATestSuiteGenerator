(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Use an infix notation:"], 
 TapTestSameBROKEN[Infix[f[a, b, c], "#"], a*b*c]]
