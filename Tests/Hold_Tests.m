(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Hold an expression to prevent evaluation:"], 
 ESameTest[Hold[2 + 2], Hold[2 + 2]], EComment["Release the hold:"], 
 ESameTestBROKEN[ReleaseHold[%], 4], ESameTestBROKEN[List @@ Hold /@ list, 
  {Hold[1 + 2], Hold[2*3*4*5], Hold[1/0], Hold[Quit[]]}], 
 ESameTestBROKEN[% /. Hold[e_] :> Length[Unevaluated[e]], {2, 4, 2, 0}], 
 EComment["Evaluate every sum (only) inside a held expression:"], 
 ESameTest[expr = Hold[{1 + 2, g[3 + 4, 2*3], f[1 + g[2 + 3]]}], 
  Hold[{1 + 2, g[3 + 4, 2*3], f[1 + g[2 + 3]]}]], 
 ESameTest[pos = Position[expr, _Plus], {{1, 1}, {1, 2, 1}, {1, 3, 1, 2, 1}, 
   {1, 3, 1}}], ESameTest[val = Extract[expr, pos], {3, 7, 5, 1 + g[5]}], 
 ESameTest[ReplacePart[expr, Thread[pos -> val]], 
  Hold[{3, g[7, 2*3], f[1 + g[5]]}]], EComment["RefLink[Hold,paclet:ref/Hold] \
is a container with the attribute RefLink[HoldAll,paclet:ref/HoldAll]:"], 
 ESameTest[Attributes[Hold], {HoldAll, Protected}], 
 ESameTest[Hold[1 + 2], Hold[1 + 2]], 
 EComment["Use RefLink[Evaluate,paclet:ref/Evaluate] to force evaluation of \
an argument of RefLink[Hold,paclet:ref/Hold]:"], 
 ESameTest[Hold[Evaluate[1 + 1], 2 + 2], Hold[2, 2 + 2]], 
 EComment["RefLink[Unevaluated,paclet:ref/Unevaluated] inside a held \
expression is not removed:"], ESameTest[Hold[Unevaluated[1 + 1]], 
  Hold[Unevaluated[1 + 1]]], 
 EComment[
  "Sequence splicing still happens inside RefLink[Hold,paclet:ref/Hold]:"], 
 ESameTest[Hold[Sequence[1 + 1, 2 + 2]], Hold[1 + 1, 2 + 2]], 
 EComment["Use the container RefLink[HoldComplete,paclet:ref/HoldComplete] to \
suppress even such transformations:"], 
 ESameTest[HoldComplete[Sequence[1 + 1, 2 + 2]], 
  HoldComplete[Sequence[1 + 1, 2 + 2]]], ESameTestBROKEN[Hold[h[1 + 2]], 
  f[3]], ESameTest[HoldComplete[h[1 + 2]], HoldComplete[h[1 + 2]]], 
 EComment["Substitution works inside RefLink[Hold,paclet:ref/Hold]:"], 
 ESameTest[Hold[f[1 + 2]] /. f[x_] :> g[x], Hold[g[1 + 2]]], 
 EComment["Insert into a held expression:"], 
 ESameTest[Insert[Hold[x + x], y, {1, 2}], Hold[x + y + x]], 
 EComment["RefLink[ReleaseHold,paclet:ref/ReleaseHold] removes one level of \
RefLink[Hold,paclet:ref/Hold]:"], ESameTest[ReleaseHold[Hold[1 + 2]], 3], 
 EComment["RefLink[HoldForm,paclet:ref/HoldForm] is like \
RefLink[Hold,paclet:ref/Hold], but is normally not shown in the output:"], 
 ESameTestBROKEN[HoldForm[1 + 2], 1 + 2], ESameTestBROKEN[FullForm[%], 
  HoldForm[1 + 2]]]
