(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Replace instances of either a or b:"], 
 ESameTest[{a, b, c, d, a, b, b, b} /. a | b -> x, {x, x, c, d, x, x, x, x}], 
 EComment["Pick out integers or reals:"], 
 ESameTest[Cases[{5.6, 5/6, 5, 6, x}, _Integer | _Real], {5.6, 5, 6}]]
