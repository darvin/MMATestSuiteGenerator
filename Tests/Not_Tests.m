(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Negate assertions:"], TapTestSame[ !x > 1, x <= 1], 
 TapComment["Symbolic negation:"], TapTestSame[ !x,  !x], 
 TapComment["Enter using Esc\\[ThinSpace]not\\[ThinSpace]Esc:"], 
 TapTestSame[ !p,  !p], TapComment[
  "Double negation simplifies to the identity:"], TapTestSame[ !( !a), a], 
 TapComment["Negate equations and inequalities:"], 
 TapTestSame[ !a == b, a != b], TapTestSame[ !a >= b, a < b], 
 TapComment["Negate quantifiers:"], 
 TapTestSame[HoldComplete[ !Exists[x, f[x]]], $Failed], 
 TapTestSame[HoldComplete[ !ForAll[x, f[x]]], $Failed], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[! x,  !x], 
 TapComment["Negate conditions in Wolfram Language code:"], 
 TapTestSame[Select[{1, Pi, 2.3, 3 + 7*I, x},  !NumberQ[#1] & ], {Pi, x}], 
 TapComment[
  "Find the area of the complement of a set given by algebraic conditions:"], 
 TapTestSame[Integrate[Boole[ !y^2 - 4*x^2 + 4*x^4 <= 0], {x, -1, 1}, 
   {y, -1, 1}], 4/3], TapComment["This shows the set:"], 
 TapTestSameBROKEN[HoldComplete[RegionPlot[ !y^2 - 4*x^2 + 4*x^4 <= 0, 
    {x, -1, 1}, {y, -1, 1}]], $Failed], 
 TapComment["Truth table for RefLink[Not,paclet:ref/Not]:"], 
 TapTestSameBROKEN[TableForm[Not /@ {False, True}], True*False], 
 TapComment["Use RefLink[BooleanConvert,paclet:ref/BooleanConvert] to \
simplify the negation of RefLink[Implies,paclet:ref/Implies]:"], 
 TapTestSame[BooleanConvert[ !Implies[a, b]], a &&  !b], 
 TapComment["De Morgan's laws relate RefLink[And,paclet:ref/And], \
RefLink[Or,paclet:ref/Or], and RefLink[Not,paclet:ref/Not]:"], 
 TapTestSame[BooleanConvert[ !(a && b)],  !a ||  !b], 
 TapTestSame[BooleanConvert[ !(a || b || c)],  !a &&  !b &&  !c], 
 TapComment[
  "Negation of the condition for RefLink[Boole,paclet:ref/Boole] function:"], 
 TapTestSame[Boole[ !a] == 1 - Boole[a], Boole[ !a] == 1 - Boole[a]], 
 TapTestSameBROKEN[Simplify[%], True], TapComment["Use parentheses to ensure \
! beginning a line is not taken as a shell escape when using a terminal \
interface: "], TapTestSame[ !True, False]]
