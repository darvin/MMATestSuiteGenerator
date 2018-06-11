(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Make a definition with the condition that x should be positive:"], 
 TapTestSame[f[x_] := ppp[x] /; x > 0; f[5], ppp[5]], 
 TapTestSame[f[-6], f[-6]], 
 TapComment[
  "Replace all elements which satisfy the condition of being negative:"], 
 TapTestSame[{6, -7, 3, 2, -1, -2} /. x_ /; x < 0 -> w, {6, w, 3, 2, w, w}], 
 TapComment["Share a variable between a condition and function body:"], 
 TapTestSame[f[x_] := Module[{u}, u^2 /; (u = x - 1) > 0]; f[0], f[0]], 
 TapTestSameBROKEN[f[6], 25], TapComment["Use \
RefLink[Condition,paclet:ref/Condition] inside a function body to control \
evaluation: "], TapTestSameBROKEN[
  f[x_] := Module[{a}, a = Prime[10^x]; FactorInteger[a + 1] /; a < 10^6]; 
   f[4], {{2, 1}, {3, 1}, {5, 1}, {3491, 1}}], TapTestSame[f[5], f[5]]]
