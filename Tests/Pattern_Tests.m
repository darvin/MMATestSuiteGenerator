(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Give a name to lists of integers: "], 
 ESameTest[Cases[{{1, 2, 3}, a, {4, 5}}, t:{__Integer} :> t^2], 
  {{1, 4, 9}, {16, 25}}], ESameTest[Cases[{{1, 2, 3}, a, {4, 5}}, 
   t:{__Integer} :> t^2], {{1, 4, 9}, {16, 25}}]]
