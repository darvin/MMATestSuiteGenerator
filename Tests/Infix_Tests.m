(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Use an infix notation:"], 
 ESameTestBROKEN[Infix[f[a, b, c], "#"], a*b*c]]
