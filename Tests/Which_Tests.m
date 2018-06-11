(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[b]], 
 TapComment[
  "RefLink[Which,paclet:ref/Which] can be maintained in symbolic form:"], 
 TapTestSame[Which[a == 1, x, a == 2, b], Which[a == 1, x, a == 2, b]], 
 TapTestSameBROKEN[% /. a -> 2, b], TapComment["Conditions are evaluated \
until one is found that is neither RefLink[True,paclet:ref/True] nor \
RefLink[False,paclet:ref/False]:"], 
 TapTestSame[Which[1 < 0, a, x == 0, b, 0 < 1, c], 
  Which[x == 0, b, 0 < 1, c]], 
 TapComment[
  "Use RefLink[True,paclet:ref/True] for an else clause that always matches:"]\
, TapTestSame[sign[x_] := Which[x < 0, -1, x > 0, 1, True, Indeterminate]; 
   sign /@ {-2, 0, 3}, {-1, Indeterminate, 1}], 
 TapComment["Define a piecewise function:"], 
 TapTestSame[f = Which[x < -Pi/2, -1, -Pi/2 <= x <= Pi/2, Sin[x], True, 1], 
  Which[x < -(Pi/2), -1, -(Pi/2) <= x <= Pi/2, Sin[x], True, 1]], 
 TapComment["Expand it to use RefLink[Piecewise,paclet:ref/Piecewise]: "], 
 TapTestSameBROKEN[PiecewiseExpand[f], Inequality[Piecewise[-1]*x, Less, 
   (-(Pi/2))*1*x, Greater, (Pi/2)*Sin[x]*True]], 
 TapComment["Do symbolic operations: "], TapTestSame[Reduce[f == 1/2, x], 
  x == Pi/6], TapTestSame[Integrate[f, {x, 0, 3}], (8 - Pi)/2], 
 TapTestSame[D[f, x], Which[x < -(Pi/2), 0, -(Pi/2) <= x <= Pi/2, Cos[x], 
   True, 0]], TapTestSameBROKEN[HoldComplete[Plot[f, {x, -Pi, Pi}]], 
  $Failed], TapComment["Use RefLink[Which,paclet:ref/Which] rather than a \
nested if-then-elsif chain:"], 
 TapTestSame[cut1[x_] := If[x < -1, -1, If[x < 1, x, 1]]; 
   cut1 /@ {-2, -1, 0, 1, 2}, {-1, -1, 0, 1, 1}], 
 TapTestSame[cut2[x_] := Which[x < -1, -1, x < 1, x, True, 1]; 
   cut2 /@ {-2, -1, 0, 1, 2}, {-1, -1, 0, 1, 1}], 
 TapComment["Use RefLink[PiecewiseExpand,paclet:ref/PiecewiseExpand] to \
convert RefLink[Which,paclet:ref/Which] to \
RefLink[Piecewise,paclet:ref/Piecewise]:"], 
 TapTestSameBROKEN[PiecewiseExpand[Which[c1, a1, c2, a2, True, a3]], 
  Piecewise[a1]*c1*a2!*c1 && c2*a3*True], 
 TapTestSameBROKEN[PiecewiseExpand[Which[c1, Which[d1, b1, True, b2], True, 
    a2]], Piecewise[a2!]*c1*b1*c1 && d1*b2*True], 
 TapTestSameBROKEN[PiecewiseExpand[Which[Which[d1, b1, True, b2], a1, True, 
    a2]], Piecewise[a1]*(b1 && d1) || (b2 &&  !d1)*a2*True]]
