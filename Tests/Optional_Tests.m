(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Use the function with both arguments specified explicitly:"], 
 TapTestSameBROKEN[f[a, b], {a, b}], 
 TapComment["The second argument is now taken to have its default value:"], 
 TapTestSameBROKEN[f[a], {a, 0}]]
