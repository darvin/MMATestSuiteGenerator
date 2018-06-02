(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[HoldComplete[1 + 1, Evaluate[1 + 2], 
   Sequence[3, 4]], HoldComplete[1 + 1, Evaluate[1 + 2], Sequence[3, 4]]], 
 EComment["RefLink[HoldComplete,paclet:ref/HoldComplete] is the standard \
container with attribute \
RefLink[HoldAllComplete,paclet:ref/HoldAllComplete]:"], 
 ESameTest[Attributes[HoldComplete], {HoldAllComplete, Protected}], 
 ESameTest[HoldComplete[Sequence[a, b], 1 + 2], 
  HoldComplete[Sequence[a, b], 1 + 2]], EComment["No form of evaluation \
control affects an expression with attribute \
RefLink[HoldAllComplete,paclet:ref/HoldAllComplete]:"], 
 ESameTest[HoldComplete[1 + 2], HoldComplete[1 + 2]], 
 ESameTest[HoldComplete[Evaluate[1 + 2]], HoldComplete[Evaluate[1 + 2]]], 
 ESameTest[HoldComplete[Sequence[a, b]], HoldComplete[Sequence[a, b]]], 
 ESameTest[HoldComplete[g[1]], HoldComplete[g[1]]], 
 EComment["Substitution still happens inside \
RefLink[HoldComplete,paclet:ref/HoldComplete]:"], 
 ESameTest[HoldComplete[f[1 + 2]] /. f[x_] :> g[x], HoldComplete[g[1 + 2]]], 
 EComment["RefLink[ReleaseHold,paclet:ref/ReleaseHold] removes one level of \
RefLink[HoldComplete,paclet:ref/HoldComplete]:"], 
 ESameTestBROKEN[ReleaseHold[HoldComplete[Sequence[1, 2]]], Sequence[1, 2]], 
 EComment["RefLink[Hold,paclet:ref/Hold] is a milder form of \
RefLink[HoldComplete,paclet:ref/HoldComplete] that allows for some form of \
evaluation:"], ESameTest[Hold[1 + 2], Hold[1 + 2]], 
 ESameTest[Hold[Evaluate[1 + 2]], Hold[3]], ESameTest[Hold[Sequence[a, b]], 
  Hold[a, b]], ESameTestBROKEN[Hold[g[1]], 1], 
 EComment["RefLink[HoldComplete,paclet:ref/HoldComplete] can be used to \
freeze the result of RefLink[ToExpression,paclet:ref/ToExpression] before it \
is evaluated:"], ESameTest[ToExpression["Sequence[a,b]", InputForm, 
   HoldComplete], HoldComplete[Sequence[a, b]]], 
 EComment["RefLink[HoldComplete,paclet:ref/HoldComplete] affects only \
evaluation; input transformations are still applied:"], 
 ESameTestBROKEN[FullForm[HoldComplete[a - b, a/b]], 
  HoldComplete[a - b, a/b]]]
