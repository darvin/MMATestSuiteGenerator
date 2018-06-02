(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[{Order[a, a], Order[a, b], Order[b, a]}, 
  {0, 1, -1}], EComment["Find which tuples are in order:"], 
 ESameTest[Tuples[{0, 1, 2}, 2], {{0, 0}, {0, 1}, {0, 2}, {1, 0}, {1, 1}, 
   {1, 2}, {2, 0}, {2, 1}, {2, 2}}], ESameTestBROKEN[Apply[Order, %, {1}], 
  {0, 1, 1, -1, 0, 1, -1, -1, 0}], EComment["RefLink[Order,paclet:ref/Order] \
operates structurally, not by numerical value:"], ESameTest[Order[6, Pi], 1], 
 ESameTest[Order[6, N[Pi]], -1]]
