(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The result is given in radians:"], 
 TapTestSame[Arg[-1], Pi], TapTestSame[Arg[1 + I], Pi/4], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Arg[x + I*y], {x, -3, 3}, 
    {y, -3, 3}]], $Failed], TapTestSame[Arg[1.2], 0], 
 TapTestSame[Arg[-3.2*I], -1.5708], TapTestSame[Arg[1.6 + I], 0.558599], 
 TapTestSameBROKEN[Arg[1.6`23.204119982655925 + I], 
  0.55859931534356243597151`22.74710039906514], 
 TapTestSame[Arg[{1.2, 1.5*I, -1.8*I}], {0, 1.5708, -1.5708}], 
 TapTestSameBROKEN[Arg[1*u*v - I], {{0, Arg[u]}, {Arg[v], -(Pi/2)}}], 
 TapTestSame[Arg[2 + I*Pi], ArcTan[Pi/2]], TapTestSame[Arg[Infinity], 0], 
 TapTestSame[Arg[-Infinity], Pi], TapTestSameBROKEN[
  HoldComplete[SparseArray[{{1, 1} -> -6, {1, 3} -> I*Pi, {3, 3} -> 2, 
     {4, 2} -> u, {_, _} -> 1}]], $Failed], TapTestSameBROKEN[Normal[Arg[%]], 
  {{Pi, 0, Pi/2}, {0, 0, 0}, {0, 0, 0}, {0, Arg[u], 0}}], 
 TapTestSame[({Abs[#1], Arg[#1]} & )[1 + 3*I], {Sqrt[10], ArcTan[3]}], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Abs[Sin[x + I*y]], {x, -2*Pi, 2*Pi}, 
    {y, -1, 1}, ColorFunction -> (Hue[Arg[Sin[#1 + I*#2]]] & )]], $Failed], 
 TapTestSame[PowerExpand[Sqrt[z^2], Assumptions -> {}], 
  E^(I*Pi*Floor[1/2 - Arg[z]/Pi])*z], 
 TapTestSame[PowerExpand[Log[1/z], Assumptions -> {}], 
  2*I*Pi*Floor[1/2 + Arg[z]/(2*Pi)] - Log[z]], 
 TapTestSame[Simplify[x*Arg[I*x], x > 3], (Pi*x)/2], 
 TapTestSameBROKEN[FullSimplify[Arg[z] - I*Log[z/Abs[z]] - I*Log[Sign[z]], 
   z != 0], 3*Arg[z]], TapComment["Generate RefLink[Arg,paclet:ref/Arg] from \
RefLink[FullSimplify,paclet:ref/FullSimplify]:"], 
 TapTestSame[FullSimplify[Im[Log[z]]], Arg[z]], 
 TapTestSame[TrigToExp[ComplexExpand[z, z, TargetFunctions -> {Abs, Arg}]], 
  E^(I*Arg[z])*Abs[z]], TapTestSame[ComplexExpand[Re[ArcSin[x + I*y]], 
   TargetFunctions -> {Arg}], Arg[Sqrt[1 - (x + I*y)^2] + I*(x + I*y)]], 
 TapComment["Rescale RefLink[Arg,paclet:ref/Arg] to run from 0 to 1:"], 
 TapTestSame[Table[Rescale[Arg[I^n], {-Pi, Pi}], {n, 5}], 
  {3/4, 1, 1/4, 1/2, 3/4}], TapTestSame[Table[Arg[I^n], {n, 5}], 
  {Pi/2, Pi, -(Pi/2), 0, Pi/2}], TapTestSame[Reduce[Arg[x + c] > 0, x, 
   Complexes], (Re[x] < -Re[c] && Im[x] >= -Im[c]) || 
   (Re[x] >= -Re[c] && Im[x] > -Im[c])], 
 TapComment["Use RefLink[Arg,paclet:ref/Arg] to specify assumptions about \
complex variables:"], TapTestSameBROKEN[Series[ArcSin[x], 
   {x, ComplexInfinity, 2}, Assumptions -> Pi/4 < Arg[x] < 3*(Pi/4)], 
  (1/2)*(Pi + I*Log[4] - 2*I*Log[1/x]) - I/(4*x^2) + O[1/x]^3], 
 TapTestSameBROKEN[Series[ArcSin[x], {x, ComplexInfinity, 2}], 
  (-1)^Floor[-(Arg[x]/Pi)]*(Pi*Floor[-(Arg[x]/Pi)] + 
    2*Pi*Floor[(Pi + Arg[x])/(2*Pi)] + 
    ((1/2)*(Pi - I*Log[4] + 2*I*Log[1/x]) + I/(4*x^2) + O[1/x]^3))], 
 TapComment["Degenerate cases give intervals as results :"], 
 TapTestSame[Arg[ComplexInfinity], Interval[{-Pi, Pi}]], 
 TapComment["Numerical decision procedures with default settings cannot \
simplify this expression: "], TapTestSame[
  a = Arg[-1 - 2*E - E^2 + (1 + E)^2 - I*Exp[-Exp[2*Pi]]], 
  ArcTan[-1 - 2*E - E^2 + (1 + E)^2, -E^(-E^(2*Pi))]], 
 TapComment["The machine-precision result is incorrect: "], 
 TapTestSame[N[a], -3.14159], TapComment["The arbitrary-precision result \
indicates that the result may be incorrect: "], 
 TapTestSameBROKEN[N[a, 20], 0.], TapComment["Using a larger setting for \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] gives the correct \
result: "], TapTestSameBROKEN[Block[{$MaxExtraPrecision = 1000}, N[a, 20]], 
  -1.57079632679489661920000000001`19.196119877030153], 
 TapComment["The input contains a hidden zero, and simplifying the argument \
gets the correct answer:"], TapTestSame[
  Arg[Simplify[-1 - 2*E - E^2 + (1 + E)^2 - I*Exp[-Exp[2*Pi]]]], -(Pi/2)], 
 TapTestSame[HoldComplete[Plot[Arg[1/(((3/2)*Exp[I*\[CurlyPhi]])^4 - 1)], 
    {\[CurlyPhi], 0, 2*Pi}]], $Failed], TapTestSameBROKEN[
  HoldComplete[Plot3D[Arg[1/((x + I*y)^8 - 1)], {x, -2, 2}, {y, -2, 2}, 
    Mesh -> False, RegionFunction -> (Norm[{#1, #2}] < 2 & )]], $Failed]]
