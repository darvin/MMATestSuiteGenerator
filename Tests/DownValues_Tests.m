(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["These are the downvalues associated with f:"], 
 TapTestSameBROKEN[DownValues[f], {HoldPattern[f[1]] :> 2, 
   HoldPattern[f[2]] :> 3, HoldPattern[f[x_]] :> x^2}], 
 TapComment["RefLink[DownValues,paclet:ref/DownValues] returns rules \
corresponding to definitions made for a symbol:"], 
 TapTestSame[f[x_] := x^2; DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapComment["RefLink[DownValues,paclet:ref/DownValues] can be used to set the \
values directly:"], TapTestSameBROKEN[DownValues[g] = 
   {g[1] :> 1, g[x_] :> 2*g[x - 1]} ;; g[1] := 1
 
g[x_] := 2*g[x - 1]
 
g[x_ /; x < 2] := g2[x]
 
g[x_ /; x > -2] := g1[x], g[1] := 1*g[x_] := 2*g[x - 1]], 
 TapTestSame[g[5], 16], TapComment[
  "The resulting rules are in the order given: "], 
 TapTestSameBROKEN[f[x_ /; x > -2] := g1[x]*f[x_ /; x < 2] := g2[x]; 
   DownValues[f], {HoldPattern[f[x_ /; x > -2]] :> g1[x], 
   HoldPattern[f[x_ /; x < 2]] :> g2[x]}], TapTestSame[f[0], g1[0]], 
 TapComment["Now reorder the definitions: "], 
 TapTestSameBROKEN[DownValues[f] = Reverse[DownValues[f]], 
  {HoldPattern[f[x_ /; x < 2]] :> g2[x], HoldPattern[f[x_ /; x > -2]] :> 
    g1[x]}], TapTestSameBROKEN[f[0], g2[0]], 
 TapComment["Copy a symbol's definitions to another symbol:"], 
 TapTestSameBROKEN[f[1] = 1; f[x_] := 2*f[x - 1]; 
   DownValues[g] = DownValues[f] /. f -> g, {HoldPattern[g[1]] :> 1, 
   HoldPattern[g[x_]] :> 2*g[x - 1]}], TapTestSame[g[10], 512], 
 TapComment["Values can be defined by immediate or delayed assignments:"], 
 TapTestSameBROKEN[f[1] = 1; f[n_] := n*f[n - 1]; DownValues[f], 
  {HoldPattern[f[1]] :> 1, HoldPattern[f[n_]] :> n*f[n - 1]}], 
 TapComment["RefLink[HoldPattern,paclet:ref/HoldPattern] is used to protect \
the rules from their own definitions:"], TapTestSameBROKEN[
  f[x_] := x^2; DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapTestSame[f[x_] :> x^2, (x_)^2 :> x^2], TapComment["RefLink[Definition,pac\
let:ref/Definition] and RefLink[Information,paclet:ref/Information] display \
downvalues but do not return them as values:"], 
 TapTestSameBROKEN[f[x_] := x^3; f[1] = 1
 
f[x_] := x^3
 
f[x_ /; x < 2] := g2[x]
 
f[x_ /; x > -2] := g1[x], f[x_] := x^3], TapComment["RefLink[DownValues,pacle\
t:ref/DownValues] returns a value that can be used in a program:"], 
 TapTestSameBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^3}], 
 TapComment[
  "Evaluation of an expression involves applying rules for its head:"], 
 TapTestSame[f[x_] := x^3; Hold[f[2]] /. DownValues[f], Hold[2^3]]]
