(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The argument is given in radians:"], 
 TapTestSame[Cot[Pi/3], 1/Sqrt[3]], 
 TapComment[
  "Use RefLink[Degree,paclet:ref/Degree] to specify an argument in degrees:"]\
, TapTestSame[Cot[60*Degree], 1/Sqrt[3]], 
 TapTestSameBROKEN[HoldComplete[Plot[Cot[x], {x, -Pi, Pi}]], $Failed], 
 TapTestSame[Series[Cot[x], {x, 0, 10}], 1/x - x/3 - x^3/45 - (2*x^5)/945 - 
   x^7/4725 - (2*x^9)/93555 + O[x]^11], TapComment["Evaluate numerically:"], 
 TapTestSameBROKEN[Cot[1.2], 0.38878], 
 TapComment["Evaluate to high precision:"], TapTestSame[N[Cot[12/10], 50], 
  0.38877956936820491163419150497190340959498492594098`49.589703434382365], 
 TapComment[
  "The precision of the output tracks the precision of the input:"], 
 TapTestSame[Cot[1.2`23.07918124604763], 
  0.3887795693682049116342`21.589703434382365], 
 TapComment["The precision of the output can be much smaller than the \
precision of the input:"], TapTestSame[
  Cot[1.5707963267948966192213216916397514421`37.196119877030156], 1./10^20], 
 TapComment[
  "RefLink[Cot,paclet:ref/Cot] threads element-wise over lists and matrices:"]\
, TapTestSameBROKEN[Cot[{1.2, 1.5, 1.8}], {0.38878, 0.0709148, -0.233304}], 
 TapTestSameBROKEN[Cot[(Pi/2)*u*v*(Pi/3)], 
  {{0, Cot[u]}, {Cot[v], 1/Sqrt[3]}}], 
 TapComment["Evaluate for complex arguments:"], 
 TapTestSameBROKEN[Cot[2.5 + I], -0.275669 - 1.04264*I], 
 TapComment["Simple exact values are generated automatically:"], 
 TapTestSame[Cot[Pi/6], Sqrt[3]], TapComment["More complicated cases require \
explicit use of RefLink[FunctionExpand,paclet:ref/FunctionExpand]:"], 
 TapTestSame[Cot[Pi/8], Cot[Pi/8]], TapTestSameBROKEN[FunctionExpand[%], 
  Sqrt[(2 + Sqrt[2])/(2 - Sqrt[2])]], 
 TapComment["Convert multiple-angle expressions:"], 
 TapTestSame[TrigExpand[Cot[4*x]], 
  Cos[x]^4/(4*Cos[x]^3*Sin[x] - 4*Cos[x]*Sin[x]^3) - 
   (6*Cos[x]^2*Sin[x]^2)/(4*Cos[x]^3*Sin[x] - 4*Cos[x]*Sin[x]^3) + 
   Sin[x]^4/(4*Cos[x]^3*Sin[x] - 4*Cos[x]*Sin[x]^3)], 
 TapTestSameBROKEN[TrigReduce[%], Cot[4*x]], 
 TapComment["Convert sums of trigonometric functions to products:"], 
 TapTestSame[TrigFactor[Cot[x] + Cot[y]], Csc[x]*Csc[y]*Sin[x + y]], 
 TapComment["Expand assuming real variables:"], 
 TapTestSame[ComplexExpand[Cot[x + I*y]], 
  -(Sin[2*x]/(Cos[2*x] - Cosh[2*y])) + (I*Sinh[2*y])/(Cos[2*x] - Cosh[2*y])], 
 TapComment["Convert to complex exponentials:"], 
 TapTestSame[TrigToExp[Cot[z]], -((I*(E^((-I)*z) + E^(I*z)))/
    (E^((-I)*z) - E^(I*z)))], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[cot(z), cot*z], 
 TapComment["RefLink[Cot,paclet:ref/Cot] can deal with real-valued \
intervals:"], TapTestSame[Cot[Interval[{Pi/6, Pi/3}]], 
  Interval[{1/Sqrt[3], Sqrt[3]}]], 
 TapComment["Infinite arguments give symbolic results:"], 
 TapTestSame[Cot[Infinity], Interval[{-Infinity, Infinity}]], 
 TapTestSame[Cot[ComplexInfinity], Indeterminate], 
 TapComment["RefLink[Cot,paclet:ref/Cot] can be applied to power series:"], 
 TapTestSame[Cot[Pi/2 + x + x^2/2 + x^3/3 + O[x]^4], 
  -x - x^2/2 - (2*x^3)/3 + O[x]^4], TapComment["RefLink[Cot,paclet:ref/Cot] \
threads element-wise over sparse arrays as well as lists: "], 
 TapTestSameBROKEN[HoldComplete[SparseArray[{{1, 1} -> Pi/2, {1, 3} -> Pi/3, 
     {3, 3} -> Pi/12, {4, 2} -> Pi/4, {_, _} -> Pi/2}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Cot[%]], $Failed], 
 TapTestSameBROKEN[MatrixForm[%], 0*0*(1/Sqrt[3])*0*0*0*0*0*2 + 
   Sqrt[3]*0*1*0], TapComment["Generate a plot with poles removed:"], 
 TapTestSameBROKEN[HoldComplete[Plot[Cot[x], {x, -Pi/2, (3/2)*Pi}, 
    Exclusions -> Sin[x] == 0]], $Failed], 
 TapComment["Generate a plot over the complex argument plane:"], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Re[Cot[x + I*y]], {x, -Pi, Pi}, 
    {y, 0, 3}]], $Failed], 
 TapComment[
  "The cotangent function conformally maps a parabola into the unit disk:"], 
 TapTestSameBROKEN[HoldComplete[
   With[{parabola = Table[1 - x^2/4 + I*x, {x, 0, 20, 1/10}], 
     pnts = Point[Thread[Through[{Re, Im}[#1]]]] & , 
     opts = {Axes -> True, PlotRange -> All}}, 
    {Graphics[pnts[parabola], opts], 
     Graphics[pnts[Cot[(Pi/4.)*Sqrt[parabola]]^2], opts]}]], $Failed], 
 TapComment["Basic parity and periodicity properties of the cotangent \
function are automatically applied:"], TapTestSame[Cot[x + Pi], Cot[x]], 
 TapTestSame[Cot[-x], -Cot[x]], TapTestSame[Cot[I*x], (-I)*Coth[x]], 
 TapTestSame[1/Cot[x], Tan[x]], TapComment["Use \
RefLink[TrigFactorList,paclet:ref/TrigFactorList] to factor \
RefLink[Cot,paclet:ref/Cot] into RefLink[Sin,paclet:ref/Sin] and \
RefLink[Cos,paclet:ref/Cos]:"], TapTestSame[Cos[x]/Sin[x], Cot[x]], 
 TapTestSame[TrigFactorList[Cot[x]], {{1, 1}, {Sin[x], -1}, {Cos[x], 1}}], 
 TapComment["Complicated expressions containing trigonometric functions do \
not simplify automatically:"], TapTestSame[Cot[z] + Tan[z], Cot[z] + Tan[z]], 
 TapTestSameBROKEN[Simplify[%], Csc[z]*Sec[z]], 
 TapComment["Simplify with assumptions on parameters:"], 
 TapTestSame[Cot[-x + k*Pi], Cot[k*Pi - x]], 
 TapTestSameBROKEN[Simplify[%, Element[k, Integers]], -Cot[x]], 
 TapComment["Compose with inverse functions:"], 
 TapTestSame[{Cot[ArcCot[z]], Cot[2*ArcCot[z]], Cot[3*ArcCot[z]]}, 
  {z, Cot[2*ArcCot[z]], Cot[3*ArcCot[z]]}], 
 TapTestSameBROKEN[Together[FunctionExpand[%]], 
  {z, (-1 + z^2)/(2*z), (z*(-3 + z^2))/(-1 + 3*z^2)}], 
 TapComment["Solve a trigonometric equation:"], 
 TapTestSame[Reduce[Cot[z]^2 - 2*Cot[z + Pi/4] == 4, z], 
  Element[C[1], Integers] && 
   (z == 2*ArcTan[Root[-1 - 2*#1 + 27*#1^2 + 20*#1^3 - 27*#1^4 - 2*#1^5 + 
           #1^6 & , 1]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-1 - 2*#1 + 27*#1^2 + 20*#1^3 - 27*#1^4 - 2*#1^5 + 
           #1^6 & , 2]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-1 - 2*#1 + 27*#1^2 + 20*#1^3 - 27*#1^4 - 2*#1^5 + 
           #1^6 & , 3]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-1 - 2*#1 + 27*#1^2 + 20*#1^3 - 27*#1^4 - 2*#1^5 + 
           #1^6 & , 4]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-1 - 2*#1 + 27*#1^2 + 20*#1^3 - 27*#1^4 - 2*#1^5 + 
           #1^6 & , 5]] + 2*Pi*C[1] || 
    z == 2*ArcTan[Root[-1 - 2*#1 + 27*#1^2 + 20*#1^3 - 27*#1^4 - 2*#1^5 + 
           #1^6 & , 6]] + 2*Pi*C[1])], 
 TapComment["Solve for zeros and poles: "], 
 TapTestSame[Reduce[Cot[\[Alpha]*x + \[Beta]] == 0, x], 
  Element[C[1], Integers] && ((\[Alpha] == 0 && \[Beta] == Pi/2 + Pi*C[1]) || 
    (\[Alpha] != 0 && x == (Pi/2 - \[Beta] + Pi*C[1])/\[Alpha]))], 
 TapTestSame[Reduce[1/Cot[\[Alpha]*x + \[Beta]] == 0, x], 
  Element[C[1], Integers] && ((\[Alpha] == 0 && \[Beta] == Pi*C[1]) || 
    (\[Alpha] != 0 && x == (-\[Beta] + Pi*C[1])/\[Alpha]))], 
 TapComment["Numerically find a root of a transcendental equation:"], 
 TapTestSameBROKEN[FindRoot[Cot[z]^2 + 3*Cot[z + Pi/6] + z == 4, {z, 2}], 
  {z -> 0.615263}], TapComment["Integrals:"], 
 TapTestSame[Integrate[Cot[z]^a, z], 
  -((Cot[z]^(1 + a)*Hypergeometric2F1[(1 + a)/2, 1, 1 + (1 + a)/2, 
      -Cot[z]^2])/(1 + a))], TapComment["RefLink[Cot,paclet:ref/Cot] appears \
in special cases of many mathematical functions: "], 
 TapTestSame[{BesselJ[-(1/2), z]/BesselJ[1/2, z], 
   MathieuC[1, 0, z]/MathieuS[1, 0, z], JacobiCS[z, 0], 
   JacobiSC[Pi/2 - z, 0], JacobiNS[I*z, 1], JacobiSN[(Pi*I)/2 - I*z, 1], 
   HypergeometricPFQ[{}, {1/2}, -z]/HypergeometricPFQ[{}, {3/2}, -z]}, 
  {Cot[z], Cot[z], Cot[z], Cot[z], (-I)*Cot[z], I*Cot[z], 
   2*Sqrt[z]*Cot[2*Sqrt[z]]}], 
 TapComment["Calculate residue symbolically and numerically: "], 
 TapTestSame[Table[Residue[Cot[z]^k, {z, 0}], {k, 10}], 
  {1, 0, -1, 0, 1, 0, -1, 0, 1, 0}], TapTestSameBROKEN[
  (1/(2*Pi*I))*NIntegrate[Cot[z], {z, -(1/4), -(I/4), Plus[1/4], Plus[I/4], 
     -(1/4)}], 1. + 0.*I], 
 TapComment["RefLink[Cot,paclet:ref/Cot] is a numeric function:"], 
 TapTestSame[Attributes[Cot], {Listable, NumericFunction, Protected}], 
 TapTestSame[NumericQ[Cot[2 + E]], True], 
 TapComment[
  "Machine-precision input is insufficient to give a correct answer:"], 
 TapTestSameBROKEN[Cot[10.^30], -0.865133], 
 TapComment["With exact input, the answer is correct:"], 
 TapTestSame[N[Cot[10^30], 20], 11.051547193404474785`19.043423082593154], 
 TapComment["A larger setting for \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] is needed:"], 
 TapTestSame[N[Cot[10^100], 20], 0.*10^30], 
 TapTestSame[Block[{$MaxExtraPrecision = 200}, N[Cot[10^100], 20]], 
  2.4923238792798206949`19.39660447853459], TapTestSameBROKEN[$Failed, 
  HoldComplete[Csc[n*z]*Sin[n*(Pi/2 + z)]*Tan[z]]], 
 TapTestSameBROKEN[Simplify[%, Element[n/2, Integers]], I^n*Tan[z]], 
 TapTestSameBROKEN[Simplify[%%, Element[(n - 1)/2, Integers]], 
  (-I)*I^n*Cot[n*z]*Tan[z]], TapTestSame[Integrate[Cot[ArcTan[z]], z], 
  Log[z]], TapComment["Plot RefLink[Cot,paclet:ref/Cot] at integer points:"], 
 TapTestSameBROKEN[HoldComplete[ArrayPlot[Table[ArcCot[Abs[Cot[x*y]]], 
     {x, -20, 20}, {y, -20, 20}]]], $Failed], 
 TapTestSame[FunctionExpand[Cot[Pi/2^12]], 
  Sqrt[
   (2 + 
     Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[
                  2 + Sqrt[2 + Sqrt[2 + Sqrt[2]]]]]]]]]])/
    (2 - 
     Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[2 + Sqrt[
                  2 + Sqrt[2 + Sqrt[2 + Sqrt[2]]]]]]]]]])]], 
 TapComment["The continued fraction is highly regular:"], 
 TapTestSame[ContinuedFraction[Cot[1], 22], {0, 1, 1, 1, 3, 1, 5, 1, 7, 1, 9, 
   1, 11, 1, 13, 1, 15, 1, 17, 1, 19, 1}], 
 TapTestSame[Element[Cot[1], Algebraics], False]]
