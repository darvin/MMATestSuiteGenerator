(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[f[6], a], TapTestSameBROKEN[f[6], a], 
 TapTestSameBROKEN[g[6], 6], TapTestSameBROKEN[h[6], a]]
