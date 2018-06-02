(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "RefLink[Break,paclet:ref/Break] breaks out of \
RefLink[For,paclet:ref/For]:"], 
 TapTestSame[For[i = 1, i < 1000, i++, If[i > 10, Break[]]]; i, 11]]
