(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["These are the downvalues associated with f:"], 
 ESameTestBROKEN[DownValues[f], {HoldPattern[f[1]] :> 2, 
   HoldPattern[f[2]] :> 3, HoldPattern[f[x_]] :> x^2}], 
 ESameTestBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 ESameTestBROKEN[Null, g[1] := 1*g[x_] := 2*g[x - 1]], 
 ESameTestBROKEN[g[5], 16], ESameTestBROKEN[DownValues[f], 
  {HoldPattern[f[x_ /; x > -2]] :> g1[x], HoldPattern[f[x_ /; x < 2]] :> 
    g2[x]}], ESameTestBROKEN[f[0], g1[0]], 
 EComment["Now reorder the definitions: "], 
 ESameTestBROKEN[DownValues[f] = Reverse[DownValues[f]], 
  {HoldPattern[f[x_ /; x < 2]] :> g2[x], HoldPattern[f[x_ /; x > -2]] :> 
    g1[x]}], ESameTestBROKEN[f[0], g2[0]], 
 ESameTestBROKEN[DownValues[g] = DownValues[f] /. f -> g, 
  {HoldPattern[g[1]] :> 1, HoldPattern[g[x_]] :> 2*g[x - 1]}], 
 ESameTestBROKEN[g[10], 512], ESameTestBROKEN[DownValues[f], 
  {HoldPattern[f[1]] :> 1, HoldPattern[f[n_]] :> n*f[n - 1]}], 
 ESameTestBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 ESameTestBROKEN[f[x_] :> x^2, (x_)^2 :> x^2], 
 ESameTestBROKEN[f[x_] := x^3, f[x_] := x^3], EComment["RefLink[DownValues,pa\
clet:ref/DownValues] returns a value that can be used in a program:"], 
 ESameTest[DownValues[f], {HoldPattern[f[x_]] :> x^3}], 
 ESameTest[Hold[f[2]] /. DownValues[f], Hold[2^3]]]
