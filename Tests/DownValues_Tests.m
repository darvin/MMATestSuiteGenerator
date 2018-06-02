(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["These are the downvalues associated with f:"], 
 TapTestSameBROKEN[DownValues[f], {HoldPattern[f[1]] :> 2, 
   HoldPattern[f[2]] :> 3, HoldPattern[f[x_]] :> x^2}], 
 TapTestSameBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapTestSameBROKEN[Null, g[1] := 1*g[x_] := 2*g[x - 1]], 
 TapTestSameBROKEN[g[5], 16], TapTestSameBROKEN[DownValues[f], 
  {HoldPattern[f[x_ /; x > -2]] :> g1[x], HoldPattern[f[x_ /; x < 2]] :> 
    g2[x]}], TapTestSameBROKEN[f[0], g1[0]], 
 TapComment["Now reorder the definitions: "], 
 TapTestSameBROKEN[DownValues[f] = Reverse[DownValues[f]], 
  {HoldPattern[f[x_ /; x < 2]] :> g2[x], HoldPattern[f[x_ /; x > -2]] :> 
    g1[x]}], TapTestSameBROKEN[f[0], g2[0]], 
 TapTestSameBROKEN[DownValues[g] = DownValues[f] /. f -> g, 
  {HoldPattern[g[1]] :> 1, HoldPattern[g[x_]] :> 2*g[x - 1]}], 
 TapTestSameBROKEN[g[10], 512], TapTestSameBROKEN[DownValues[f], 
  {HoldPattern[f[1]] :> 1, HoldPattern[f[n_]] :> n*f[n - 1]}], 
 TapTestSameBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapTestSameBROKEN[f[x_] :> x^2, (x_)^2 :> x^2], 
 TapTestSameBROKEN[f[x_] := x^3, f[x_] := x^3], 
 TapComment["RefLink[DownValues,paclet:ref/DownValues] returns a value that \
can be used in a program:"], TapTestSame[DownValues[f], 
  {HoldPattern[f[x_]] :> x^3}], TapTestSame[Hold[f[2]] /. DownValues[f], 
  Hold[2^3]]]
