(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Print a temporary cell during an evaluation: "], 
 ESameTest[PrintTemporary["text"]; Pause[2]; 17, 17]]
