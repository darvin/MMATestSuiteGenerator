(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{1, 0, 1}]], 
 TapComment["If the condition is neither RefLink[True,paclet:ref/True] nor \
RefLink[False,paclet:ref/False], RefLink[If,paclet:ref/If] remains \
unevaluated:"], TapTestSame[If[a < b, 1, 0], If[a < b, 1, 0]], 
 TapComment["The form with an explicit case for an undetermined condition \
evaluates in any case:"], TapTestSame[If[a < b, 1, 0, Indeterminate], 
  Indeterminate], TapComment["Use RefLink[TrueQ,paclet:ref/TrueQ] to force \
the condition to always return a Boolean value:"], 
 TapTestSame[If[TrueQ[a < b], 1, 0], 0], TapComment["Define a piecewise \
function with both RefLink[If,paclet:ref/If] and \
RefLink[Round,paclet:ref/Round] as piecewise elements:"], 
 TapTestSame[f = If[Round[x] > x, x, -x], If[Round[x] > x, x, -x]], 
 TapComment["Use RefLink[PiecewiseExpand,paclet:ref/PiecewiseExpand] to get \
it into piecewise normal form: "], TapTestSameBROKEN[
  PiecewiseExpand[f, 0 < x < 5], Inequality[Piecewise[-x]*1, LessEqual, x, 
    Less, 3/2] || 2 <= x <= 5/2 || Inequality[3, LessEqual, x, Less, 7/2] || 
   4 <= x <= 9/2 || x <= (1/2)*x*True], 
 TapComment["Perform several different symbolic operations: "], 
 TapTestSame[Reduce[f < 5 && 0 < x < 10, x, Reals], 
  0 < x < 11/2 || 6 <= x <= 13/2 || Inequality[7, LessEqual, x, Less, 
    15/2] || 8 <= x <= 17/2 || Inequality[9, LessEqual, x, Less, 19/2]], 
 TapTestSame[Integrate[f, {x, 0, 10}], 5/2], 
 TapTestSame[D[f, x], If[Round[x] > x, 1, -1]], 
 TapTestSameBROKEN[HoldComplete[Plot[f, {x, -2, 2}]], $Failed], 
 TapComment["RefLink[If,paclet:ref/If] can be used as a statement:"], 
 TapTestSame[x = -2; If[x < 0, y = -x, y = x]; y, 2], 
 TapComment["It can also be used as an expression returning a value:"], 
 TapTestSame[y = If[x < 0, -x, x], 2], 
 TapComment["Only the branch actually taken is evaluated:"], 
 TapTestSame[x = 1; If[x != 0, 1/x, Indeterminate], 1], 
 TapComment["Define a function by cases:"], 
 TapTestSame[sign[x_] := If[x < 0, -1, 1]; sign /@ {-1, 0, 1, I}, 
  {-1, 1, 1, If[I < 0, -1, 1]}], 
 TapComment["Alternatively, use several conditional definitions:"], 
 TapTestSame[sign2[x_ /; x < 0] := -sign2[x_ /; x >= 0] := x; 
   sign2 /@ {-1, 0, 1, I}, {-1, 0, 1, sign2[I]}], 
 TapComment["Use RefLink[Which,paclet:ref/Which] rather than a nested \
if-then-elsif chain:"], TapTestSame[
  cut[x_] := If[x < -1, -1, If[x < 1, x, 1]]; cut /@ {-2, -1, 0, 1, 2}, 
  {-1, -1, 0, 1, 1}], TapTestSame[
  cut2[x_] := Which[x < -1, -1, x < 1, x, True, 1]; 
   cut2 /@ {-2, -1, 0, 1, 2}, {-1, -1, 0, 1, 1}], 
 TapComment["Use RefLink[PiecewiseExpand,paclet:ref/PiecewiseExpand] to \
convert RefLink[If,paclet:ref/If] to \
RefLink[Piecewise,paclet:ref/Piecewise]:"], 
 TapTestSameBROKEN[PiecewiseExpand[If[c, a, b]], Piecewise[a]*c*b*True], 
 TapTestSameBROKEN[PiecewiseExpand[If[If[c1, a1, b1], a, b]], 
  Piecewise[a]*(a1 && c1) || (b1 &&  !c1)*b*True], 
 TapTestSameBROKEN[PiecewiseExpand[If[c, If[c2, a2, b2], b]], 
  Piecewise[a2]*c && c2*b!*c*b2*True]]
