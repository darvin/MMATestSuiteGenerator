(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The argument is given in radians:"], 
 TapTestSame[Tan[Pi/6], 1/Sqrt[3]], 
 TapComment[
  "Use RefLink[Degree,paclet:ref/Degree] to specify an argument in degrees:"]\
, TapTestSame[Tan[30*Degree], 1/Sqrt[3]], 
 TapTestSameBROKEN[HoldComplete[Plot[Tan[x], {x, 0, 2*Pi}]], $Failed], 
 TapTestSame[Series[Tan[x], {x, 0, 10}], x + x^3/3 + (2*x^5)/15 + 
   (17*x^7)/315 + (62*x^9)/2835 + O[x]^11], 
 TapComment["Evaluate numerically:"], TapTestSameBROKEN[Tan[1.2], 2.57215], 
 TapComment["Evaluate to high precision:"], TapTestSame[N[Tan[12/10], 50], 
  2.5721516221263189354099942360333639565294093060434`49.41029656561764], 
 TapComment[
  "The precision of the output tracks the precision of the input:"], 
 TapTestSame[Tan[1.2`23.07918124604763], 
  2.57215162212631893541`22.41029656561764], TapComment["The precision of the \
output can be much smaller than the precision of the input:"], 
 TapTestSame[Tan[1.5707963267948966192213216916397514421`37.196119877030156], 
  1.*10^20], TapComment[
  "RefLink[Tan,paclet:ref/Tan] threads element-wise over lists and matrices:"]\
, TapTestSameBROKEN[Tan[{1.2, 1.5, 1.8}], {2.57215, 14.1014, -4.28626}], 
 TapTestSameBROKEN[Tan[Pi*u*v*(Pi/3)], {{0, Tan[u]}, {Tan[v], Sqrt[3]}}], 
 TapComment["RefLink[Tan,paclet:ref/Tan] can take complex number inputs:"], 
 TapTestSameBROKEN[Tan[2.5 + I], -0.237014 + 0.896438*I], 
 TapComment["Simple exact values are generated automatically:"], 
 TapTestSame[Tan[Pi/5], Sqrt[5 - 2*Sqrt[5]]], TapComment["More complicated \
cases require explicit use of \
RefLink[FunctionExpand,paclet:ref/FunctionExpand]:"], 
 TapTestSame[Tan[Pi/8], Tan[Pi/8]], TapTestSameBROKEN[FunctionExpand[%], 
  Sqrt[(2 - Sqrt[2])/(2 + Sqrt[2])]], 
 TapComment["Convert multiple-angle expressions:"], 
 TapTestSame[TrigExpand[Tan[4*x]], 
  (4*Cos[x]^3*Sin[x])/(Cos[x]^4 - 6*Cos[x]^2*Sin[x]^2 + Sin[x]^4) - 
   (4*Cos[x]*Sin[x]^3)/(Cos[x]^4 - 6*Cos[x]^2*Sin[x]^2 + Sin[x]^4)], 
 TapTestSameBROKEN[TrigReduce[%], Tan[4*x]], 
 TapComment["Convert sums of trigonometric functions to products:"], 
 TapTestSame[TrigFactor[Tan[x] + Tan[y]], Sec[x]*Sec[y]*Sin[x + y]], 
 TapComment["Expand assuming real variables:"], 
 TapTestSame[ComplexExpand[Tan[x + I*y]], Sin[2*x]/(Cos[2*x] + Cosh[2*y]) + 
   (I*Sinh[2*y])/(Cos[2*x] + Cosh[2*y])], 
 TapComment["Convert to complex exponentials:"], 
 TapTestSame[TrigToExp[Tan[z]], (I*(E^((-I)*z) - E^(I*z)))/
   (E^((-I)*z) + E^(I*z))], 
 TapComment["RefLink[Tan,paclet:ref/Tan] can deal with real-valued \
intervals:"], TapTestSame[Tan[Interval[{0, Pi/3}]], Interval[{0, Sqrt[3]}]], 
 TapComment["Infinite arguments give symbolic results:"], 
 TapTestSame[Tan[Infinity], Interval[{-Infinity, Infinity}]], 
 TapTestSame[Tan[ComplexInfinity], Indeterminate], 
 TapComment["RefLink[Tan,paclet:ref/Tan] can be applied to power series:"], 
 TapTestSame[Tan[Pi/2 + x + x^2/2 + x^3/3 + O[x]^4], 
  -(1/x) + 1/2 + (5*x)/12 + O[x]^2], TapComment["RefLink[Tan,paclet:ref/Tan] \
threads element-wise over sparse arrays as well as lists: "], 
 TapTestSameBROKEN[HoldComplete[SparseArray[{{1, 1} -> Pi, {1, 3} -> Pi/3, 
     {3, 3} -> Pi/12, {4, 2} -> Pi/4}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Tan[%]], $Failed], 
 TapTestSameBROKEN[MatrixForm[%], 0*0*Sqrt[3]*0*0*0*0*0*2 - Sqrt[3]*0*1*0], 
 TapComment["Generate a plot with poles removed:"], 
 TapTestSameBROKEN[HoldComplete[Plot[Tan[x], {x, 0, 20}, 
    Exclusions -> {Cos[x] == 0}]], $Failed], 
 TapComment["Generate a plot over the complex argument plane:"], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Re[Tan[x + I*y]], {x, 0, 2*Pi}, 
    {y, 0, 3}]], $Failed], 
 TapComment["Differential equation solution with a movable singularity:"], 
 TapTestSameBROKEN[DSolve[(w^\[Prime])[z] - w[z]^2 - 1 == 0, w[z], z], 
  {{w[z] -> Tan[z + C[1]]}}], 
 TapComment[
  "The tangent function conformally maps a parabola into the unit disk:"], 
 TapTestSameBROKEN[HoldComplete[
   parabola = Table[1 - x^2/4 + I*x, {x, 0, 20, 1/10}]; 
    {Graphics[(Point[{Re[#1], Im[#1]}] & ) /@ parabola, AspectRatio -> 1, 
      Axes -> True], Graphics[(Point[{Re[#1], Im[#1]}] & ) /@ 
       (Tan[(Pi/4.)*Sqrt[parabola]]^2), PlotRange -> All, Axes -> True]}], 
  $Failed], TapComment["Pursuit curve in the reference frame of the predator \
with prey moving half as fast along a line:"], 
 TapTestSame[s = FullSimplify[DSolve[{Derivative[1][\[ScriptL]][\[Phi]] == 
       \[ScriptL][\[Phi]]*((Sin[\[Phi]] - 2)/Cos[\[Phi]]), 
      \[ScriptL][0] == 1}, \[ScriptL][\[Phi]], \[Phi]]], 
  {{\[ScriptL][\[Phi]] -> (Sec[\[Phi]] - Tan[\[Phi]])/(1 + Sin[\[Phi]])}}], 
 TapTestSameBROKEN[HoldComplete[PolarPlot[\[ScriptL][\[Phi]] /. s, 
    {\[Phi], 0, Pi/2}, AspectRatio -> 1]], $Failed], 
 TapComment["Basic parity and periodicity properties of the tangent function \
get automatically applied:"], TapTestSame[Tan[x + 2*Pi], Tan[x]], 
 TapTestSame[Tan[-x], -Tan[x]], TapTestSame[Tan[I*x], I*Tanh[x]], 
 TapTestSame[1/Tan[x], Cot[x]], TapComment["Use \
RefLink[TrigFactorList,paclet:ref/TrigFactorList] to factor \
RefLink[Tan,paclet:ref/Tan] into RefLink[Sin,paclet:ref/Sin] and \
RefLink[Cos,paclet:ref/Cos]:"], TapTestSame[Sin[x]/Cos[x], Tan[x]], 
 TapTestSame[TrigFactorList[Tan[x]], {{1, 1}, {Sin[x], 1}, {Cos[x], -1}}], 
 TapComment["Complicated expressions containing trigonometric functions do \
not simplify automatically:"], TapTestSame[Tan[z] + Cot[z], Cot[z] + Tan[z]], 
 TapTestSameBROKEN[Simplify[%], Csc[z]*Sec[z]], 
 TapComment["Simplify under assumptions on parameters:"], 
 TapTestSame[Tan[-x + k*Pi], Tan[k*Pi - x]], 
 TapTestSameBROKEN[Simplify[%, Element[k, Integers]], -Tan[x]], 
 TapComment["Compose with inverse functions:"], 
 TapTestSame[{Tan[ArcTan[z]], Tan[2*ArcTan[z]], Tan[3*ArcTan[z]], 
   Tan[4*ArcTan[z]]}, {z, Tan[2*ArcTan[z]], Tan[3*ArcTan[z]], 
   Tan[4*ArcTan[z]]}], TapTestSameBROKEN[Together[FunctionExpand[%]], 
  {z, -((2*z)/(-1 + z^2)), (-3*z + z^3)/(-1 + 3*z^2), 
   -((4*(-z + z^3))/(1 - 6*z^2 + z^4))}], 
 TapComment["Solve a trigonometric equation:"], 
 TapTestSame[Reduce[Tan[z]^2 - 2*Tan[z + Pi/4] == 4, z], 
  Element[C[1], Integers] && 
   (z == 2*ArcTan[Root[-3 + 2*#1 + 11*#1^2 - 8*#1^3 - 11*#1^4 + 2*#1^5 + 
           3*#1^6 & , 1]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-3 + 2*#1 + 11*#1^2 - 8*#1^3 - 11*#1^4 + 2*#1^5 + 
           3*#1^6 & , 2]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-3 + 2*#1 + 11*#1^2 - 8*#1^3 - 11*#1^4 + 2*#1^5 + 
           3*#1^6 & , 3]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-3 + 2*#1 + 11*#1^2 - 8*#1^3 - 11*#1^4 + 2*#1^5 + 
           3*#1^6 & , 4]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-3 + 2*#1 + 11*#1^2 - 8*#1^3 - 11*#1^4 + 2*#1^5 + 
           3*#1^6 & , 5]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-3 + 2*#1 + 11*#1^2 - 8*#1^3 - 11*#1^4 + 2*#1^5 + 
           3*#1^6 & , 6]] + 2*Pi*C[1])], 
 TapComment["Solve for zeros and poles: "], 
 TapTestSame[Reduce[Tan[\[Alpha]*x + \[Beta]] == 0, x], 
  Element[C[1], Integers] && ((\[Alpha] == 0 && \[Beta] == Pi*C[1]) || 
    (\[Alpha] != 0 && x == (-\[Beta] + Pi*C[1])/\[Alpha]))], 
 TapTestSame[Reduce[1/Tan[\[Alpha]*x + \[Beta]] == 0, x], 
  Element[C[1], Integers] && ((\[Alpha] == 0 && \[Beta] == Pi/2 + Pi*C[1]) || 
    (\[Alpha] != 0 && x == (Pi/2 - \[Beta] + Pi*C[1])/\[Alpha]))], 
 TapComment["Numerically find a root of a transcendental equation:"], 
 TapTestSameBROKEN[FindRoot[Tan[z]^2 + 3*Tan[z + Pi/6] + z == 4, {z, 2}], 
  {z -> 2.03816}], TapComment["Integrals:"], 
 TapTestSame[Integrate[Tan[z]^a, z], 
  (Hypergeometric2F1[(1 + a)/2, 1, 1 + (1 + a)/2, -Tan[z]^2]*Tan[z]^(1 + a))/
   (1 + a)], TapComment["RefLink[Tan,paclet:ref/Tan] appears in special cases \
of many mathematical functions: "], 
 TapTestSame[{MathieuS[1, 0, z]/MathieuC[1, 0, z], JacobiSC[z, 0], 
   JacobiCS[Pi/2 - z, 0], JacobiSN[I*z, 1], JacobiNS[(Pi*I)/2 - I*z, 1], 
   HypergeometricPFQ[{}, {3/2}, -z]/HypergeometricPFQ[{}, {1/2}, -z], 
   MeijerG[{{}, {}}, {{1/2}, {0}}, z]/MeijerG[{{}, {}}, {{-(1/2)}, {0}}, z]}, 
  {Tan[z], Tan[z], Tan[z], I*Tan[z], (-I)*Tan[z], Tan[2*Sqrt[z]]/(2*Sqrt[z]), 
   Sqrt[z]*Tan[2*Sqrt[z]]}], 
 TapComment["Calculate residue symbolically and numerically: "], 
 TapTestSame[Table[Residue[Tan[z]^k, {z, Pi/2}], {k, 5}], {-1, 0, 1, 0, -1}], 
 TapTestSameBROKEN[(1/(2*Pi*I))*NIntegrate[Tan[z], 
    {z, Pi/2 - 1/4, Pi/2 - I/4, Pi/2 + 1/4, Pi/2 + I/4, Pi/2 - 1/4}], 
  -1. + 0.*I], TapComment[
  "RefLink[Tan,paclet:ref/Tan] is a numeric function:"], 
 TapTestSame[Attributes[Tan], {Listable, NumericFunction, Protected}], 
 TapTestSame[NumericQ[Tan[2 + E]], True], 
 TapComment[
  "Machine-precision input is insufficient to give a correct answer:"], 
 TapTestSameBROKEN[Tan[10.^30], -1.15589], 
 TapComment["With exact input, the answer is correct:"], 
 TapTestSame[N[Tan[10^30], 20], 0.090485068063302172566`19.95657691740685], 
 TapComment["A larger setting for \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] is needed:"], 
 TapTestSame[N[Tan[10^100], 20], ComplexInfinity], 
 TapTestSame[Block[{$MaxExtraPrecision = 200}, N[Tan[10^100], 20]], 
  0.40123196199081435419`19.603395521465412], 
 TapComment[
  "In traditional form parentheses are needed around the argument:"], 
 TapTestSame[tan*x, tan*x], TapTestSameBROKEN[tan*x, Tan[x]], 
 TapTestSameBROKEN[$Failed, HoldComplete[Cot[z]*Csc[n*(Pi/2 + z)]*Sin[n*z]]], 
 TapTestSame[Integrate[Tan[ArcCot[z]], z], Log[z]], 
 TapComment["Plot RefLink[Tan,paclet:ref/Tan] at integer points:"], 
 TapTestSameBROKEN[HoldComplete[ArrayPlot[Table[ArcTan[Abs[Tan[x*y]]], 
     {x, -20, 20}, {y, -20, 20}]]], $Failed], 
 TapTestSame[FunctionExpand[Tan[Pi/2^12]], 
  Sqrt[
   (2 - 
     Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[
                  2 + Sqrt[2 + Sqrt[2 + Sqrt[2]]]]]]]]]])/
    (2 + 
     Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[
                  2 + Sqrt[2 + Sqrt[2 + Sqrt[2]]]]]]]]]])]], 
 TapComment["The continued fraction is highly regular:"], 
 TapTestSame[ContinuedFraction[Tan[1], 22], {1, 1, 1, 3, 1, 5, 1, 7, 1, 9, 1, 
   11, 1, 13, 1, 15, 1, 17, 1, 19, 1, 21}], 
 TapTestSame[Element[Tan[1], Algebraics], False], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Tan[y^2 - x^3 + 3*x - 3], {x, -2, 2}, 
    {y, -2, 2}, Exclusions -> {Cos[y^2 - x^3 + 3*x - 3] == 0}, 
    PlotPoints -> 30, Mesh -> None]], $Failed]]
