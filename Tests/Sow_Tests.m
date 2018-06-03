(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Evaluate a sequence of expressions, \"sowing\" some to \
be collected by RefLink[Reap,paclet:ref/Reap]:"], 
 TapTestSame[Reap[Sow[a]; b; Sow[c]; Sow[d]; e], {e, {{a, c, d}}}], 
 TapComment["Compute a sum, \"sowing\" i^2 at each step:"], 
 TapTestSame[Reap[Sum[Sow[i^2] + 1, {i, 10}]], 
  {395, {{1, 4, 9, 16, 25, 36, 49, 64, 81, 100}}}], 
 TapComment[
  "Make separate lists for expressions \"sown\" with different tags:"], 
 TapTestSame[Reap[Sow[1, x]; Sow[2, y]; Sow[3, x]; Sow[4, y]], 
  {4, {{1, 3}, {2, 4}}}], TapComment[
  "Reap only expressions \"sown\" with tag x:"], 
 TapTestSame[Reap[Sow[1, x]; Sow[2, y]; Sow[3, x]; Sow[4, y], x], 
  {4, {{1, 3}}}], TapComment[
  "RefLink[Sow,paclet:ref/Sow] can be used anywhere in a computation:"], 
 TapTestSame[Reap[(If[PrimeQ[#1], Sow[#1]] & ) //@ Integrate[1/(x^5 - 1), 
      x]; ], {Null, {{-2, 2, 5, 5, 2, 5, 5, 5, -2, -2, 5, -2, 5, 5, 5, 5, 2, 
     5, 5, 2}}}], TapTestSameBROKEN[Reap[f //@ Integrate[1/(x^5 - 1), x]; ], 
  {Null, {{-2, 2, 5, 5, 2, 5, 5, 5, -2, -2, 5, -2, 5, 5, 5, 5, 2, 5, 5, 
     2}}}], TapComment[
  "A single expression can be \"sown\" with multiple tags:"], 
 TapTestSame[Reap[Sow[1, x]; Sow[2, {x, y}]; Sow[3, y]], 
  {3, {{1, 2}, {2, 3}}}], TapComment[
  "If a single tag is repeated, the expression is sown repeatedly:"], 
 TapTestSame[Reap[Sow[1, {x, x, x}]; Sow[2, {x, y}]; Sow[3, y]], 
  {3, {{1, 1, 1, 2}, {2, 3}}}], TapComment["A pattern in \
RefLink[Reap,paclet:ref/Reap] can be used to specify which tags to collect:"]\
, TapTestSame[Reap[Sow[1, x]; Sow[2, {x, y}]; Sow[3, {y, z}]; 
    Sow[4, {x, y, z}], x | y], {4, {{1, 2, 4}, {2, 3, 4}}}], 
 TapComment[
  "The default is the pattern _, so that everything is collected:"], 
 TapTestSame[Reap[Sow[1, x]; Sow[2, {x, y}]; Sow[3, {y, z}]; 
    Sow[4, {x, y, z}]], {4, {{1, 2, 4}, {2, 3, 4}, {3, 4}}}], 
 TapComment["Tags can have any form; here they are \
RefLink[True,paclet:ref/True] and RefLink[False,paclet:ref/False]:"], 
 TapTestSame[Reap[(Sow[#1, #1 > 0] & ) /@ {1, -1, 2, -3, 1, 4, 5}; ], 
  {Null, {{1, 2, 1, 4, 5}, {-1, -3}}}], 
 TapTestSame[Reap[(Sow[#1, #1 > 0] & ) /@ {1, -1, 2, -3, 1, 4, 5}; , True], 
  {Null, {{1, 2, 1, 4, 5}}}], TapComment["Make a list of all the steps taken \
in evaluating RefLink[FindRoot,paclet:ref/FindRoot]:"], 
 TapTestSameBROKEN[Reap[FindRoot[Cos[x] == x, {x, 1}, 
    StepMonitor :> Sow[x]]], {{x -> 0.739085}, 
   {{0.750364, 0.739113, 0.739085, 0.739085}}}], 
 TapComment["Evaluate an iterated map, keeping iterates that are below \
1/100:"], TapTestSameBROKEN[
  Reap[Nest[(If[#1 < 1/100, Sow[#1]]; (4*#1)*(1 - #1)) & , 0.2, 100]], 
  {0.875591, {{0.000246305, 0.000984976, 0.00393603, 0.00631451, 
     0.00264312}}}], TapComment[
  "Find equivalence classes with respect to the value of i^2 mod 10:"], 
 TapTestSame[Reap[Do[Sow[i, Mod[i^2, 10]], {i, 20}]], 
  {Null, {{1, 9, 11, 19}, {2, 8, 12, 18}, {3, 7, 13, 17}, {4, 6, 14, 16}, 
    {5, 15}, {10, 20}}}], TapComment["RefLink[Sow,paclet:ref/Sow][x] returns \
x, \"sowing\" it as a side effect:"], TapTestSame[Sow[x], x], 
 TapComment["Expressions sown are reaped by the innermost enclosing \
RefLink[Reap,paclet:ref/Reap]:"], 
 TapTestSame[Reap[Reap[Sow[2^20]; Sow[2^30]]], 
  {{1073741824, {{1048576, 1073741824}}}, {}}]]
