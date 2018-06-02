(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Trace each step in an evaluation:"], 
 TapTestSameBROKEN[Trace[u = 2; Do[u = u*u, {3}]; u], 
  {u = 2; Do[u = u*u, {3}]; u, {u = 2, 2}, {Do[u = u*u, {3}], 
    {{{u, 2}, {u, 2}, 2*2, 4}, u = 4, 4}, {{{u, 4}, {u, 4}, 4*4, 16}, u = 16, 
     16}, {{{u, 16}, {u, 16}, 16*16, 256}, u = 256, 256}, Null}, {u, 256}, 
   256}], TapComment[
  "Trace only the computations with head RefLink[Times,paclet:ref/Times]:"], 
 TapTestSameBROKEN[Trace[u = 2; Do[u = u*u, {3}]; u, Times], 
  {{{{2*2, 4}}, {{4*4, 16}}, {{16*16, 256}}}}]]
