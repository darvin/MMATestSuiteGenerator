(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[{f[True], f[False], f[x]}, {1, 0, 0}], 
 TapTestSameBROKEN[e = (1 + x)/(1 - x) + x/(1 + x); t[e], Together], 
 TapComment["Try the transformation:"], TapTestSameBROKEN[e1 = t[e][e], 
  (-1 - 3*x)/((-1 + x)*(1 + x))]]
