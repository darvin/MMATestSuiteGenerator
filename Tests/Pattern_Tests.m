(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Give a name to lists of integers: "], 
 TapTestSame[Cases[{{1, 2, 3}, a, {4, 5}}, t:{__Integer} :> t^2], 
  {{1, 4, 9}, {16, 25}}], TapTestSame[Cases[{{1, 2, 3}, a, {4, 5}}, 
   t:{__Integer} :> t^2], {{1, 4, 9}, {16, 25}}]]
