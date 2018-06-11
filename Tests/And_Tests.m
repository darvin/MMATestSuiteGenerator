(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Combine assertions with &&:"], 
 TapTestSame[2 > 1 && Pi > 3, True], TapComment["A symbolic conjunction:"], 
 TapTestSame[a && b &&  !c, a && b &&  !c], 
 TapComment["A system of equations:"], 
 TapTestSame[x + 2*y == 3 && 4*x + 5*y == 6, x + 2*y == 3 && 4*x + 5*y == 6], 
 TapComment["Enter using Esc\\[ThinSpace]and\\[ThinSpace]Esc:"], 
 TapTestSame[p && q, p && q], 
 TapComment[
  "RefLink[And,paclet:ref/And] works with any number of arguments:"], 
 TapTestSame[x && y && z, x && y && z], 
 TapComment["RefLink[And,paclet:ref/And] is associative:"], 
 TapTestSameBROKEN[FullForm[x && (y && z)], x && y && z], 
 TapComment["RefLink[And,paclet:ref/And] with explicit \
RefLink[True,paclet:ref/True] or RefLink[False,paclet:ref/False] arguments \
will simplify:"], TapTestSame[x && True && z, x && z], 
 TapTestSame[x && False && z, False], TapComment["RefLink[And,paclet:ref/And] \
evaluates its arguments in order, stopping when an argument evaluates to \
RefLink[False,paclet:ref/False]:"], 
 TapTestSame[(Print[1]; False) && (Print[2]; True), False], 
 TapTestSame[(Print[1]; True) && (Print[2]; True), True], 
 TapComment["The order of arguments may be important:"], 
 TapTestSame[x != 0 && y == 1/x /. x -> 0, False], 
 TapTestSame[y == 1/x && x != 0 /. x -> 0, False], 
 TapComment["Symbolic transformations will not preserve argument ordering:"], 
 TapTestSame[z && y && y && x, z && y && y && x], 
 TapTestSameBROKEN[Simplify[%], x && y && z], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[x && y && z, x && y && z], 
 TapComment["Combine conditions in Wolfram Language code:"], 
 TapTestSame[PositiveNumberQ[x_] := NumberQ[x] && Head[x] =!= Complex && 
     x > 0; PositiveNumberQ[1], True], TapComment["If an argument of \
RefLink[And,paclet:ref/And] evaluates to RefLink[False,paclet:ref/False], any \
subsequent arguments are not evaluated:"], TapTestSame[PositiveNumberQ[I], 
  False], TapComment["The argument order in RefLink[And,paclet:ref/And] \
matters; if the last two arguments are reversed, RefLink[I,paclet:ref/I]>0 is \
evaluated:"], TapTestSame[PositiveNumberQ2[x_] := NumberQ[x] && x > 0 && 
     Head[x] =!= Complex; PositiveNumberQ2[I], False], 
 TapComment["Combine assumptions:"], 
 TapTestSame[Refine[(a^b)^c, a >= 0 && Element[b, Reals]], a^(b*c)], 
 TapComment["Combine equations and inequalities; RefLink[And,paclet:ref/And] \
is used both in the input and in the output:"], 
 TapTestSame[Reduce[x^2 + y^2 == 1 && x >= y, {x, y}], 
  (Inequality[-(1/Sqrt[2]), LessEqual, x, Less, 1/Sqrt[2]] && 
    y == -Sqrt[1 - x^2]) || (Inequality[1/Sqrt[2], LessEqual, x, Less, 1] && 
    (y == -Sqrt[1 - x^2] || y == Sqrt[1 - x^2])) || (x == 1 && y == 0)], 
 TapComment["Use RefLink[And,paclet:ref/And] to combine conditions:"], 
 TapTestSameBROKEN[HoldComplete[RegionPlot[x^2 + y^2 < 1 && x + y > 0, 
    {x, -2, 2}, {y, -2, 2}]], $Failed], TapTestSameBROKEN[
  HoldComplete[RegionPlot3D[x^2 + y^2 + z^2 < 1 && x^2 + y^2 < z^2, 
    {x, -1, 1}, {y, -1, 1}, {z, -1, 1}]], $Failed], 
 TapComment["A cellular automaton based on RefLink[And,paclet:ref/And]:"], 
 TapTestSame[HoldComplete[ArrayPlot[
    Boole[CellularAutomaton[{And @@ #1 & , {}}, RandomChoice[{True, False}, 
       40], 20]]]], $Failed], TapComment["Find the area of the intersection \
of sets given by algebraic conditions:"], 
 TapTestSame[Integrate[Boole[x^2 + y^2 < 1 && (x - 1)^2 + y^2 < 2], 
   {x, -Infinity, Infinity}, {y, -Infinity, Infinity}], -1 + Pi], 
 TapComment["This shows the set:"], TapTestSameBROKEN[
  HoldComplete[RegionPlot[x^2 + y^2 < 1 && (x - 1)^2 + y^2 < 2, 
    {x, -1.5, 2.5}, {y, -2, 2}]], $Failed], 
 TapComment["Truth table for RefLink[And,paclet:ref/And]:"], 
 TapTestSameBROKEN[Grid[Outer[And, {True, False}, {True, False}]], 
  True*False*False*False], TapComment["&& has higher precedence than ||:"], 
 TapTestSameBROKEN[FullForm[p || (q && r)], p || (q && r)], 
 TapComment["Use RefLink[BooleanConvert,paclet:ref/BooleanConvert] to expand \
RefLink[And,paclet:ref/And] with respect to RefLink[Or,paclet:ref/Or]:"], 
 TapTestSame[(a || b) && (c || d || e), (a || b) && (c || d || e)], 
 TapTestSameBROKEN[BooleanConvert[%], (a && c) || (a && d) || (a && e) || 
   (b && c) || (b && d) || (b && e)], TapComment["De Morgan's laws relate \
RefLink[And,paclet:ref/And], RefLink[Or,paclet:ref/Or], and \
RefLink[Not,paclet:ref/Not]:"], TapTestSame[BooleanConvert[ !(a && b)], 
   !a ||  !b], TapTestSame[BooleanConvert[ !(a || b || c)], 
   !a &&  !b &&  !c], TapComment["Conjunction of conditions corresponds to \
the product or RefLink[Min,paclet:ref/Min] of RefLink[Boole,paclet:ref/Boole] \
functions:"], TapTestSame[Boole[a]*Boole[b] - Boole[a && b], 
  Boole[a]*Boole[b] - Boole[a && b]], TapTestSameBROKEN[Simplify[%], 0], 
 TapTestSame[Min[Boole[a], Boole[b]] - Boole[a && b], 
  -Boole[a && b] + Min[Boole[a], Boole[b]]], TapTestSameBROKEN[Simplify[%], 
  0], TapComment[
  "Use RefLink[Thread,paclet:ref/Thread] to thread over lists:"], 
 TapTestSame[{p, q} && {r, s}, {p, q} && {r, s}], 
 TapTestSameBROKEN[Thread[%], {p && r, q && s}]]
