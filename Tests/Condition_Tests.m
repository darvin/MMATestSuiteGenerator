(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTestBROKEN[f[5], ppp[5]], ESameTest[f[-6], f[-6]], 
 EComment[
  "Replace all elements which satisfy the condition of being negative:"], 
 ESameTest[{6, -7, 3, 2, -1, -2} /. x_ /; x < 0 -> w, {6, w, 3, 2, w, w}], 
 ESameTest[f[0], f[0]], ESameTestBROKEN[f[6], 25], 
 ESameTestBROKEN[f[4], {{2, 1}, {3, 1}, {5, 1}, {3491, 1}}], 
 ESameTest[f[5], f[5]]]
