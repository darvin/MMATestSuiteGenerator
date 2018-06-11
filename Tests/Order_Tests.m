(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{0, 1, -1}]], 
 TapComment["Find which tuples are in order:"], 
 TapTestSame[Tuples[{0, 1, 2}, 2], {{0, 0}, {0, 1}, {0, 2}, {1, 0}, {1, 1}, 
   {1, 2}, {2, 0}, {2, 1}, {2, 2}}], TapTestSameBROKEN[Apply[Order, %, {1}], 
  {0, 1, 1, -1, 0, 1, -1, -1, 0}], TapComment["RefLink[Order,paclet:ref/Order\
] operates structurally, not by numerical value:"], 
 TapTestSame[Order[6, Pi], 1], TapTestSame[Order[6, N[Pi]], -1]]
