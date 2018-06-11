(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[
   HoldComplete[1 + 1, Evaluate[1 + 2], Sequence[3, 4]]]], 
 TapComment["RefLink[HoldComplete,paclet:ref/HoldComplete] is the standard \
container with attribute \
RefLink[HoldAllComplete,paclet:ref/HoldAllComplete]:"], 
 TapTestSame[Attributes[HoldComplete], {HoldAllComplete, Protected}], 
 TapTestSame[HoldComplete[Sequence[a, b], 1 + 2], 
  HoldComplete[Sequence[a, b], 1 + 2]], TapComment["No form of evaluation \
control affects an expression with attribute \
RefLink[HoldAllComplete,paclet:ref/HoldAllComplete]:"], 
 TapTestSame[HoldComplete[1 + 2], HoldComplete[1 + 2]], 
 TapTestSame[HoldComplete[Evaluate[1 + 2]], HoldComplete[Evaluate[1 + 2]]], 
 TapTestSame[HoldComplete[Sequence[a, b]], HoldComplete[Sequence[a, b]]], 
 TapTestSame[g /: HoldComplete[g[x_]] := x; HoldComplete[g[1]], 
  HoldComplete[g[1]]], TapComment["Substitution still happens inside \
RefLink[HoldComplete,paclet:ref/HoldComplete]:"], 
 TapTestSame[HoldComplete[f[1 + 2]] /. f[x_] :> g[x], 
  HoldComplete[g[1 + 2]]], TapComment["RefLink[ReleaseHold,paclet:ref/Release\
Hold] removes one level of RefLink[HoldComplete,paclet:ref/HoldComplete]:"], 
 TapTestSameBROKEN[ReleaseHold[HoldComplete[Sequence[1, 2]]], 
  Sequence[1, 2]], TapComment["RefLink[Hold,paclet:ref/Hold] is a milder form \
of RefLink[HoldComplete,paclet:ref/HoldComplete] that allows for some form of \
evaluation:"], TapTestSame[Hold[1 + 2], Hold[1 + 2]], 
 TapTestSame[Hold[Evaluate[1 + 2]], Hold[3]], 
 TapTestSame[Hold[Sequence[a, b]], Hold[a, b]], 
 TapTestSame[g /: Hold[g[x_]] := x; Hold[g[1]], 1], 
 TapComment["RefLink[HoldComplete,paclet:ref/HoldComplete] can be used to \
freeze the result of RefLink[ToExpression,paclet:ref/ToExpression] before it \
is evaluated:"], TapTestSame[ToExpression["Sequence[a,b]", InputForm, 
   HoldComplete], HoldComplete[Sequence[a, b]]], 
 TapComment["RefLink[HoldComplete,paclet:ref/HoldComplete] affects only \
evaluation; input transformations are still applied:"], 
 TapTestSameBROKEN[FullForm[HoldComplete[a - b, a/b]], 
  HoldComplete[a - b, a/b]]]
