(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Define 0 to be the default argument for a function f:"], 
 ESameTest[Default[f] = 0, 0], 
 EComment["_. represents an argument that can be omitted:"], 
 ESameTest[f[x_., y_.] = {x, y}, {x, y}], 
 EComment[
  "If the second argument is omitted, the default value of 0 is used \
instead:"], ESameTest[f[a], {a, 0}], 
 EComment[
  "If both arguments are omitted, both are taken to have the default value \
0:"], ESameTest[f[], {0, 0}]]
