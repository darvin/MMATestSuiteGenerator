(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Define 0 to be the default argument for a function f:"], 
 TapTestSame[Default[f] = 0, 0], 
 TapComment["_. represents an argument that can be omitted:"], 
 TapTestSame[f[x_., y_.] = {x, y}, {x, y}], 
 TapComment[
  "If the second argument is omitted, the default value of 0 is used \
instead:"], TapTestSame[f[a], {a, 0}], 
 TapComment[
  "If both arguments are omitted, both are taken to have the default value \
0:"], TapTestSame[f[], {0, 0}]]
