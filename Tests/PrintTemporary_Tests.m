(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Print a temporary cell during an evaluation: "], 
 TapTestSame[PrintTemporary["text"]; Pause[2]; 17, 17]]
