(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Use the function with both arguments specified explicitly:"], 
 ESameTestBROKEN[f[a, b], {a, b}], 
 EComment["The second argument is now taken to have its default value:"], 
 ESameTestBROKEN[f[a], {a, 0}]]
