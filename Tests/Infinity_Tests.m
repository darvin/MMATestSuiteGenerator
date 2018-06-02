(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Use as iterator limit:"], 
 TapTestSame[Sum[1/n^2, {n, Infinity}], Pi^2/6], 
 TapComment["Do arithmetic with infinite quantities:"], 
 TapTestSame[1/Infinity, 0], 
 TapComment[
  "Use Esc\\[ThinSpace]inf\\[ThinSpace]Esc to enter \\[Infinity]:"], 
 TapTestSame[Limit[1/x, x -> Infinity], 0], 
 TapComment["Series expansion at \\[Infinity]:"], 
 TapTestSameBROKEN[Series[1/(x^2 + x + 1), {x, Infinity, 5}], 
  (1/x)^2 - (1/x)^3 + (1/x)^5 + O[1/x]^6], 
 TapComment["Infinite limits of integration and summation:"], 
 TapTestSame[Integrate[Exp[-x^2], {x, -Infinity, Infinity}], Sqrt[Pi]], 
 TapTestSameBROKEN[NIntegrate[Exp[-x^4/(x^2 + 1)], {x, -Infinity, Infinity}], 
  2.31402], TapTestSame[Sum[Exp[-n^2], {n, -Infinity, Infinity}], 
  EllipticTheta[3, 0, 1/E]], TapTestSameBROKEN[NSum[Exp[-n^4/(n^2 + 1)], 
   {n, -Infinity, Infinity}], 2.29519], 
 TapComment["Extended arithmetic with infinite quantities:"], 
 TapTestSame[Infinity*Infinity, Infinity], TapTestSame[2*Infinity - Infinity, 
  Indeterminate], TapComment[
  "In this case the result depends on the growth rates of the two terms:"], 
 TapTestSame[Limit[2*t - (t^2 + 1), t -> Infinity], -Infinity], 
 TapTestSame[Limit[2*t - (t + 1), t -> Infinity], Infinity], 
 TapComment["Use infinite quantities in predicates:"], 
 TapTestSame[10^100 < Infinity, True], 
 TapComment["Find values of mathematical functions at infinities:"], 
 TapTestSame[Exp[-Infinity], 0], TapTestSame[Exp[Infinity], Infinity], 
 TapComment[
  "For some functions there is no definite limit, but a limiting interval:"], 
 TapTestSame[Sin[Infinity], Interval[{-1, 1}]], 
 TapTestSame[Tan[Infinity], Interval[{-Infinity, Infinity}]], 
 TapComment["In this case no limiting interval exists:"], 
 TapTestSame[Exp[I*Infinity], Indeterminate], 
 TapComment["Mathematical functions can also return infinite quantities at \
finite points:"], TapTestSame[Log[0], -Infinity], 
 TapTestSame[Gamma[0], ComplexInfinity], TapComment["RefLink[Cases,paclet:ref\
/Cases] finds matches only at the first level by default:"], 
 TapTestSame[e = x*Gamma[x] + (x + 1)*Gamma[x^2 + 1], 
  x*Gamma[x] + (1 + x)*Gamma[1 + x^2]], TapTestSame[Cases[e, _Gamma], {}], 
 TapComment["Set the level to RefLink[Infinity,paclet:ref/Infinity] to \
include all levels:"], TapTestSame[Cases[e, _Gamma, Infinity], 
  {Gamma[x], Gamma[1 + x^2]}], 
 TapComment["Stirling's asymptotic approximation:"], 
 TapTestSameBROKEN[Series[n!, {n, Infinity, 2}], 
  E^(-1 - Log[1/n])*n + O[1/n]^3*(Sqrt[2*Pi]*Sqrt[n] + 
     Sqrt[Pi/2]/(6*Sqrt[n]) + Sqrt[Pi/2]/(144*n^(3/2)) + O[1/n]^(5/2))], 
 TapComment["Setting the precision to RefLink[Infinity,paclet:ref/Infinity] \
will produce a rational approximation:"], 
 TapTestSame[SetPrecision[3.14, Infinity], 
  7070651414971679/2251799813685248], TapTestSameBROKEN[N[%], 3.14], 
 TapComment["Some functions require infinite precision or exact input:"], 
 TapTestSame[CylindricalDecomposition[y^2 + 2.5*x^2 < 1.5, {x, y}], 
  CylindricalDecomposition[2.5*x^2 + y^2 < 1.5, {x, y}]], 
 TapComment["Apply RefLink[SetPrecision,paclet:ref/SetPrecision] to the whole \
expression to rationalize all inexact numbers:"], 
 TapTestSameBROKEN[CylindricalDecomposition[SetPrecision[y^2 + 2.5*x^2 < 1.5, 
    Infinity], {x, y}], -Sqrt[3/5] < x < Sqrt[3/5] && 
   -(Sqrt[3 - 5*x^2]/Sqrt[2]) < y < Sqrt[3 - 5*x^2]/Sqrt[2]], 
 TapComment["Use an infinite \
RefLink[WorkingPrecision,paclet:ref/WorkingPrecision] in \
RefLink[Plot,paclet:ref/Plot]:"], TapTestSameBROKEN[
  HoldComplete[Reap[Plot[2*x + 1, {x, 0, 1}, WorkingPrecision -> Infinity, 
     EvaluationMonitor :> Sow[x], PlotPoints -> 3, MaxRecursion -> 0]]], 
  $Failed], TapTestSameBROKEN[HoldComplete[Plot[Numerator[x], {x, 0, 10}, 
    WorkingPrecision -> Infinity, PlotPoints -> 1000, MaxRecursion -> 0]], 
  $Failed]]
