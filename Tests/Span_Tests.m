(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Take a span of elements from a list:"], 
 ESameTest[{a, b, c, d, e, f, g, h}[[2 ;; 5]], {b, c, d, e}], 
 EComment["Assign to a span of elements:"], 
 ESameTest[t = {a, b, c, d, e, f, g, h}, {a, b, c, d, e, f, g, h}], 
 ESameTest[t[[2 ;; 5]] = x, x], ESameTest[t, {a, x, x, x, x, f, g, h}], 
 EComment["Assign a sequence of different elements:"], 
 ESameTest[t[[2 ;; 5]] = {p, q, r, s}, {p, q, r, s}], 
 ESameTest[t, {a, p, q, r, s, f, g, h}], 
 EComment["Negative indices count from the end:"], 
 ESameTest[{a, b, c, d, e, f, g, h}[[2 ;; -3]], {b, c, d, e, f}]]
