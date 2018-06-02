(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Replace instances of either a or b:"], 
 TapTestSame[{a, b, c, d, a, b, b, b} /. a | b -> x, 
  {x, x, c, d, x, x, x, x}], TapComment["Pick out integers or reals:"], 
 TapTestSame[Cases[{5.6, 5/6, 5, 6, x}, _Integer | _Real], {5.6, 5, 6}]]
