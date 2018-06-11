(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Hold an expression to prevent evaluation:"], 
 TapTestSame[Hold[2 + 2], Hold[2 + 2]], TapComment["Release the hold:"], 
 TapTestSameBROKEN[ReleaseHold[%], 4], 
 TapComment[
  "Find the length of each expression in a held list without evaluation:"], 
 TapTestSameBROKEN[list = Hold[1 + 2, 2*3*4*5, 1/0, Quit[]] ;; 
    List @@ Hold /@ list, {Hold[1 + 2], Hold[2*3*4*5], Hold[1/0], 
   Hold[Quit[]]}], TapTestSameBROKEN[% /. Hold[e_] :> Length[Unevaluated[e]], 
  {2, 4, 2, 0}], TapComment[
  "Evaluate every sum (only) inside a held expression:"], 
 TapTestSame[expr = Hold[{1 + 2, g[3 + 4, 2*3], f[1 + g[2 + 3]]}], 
  Hold[{1 + 2, g[3 + 4, 2*3], f[1 + g[2 + 3]]}]], 
 TapTestSame[pos = Position[expr, _Plus], {{1, 1}, {1, 2, 1}, 
   {1, 3, 1, 2, 1}, {1, 3, 1}}], TapTestSame[val = Extract[expr, pos], 
  {3, 7, 5, 1 + g[5]}], TapTestSame[ReplacePart[expr, Thread[pos -> val]], 
  Hold[{3, g[7, 2*3], f[1 + g[5]]}]], TapComment["RefLink[Hold,paclet:ref/Hol\
d] is a container with the attribute RefLink[HoldAll,paclet:ref/HoldAll]:"], 
 TapTestSame[Attributes[Hold], {HoldAll, Protected}], 
 TapTestSame[Hold[1 + 2], Hold[1 + 2]], 
 TapComment["Use RefLink[Evaluate,paclet:ref/Evaluate] to force evaluation of \
an argument of RefLink[Hold,paclet:ref/Hold]:"], 
 TapTestSame[Hold[Evaluate[1 + 1], 2 + 2], Hold[2, 2 + 2]], 
 TapComment["RefLink[Unevaluated,paclet:ref/Unevaluated] inside a held \
expression is not removed:"], TapTestSame[Hold[Unevaluated[1 + 1]], 
  Hold[Unevaluated[1 + 1]]], 
 TapComment[
  "Sequence splicing still happens inside RefLink[Hold,paclet:ref/Hold]:"], 
 TapTestSame[Hold[Sequence[1 + 1, 2 + 2]], Hold[1 + 1, 2 + 2]], 
 TapComment["Use the container RefLink[HoldComplete,paclet:ref/HoldComplete] \
to suppress even such transformations:"], 
 TapTestSame[HoldComplete[Sequence[1 + 1, 2 + 2]], 
  HoldComplete[Sequence[1 + 1, 2 + 2]]], 
 TapComment["Upvalues work inside RefLink[Hold,paclet:ref/Hold]:"], 
 TapTestSame[h /: Hold[h[x_]] := f[x]; Hold[h[1 + 2]], f[3]], 
 TapComment[
  "They do not work inside RefLink[HoldComplete,paclet:ref/HoldComplete]:"], 
 TapTestSame[h /: HoldComplete[h[x_]] := f[x]; HoldComplete[h[1 + 2]], 
  HoldComplete[h[1 + 2]]], 
 TapComment["Substitution works inside RefLink[Hold,paclet:ref/Hold]:"], 
 TapTestSame[Hold[f[1 + 2]] /. f[x_] :> g[x], Hold[g[1 + 2]]], 
 TapComment["Insert into a held expression:"], 
 TapTestSame[Insert[Hold[x + x], y, {1, 2}], Hold[x + y + x]], 
 TapComment["RefLink[ReleaseHold,paclet:ref/ReleaseHold] removes one level of \
RefLink[Hold,paclet:ref/Hold]:"], TapTestSame[ReleaseHold[Hold[1 + 2]], 3], 
 TapComment["RefLink[HoldForm,paclet:ref/HoldForm] is like \
RefLink[Hold,paclet:ref/Hold], but is normally not shown in the output:"], 
 TapTestSameBROKEN[HoldForm[1 + 2], 1 + 2], TapTestSameBROKEN[FullForm[%], 
  HoldForm[1 + 2]]]
