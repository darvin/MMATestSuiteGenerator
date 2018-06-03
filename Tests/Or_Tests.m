(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Combine assertions with ||:"], 
 TapTestSame[1 > 2 || Pi > 3, True], TapComment["A symbolic disjunction:"], 
 TapTestSame[a || b ||  !c, a || b ||  !c], 
 TapComment["A system of equations:"], 
 TapTestSame[x + 2*y == 3 || 4*x + 5*y == 6, x + 2*y == 3 || 4*x + 5*y == 6], 
 TapComment["Enter using Esc\\[ThinSpace]or\\[ThinSpace]Esc:"], 
 TapTestSame[p || q, p || q], 
 TapComment["RefLink[Or,paclet:ref/Or] works with any number of arguments:"], 
 TapTestSame[x || y || z, x || y || z], 
 TapComment["RefLink[Or,paclet:ref/Or] is associative:"], 
 TapTestSameBROKEN[FullForm[x || (y || z)], x || y || z], 
 TapComment["RefLink[Or,paclet:ref/Or] with explicit \
RefLink[True,paclet:ref/True] or RefLink[False,paclet:ref/False] arguments \
will simplify:"], TapTestSame[x || False || z, x || z], 
 TapTestSame[x || True || z, True], TapComment["RefLink[Or,paclet:ref/Or] \
evaluates its arguments in order, stopping when an argument evaluates to \
RefLink[True,paclet:ref/True]:"], 
 TapTestSame[(Print[1]; True) || (Print[2]; False), True], 
 TapTestSame[(Print[1]; False) || (Print[2]; False), False], 
 TapComment["The order of arguments may be important:"], 
 TapTestSame[x == 0 || y == 1/x /. x -> 0, True], 
 TapTestSame[y == 1/x || x == 0 /. x -> 0, True], 
 TapComment["Symbolic transformations will not preserve argument ordering:"], 
 TapTestSame[z || y || y || x, z || y || y || x], 
 TapTestSameBROKEN[Simplify[%], x || y || z], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[x || y || z, x || y || z], 
 TapTestSameBROKEN[NotRealNegativeQ[-2], False], 
 TapComment["If an argument of RefLink[Or,paclet:ref/Or] evaluates to \
RefLink[True,paclet:ref/True], any subsequent arguments are not evaluated:"], 
 TapTestSameBROKEN[NotRealNegativeQ[I], True], 
 TapTestSameBROKEN[NotRealNegativeQ2[I], True], 
 TapComment["Combine assumptions:"], 
 TapTestSame[Refine[Sqrt[(x^2 - 1)^2], x <= -1 || x >= 1], -1 + x^2], 
 TapComment["Combine equations and inequalities; RefLink[Or,paclet:ref/Or] is \
used both in the input and the output:"], 
 TapTestSame[Reduce[x^2 == 1 || x^3 <= 1/8, x, Reals], x <= 1/2 || x == 1], 
 TapComment["Use || to combine conditions:"], 
 TapTestSameBROKEN[HoldComplete[RegionPlot[x^2 + y^2 < 1 || x + y > 0, 
    {x, -2, 2}, {y, -2, 2}]], $Failed], TapTestSameBROKEN[
  HoldComplete[RegionPlot3D[x^2 + y^2 + z^2 < 1 || (x - 1)^2 + y^2 + z^2 < 1, 
    {x, -1, 2}, {y, -1, 1}, {z, -1, 1}]], $Failed], 
 TapComment["A cellular automaton based on RefLink[Or,paclet:ref/Or]:"], 
 TapTestSameBROKEN[HoldComplete[
   ArrayPlot[Boole[CellularAutomaton[{Or @@ #1 & , {}}, {{True}, False}, 
      20]]]], $Failed], TapComment[
  "Find the area of the union of sets given by algebraic conditions:"], 
 TapTestSame[Integrate[Boole[x^2 + y^2 < 1 || (x - 1)^2 + y^2 < 2], 
   {x, -Infinity, Infinity}, {y, -Infinity, Infinity}], 1 + 2*Pi], 
 TapComment["This shows the set:"], TapTestSameBROKEN[
  HoldComplete[RegionPlot[x^2 + y^2 < 1 || (x - 1)^2 + y^2 < 2, 
    {x, -1.5, 2.5}, {y, -2, 2}]], $Failed], 
 TapComment["Truth table for RefLink[Or,paclet:ref/Or]:"], 
 TapTestSameBROKEN[Grid[Outer[Or, {True, False}, {True, False}]], 
  True*True*True*False], TapComment["&& has higher precedence than ||:"], 
 TapTestSameBROKEN[FullForm[p || (q && r)], p || (q && r)], 
 TapComment["Use RefLink[BooleanConvert,paclet:ref/BooleanConvert] to expand \
RefLink[And,paclet:ref/And] with respect to RefLink[Or,paclet:ref/Or]:"], 
 TapTestSame[(a || b) && (c || d || e), (a || b) && (c || d || e)], 
 TapTestSameBROKEN[BooleanConvert[%], (a && c) || (a && d) || (a && e) || 
   (b && c) || (b && d) || (b && e)], TapComment["De Morgan's laws relate \
RefLink[And,paclet:ref/And], RefLink[Or,paclet:ref/Or], and \
RefLink[Not,paclet:ref/Not]:"], TapTestSame[BooleanConvert[ !(a && b)], 
   !a ||  !b], TapTestSame[BooleanConvert[ !(a || b || c)], 
   !a &&  !b &&  !c], TapComment["Disjunction of conditions corresponds to \
the RefLink[Max,paclet:ref/Max] of RefLink[Boole,paclet:ref/Boole] \
functions:"], TapTestSame[Max[Boole[a], Boole[b]] - Boole[a || b], 
  -Boole[a || b] + Max[Boole[a], Boole[b]]], TapTestSameBROKEN[Simplify[%], 
  0]]
