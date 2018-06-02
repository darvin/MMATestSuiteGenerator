(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Take a span of elements from a list:"], 
 TapTestSame[{a, b, c, d, e, f, g, h}[[2 ;; 5]], {b, c, d, e}], 
 TapComment["Assign to a span of elements:"], 
 TapTestSame[t = {a, b, c, d, e, f, g, h}, {a, b, c, d, e, f, g, h}], 
 TapTestSame[t[[2 ;; 5]] = x, x], TapTestSame[t, {a, x, x, x, x, f, g, h}], 
 TapComment["Assign a sequence of different elements:"], 
 TapTestSame[t[[2 ;; 5]] = {p, q, r, s}, {p, q, r, s}], 
 TapTestSame[t, {a, p, q, r, s, f, g, h}], 
 TapComment["Negative indices count from the end:"], 
 TapTestSame[{a, b, c, d, e, f, g, h}[[2 ;; -3]], {b, c, d, e, f}]]
