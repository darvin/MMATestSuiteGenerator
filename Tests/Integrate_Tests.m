(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Indefinite integral:"], 
 ESameTest[Integrate[1/(x^3 + 1), x], ArcTan[(-1 + 2*x)/Sqrt[3]]/Sqrt[3] + 
   (1/3)*Log[1 + x] - (1/6)*Log[1 - x + x^2]], 
 EComment["Definite integral:"], ESameTest[Integrate[1/(x^3 + 1), {x, 0, 1}], 
  (1/18)*(2*Sqrt[3]*Pi + Log[64])], 
 EComment["Use Esc\\[ThinSpace]int\\[ThinSpace]Esc to enter \\[Integral] and \
Esc\\[ThinSpace]dd\\[ThinSpace]Esc to enter \\[DifferentialD]:"], 
 ESameTest[Integrate[Sqrt[x + Sqrt[x]], x], 
  (1/12)*Sqrt[Sqrt[x] + x]*(-3 + 2*Sqrt[x] + 8*x) + 
   (1/8)*Log[1 + 2*Sqrt[x] + 2*Sqrt[Sqrt[x] + x]]], ESameTestBROKEN[%, 
  (1/12)*Sqrt[x + Sqrt[x]]*(8*x + 2*Sqrt[x] - 3) + 
   (1/8)*log*(2*Sqrt[x] + 2*Sqrt[x + Sqrt[x]] + 1)], 
 EComment[
  "Use Ctrl+_ to enter the lower limit, then Ctrl+% for the upper limit:"], 
 ESameTestBROKEN[$Failed, HoldComplete[(-(1/4))*Sqrt[Pi]*
    (EulerGamma + Log[4])]], 
 EComment["Multiple integral with x integration last:"], 
 ESameTest[Integrate[Sin[x*y], {x, 0, 1}, {y, 0, x}], 
  (1/2)*(EulerGamma - CosIntegral[1])], ESameTestBROKEN[$Failed, 
  HoldComplete[(1/2)*(EulerGamma - CosIntegral[1])]], 
 EComment["Integrate over geometric regions, in this case performing a \
surface integral:"], ESameTestBROKEN[
  Integrate[1, Element[{x, y, z}, Sphere[]]], 4*Pi], 
 EComment["Enter the same integral using Ctrl+$ for the region and \
Esc\\[ThinSpace]el\\[ThinSpace]Esc for \\[Element]:"], 
 ESameTestBROKEN[$Failed, HoldComplete[4*Pi]], 
 EComment[
  "Integrals that may not converge are by default returned as conditionals:"]\
, ESameTest[Integrate[Exp[(-c)*x^2], {x, -Infinity, Infinity}], 
  ConditionalExpression[Sqrt[Pi]/Sqrt[c], Re[c] > 0]], 
 EComment["Compute an indefinite integral:"], 
 ESameTest[int = Integrate[x^2 + Sin[x], x], x^3/3 - Cos[x]], 
 EComment["Verify the answer by differentiation:"], 
 ESameTest[D[int, x], x^2 + Sin[x]], 
 EComment["Compute a definite integral over a finite interval:"], 
 ESameTest[Integrate[(2*x + 3)/(x^2 + 5*x + 6), {x, 0, 2}], Log[125/54]], 
 EComment["Infinite interval:"], ESameTest[Integrate[BesselJ[2, x]/(1 + x^2), 
   {x, 0, Infinity}], (1/6)*(2 - 3*Pi*BesselI[2, 1] + 3*Pi*StruveL[2, 1])], 
 EComment["Doubly infinite interval:"], 
 ESameTest[Integrate[Sin[x]/x, {x, -Infinity, Infinity}], Pi], 
 EComment["Integrate a function with a symbolic parameter:"], 
 ESameTest[Integrate[E^((-a)*x^2), {x, 0, Infinity}], 
  ConditionalExpression[Sqrt[Pi]/(2*Sqrt[a]), Re[a] > 0]], 
 EComment["Obtain an answer without conditions on the parameter a:"], 
 ESameTest[Integrate[E^((-a)*x^2), {x, 0, Infinity}, 
   GenerateConditions -> False], Sqrt[Pi]/(2*Sqrt[a])], 
 ESameTest[Integrate[E^((-a)*x^2), {x, 0, Infinity}, Assumptions -> a > 0], 
  Sqrt[Pi]/(2*Sqrt[a])], EComment["Multivariate integrals:"], 
 ESameTestBROKEN[Integrate[BesselJ[3, y]/(x + 1), {x, 0, 5}, {y, 0, 5}], 
  (-(-1 + (2/5)*BesselJ[1, 5] + BesselJ[2, 5]))*Log[6]], 
 ESameTest[Integrate[Exp[-x + y], {x, 0, Infinity}, {y, 0, 1}], -1 + E], 
 EComment["Integrals of piecewise and generalized functions:"], 
 ESameTest[Integrate[Piecewise[{{1, x < 2}, {x^3, 2 < x < 3}}], {x, 0, 3}], 
  73/4], ESameTest[Integrate[x^2*UnitStep[x + 1], {x, -3, 3}], 28/3], 
 ESameTest[Integrate[DiracDelta[x], {x, -Infinity, Infinity}], 1], 
 EComment["Integrals over standard regions:"], 
 ESameTest[Integrate[1, Element[x, Circle[]]], 2*Pi], 
 ESameTestBROKEN[Integrate[1, Element[x, Ball[3]]], (4*Pi)/3], 
 ESameTestBROKEN[Integrate[x^4*y^5 + z^10, Element[{x, y, z}, 
    Tetrahedron[]]], 1273/2162160], 
 EComment["Integral over a region defined by inequalities:"], 
 ESameTest[Integrate[Boole[x + 2*y + 3*z < 2 && -1 < x < y < z < 1], 
   {x, -Infinity, Infinity}, {y, -Infinity, Infinity}, 
   {z, -Infinity, Infinity}], 118/135], 
 EComment["Plot the integration region:"], 
 ESameTestBROKEN[HoldComplete[RegionPlot3D[x + 2*y + 3*z < 2 && 
     -1 < x < y < z < 1, {x, -1, 1}, {y, -1, 1}, {z, -1, 1}, Mesh -> None, 
    PlotPoints -> 50]], $Failed], EComment["Formal integrals:"], 
 ESameTest[Integrate[Derivative[1][f][x], x], f[x]], 
 ESameTest[Integrate[((1 - f[x])*Derivative[1][f][x])/E^f[x], x], 
  f[x]/E^f[x]], EComment[
  "Integrals of vector- and tensor-valued functions:"], 
 ESameTest[Integrate[{x, 1/Sqrt[x], Sin[x]}, {x, 0, 5}], 
  {25/2, 2*Sqrt[5], 1 - Cos[5]}], ESameTestBROKEN[
  MatrixForm[Integrate[x*Sqrt[x]*x^(1/3)*Sqrt[x]*x^(1/3)*x^(1/4)*x^(1/3)*
     x^(1/4)*x^(1/5), {x, 0, 5}]], (25/2)*((10*Sqrt[5])/3)*((15*5^(1/3))/4)*
   ((10*Sqrt[5])/3)*((15*5^(1/3))/4)*4*5^(1/4)*((15*5^(1/3))/4)*4*5^(1/4)*
   ((25*5^(1/5))/6)], EComment["Integral along a complex line: "], 
 ESameTestBROKEN[Integrate[Sqrt[x], {x, I, 3 - I}], 
  Sqrt[(8 - 12*I) + (8/9)*Sqrt[-26 - 18*I]]], 
 EComment["Along a piecewise linear contour in the complex plane:"], 
 ESameTest[FullSimplify[Integrate[1/(z + 1/2), {z, 1, E^((I*Pi)/3), 
     E^((2*I*Pi)/3), -1, E^(-((2*I*Pi)/3)), E^(-((I*Pi)/3)), 1}]], 2*I*Pi], 
 EComment["Along a circular contour in the complex plane: "], 
 ESameTest[Integrate[(I*Exp[I*\[Omega]])/(Exp[I*\[Omega]] + 1/2), 
   {\[Omega], 0, 2*Pi}], 2*I*Pi], ESameTestBROKEN[
  HoldComplete[Show[DensityPlot[Re[1/(a + 1/2 + I*b)], {a, -1.2, 1.2}, 
     {b, -1.2, 1.2}], lpath, cpath]], $Failed], 
 EComment["Integral with bounds depending on the previous variables:"], 
 ESameTest[Integrate[Sin[5*x*y] + 1, {x, -1, 1}, 
   {y, -Sqrt[1 - x^2], Sqrt[1 - x^2]}], Pi], 
 EComment["Plot the integrand over the integration region:"], 
 ESameTestBROKEN[HoldComplete[Plot3D[Sin[5*x*y] + 1, {x, -1, 1}, 
    {y, -Sqrt[1 - x^2], Sqrt[1 - x^2]}, Filling -> 0, Mesh -> None]], 
  $Failed], EComment["Invoke RefLink[NIntegrate,paclet:ref/NIntegrate] \
automatically if symbolic integration fails:"], 
 ESameTestBROKEN[HoldComplete[Integrate[E^(-x^x), {x, 0, 1}]], $Failed], 
 ESameTestBROKEN[N[%], 0.458542], 
 EComment["Rational functions can always be integrated in closed form:"], 
 ESameTestBROKEN[Integrate[1/(x^4 - 1), x], 
  -(ArcTan[x]/2) + (1/4)*Log[-1 + x] - (1/4)*Log[1 + x]], 
 EComment[
  "Sometimes they involve sums of RefLink[Root,paclet:ref/Root] objects:"], 
 ESameTest[Integrate[1/(x^5 + 2*x + 1), x], RootSum[1 + 2*#1 + #1^5 & , 
   Log[x - #1]/(2 + 5*#1^4) & ]], 
 EComment["Similar integrals can lead to functions of different kinds:"], 
 ESameTest[Integrate[Sqrt[x]*Sqrt[1 + x], x], 
  (1/4)*(Sqrt[x]*Sqrt[1 + x]*(1 + 2*x) - ArcSinh[Sqrt[x]])], 
 ESameTest[Integrate[Sqrt[x]*Sqrt[1 + x]*Sqrt[2 + x], x], 
  (1/5)*(2*Sqrt[x]*(1 + x)^(3/2)*Sqrt[2 + x] - (1/(Sqrt[1 + 1/x]*Sqrt[x]))*4*
     Sqrt[(1 + x)/(2 + x)]*(Sqrt[1 + 1/x]*(2 + x) + I*Sqrt[x]*Sqrt[(2 + x)/x]*
       EllipticE[I*ArcSinh[1/Sqrt[x]], 2]))], 
 EComment["Many integrals can be done only in terms of special functions:"], 
 ESameTest[Integrate[Log[Log[x]], x], x*Log[Log[x]] - LogIntegral[x]], 
 ESameTest[Integrate[Exp[-x^2], x], (1/2)*Sqrt[Pi]*Erf[x]], 
 ESameTest[Integrate[Sin[Tan[x]], x], 
  (1/(4*E))*((-1 + E^2)*CosIntegral[I - Tan[x]] + 
    (-1 + E^2)*CosIntegral[I + Tan[x]] + 
    I*(1 + E^2)*(SinIntegral[I - Tan[x]] + SinIntegral[I + Tan[x]]))], 
 ESameTest[Integrate[Log[1 + x]^2/x, x], Log[-x]*Log[1 + x]^2 + 
   2*Log[1 + x]*PolyLog[2, 1 + x] - 2*PolyLog[3, 1 + x]], 
 ESameTest[Integrate[Log[x]*Exp[-x^2], x], 
  (-x)*HypergeometricPFQ[{1/2, 1/2}, {3/2, 3/2}, -x^2] + 
   (1/2)*Sqrt[Pi]*Erf[x]*Log[x]], ESameTest[Integrate[Tan[x]^n, x], 
  (Hypergeometric2F1[(1 + n)/2, 1, 1 + (1 + n)/2, -Tan[x]^2]*Tan[x]^(1 + n))/
   (1 + n)], ESameTest[Integrate[Exp[-x^n], x], 
  -((x*Gamma[1/n, x^n])/(x^n)^n^(-1)/n)], 
 EComment["Integrate special functions:"], 
 ESameTest[Integrate[BesselJ[0, x], x], 
  x*HypergeometricPFQ[{1/2}, {1, 3/2}, -(x^2/4)]], 
 ESameTestBROKEN[Integrate[Sqrt[x]*PolyLog[2, x], x], 
  (4/27)*(3*Log[-1 - Sqrt[x]] - 3*Log[-1 + Sqrt[x]] + 
     Sqrt[x]*(-6 - 2*x + 3*x*Log[1 - x])) + (2/3)*x^(3/2)*PolyLog[2, x]], 
 ESameTest[Integrate[AiryAi[x], x], 
  -(x*(-3*Gamma[1/3]*Gamma[5/3]*HypergeometricPFQ[{1/3}, {2/3, 4/3}, x^3/9] + 
      3^(1/3)*x*Gamma[2/3]^2*HypergeometricPFQ[{2/3}, {4/3, 5/3}, x^3/9]))/
   (9*3^(2/3)*Gamma[2/3]*Gamma[4/3]*Gamma[5/3])], 
 ESameTest[Integrate[SinhIntegral[2/(x + 1)], x], 
  -2*CoshIntegral[2/(1 + x)] + (1 + x)*(Sinh[2/(1 + x)] + 
     SinhIntegral[2/(1 + x)])], EComment["Integrate piecewise functions:"], 
 ESameTestBROKEN[Integrate[2^Max[x, 1 - x], x], 
  Piecewise[-(2^(1 - x)/Log[2])]*x <= 1/2 - (2*Sqrt[2])/Log[2] + 
    (2^x/Log[2])*True], ESameTest[Integrate[x*UnitStep[x], x], 
  (1/2)*x^2*UnitStep[x]], ESameTestBROKEN[Integrate[Clip[x]^2, x], 
  Inequality[Piecewise[x]*x, LessEqual, -1 - 2/3 + x^3/3 - 1, Less, x, 
   LessEqual, 1 - 4/3 + x*True]], ESameTestBROKEN[
  Integrate[Piecewise[{{x^2, x < 1}, {Sin[x^2], 1 < x < 2}}], x], 
  Inequality[Piecewise[x^3/3]*x, LessEqual, 
   1*(1/3) - Sqrt[Pi/2]*FresnelS[Sqrt[2/Pi]] + 
    Sqrt[Pi/2]*FresnelS[Sqrt[2/Pi]*x]*1, Less, x, LessEqual, 
   2*(1/6)*(2 - 3*Sqrt[2*Pi]*(FresnelS[Sqrt[2/Pi]] - FresnelS[2*Sqrt[2/Pi]]))*
    True]], EComment["Multiple indefinite integrals:"], 
 ESameTest[Integrate[1/(x^2 + 4), x, x], 
  (1/2)*(x*ArcTan[x/2] - Log[4 + x^2])], 
 ESameTestBROKEN[FullSimplify[D[%, x, x]], 1/(4 + x^2)], 
 ESameTest[Integrate[Erf[x], x, x, x], 
  (2*(1 + x^2) + E^x^2*Sqrt[Pi]*x*(3 + 2*x^2)*Erf[x])/E^x^2/(12*Sqrt[Pi])], 
 ESameTestBROKEN[FullSimplify[D[%, x, x, x]], Erf[x]], 
 EComment["Integrate an interpolating function:"], 
 ESameTestBROKEN[HoldComplete[f = Interpolation[{10, -5, 10, -10, 20}]], 
  $Failed], ESameTestBROKEN[HoldComplete[Integrate[f[x], x]], $Failed], 
 ESameTestBROKEN[HoldComplete[Plot[%, {x, 1, 5}]], $Failed], 
 EComment["Rational functions:"], 
 ESameTest[Integrate[1/(x^4 + x^2 + 1), {x, 0, Infinity}], Pi/(2*Sqrt[3])], 
 ESameTest[Integrate[x/(x^2 + 3)^7, {x, 1, 11}], 4622415/227200942336], 
 ESameTest[Integrate[1/(x^6 + x^2 + 2), {x, 0, Infinity}], 
  (1/56)*(7 + Sqrt[7*(-5 + 4*Sqrt[2])])*Pi], 
 EComment["Algebraic functions:"], 
 ESameTest[Integrate[x/Sqrt[1 - x], {x, 0, 1}], 4/3], 
 ESameTest[Integrate[1/((1 + x^4)*Sqrt[1 - x^4]), {x, 0, 1}], 
  Pi/8 - (2*Sqrt[Pi]*Gamma[5/4])/Gamma[-(1/4)]], 
 ESameTest[Integrate[1/((2 + x^2)*Sqrt[4 + 3*x^2]), 
   {x, -Infinity, Infinity}], ArcCosh[Sqrt[3/2]]], 
 EComment["Elementary functions:"], ESameTestBROKEN[
  Integrate[Log[Sin[x]], {x, 0, 1}], 
  (-(1/12))*I*(6 + (-6 + Pi)*Pi - 12*I*Log[2] - 6*PolyLog[2, E^(2*I)])], 
 ESameTest[Integrate[Exp[-x + Exp[-x]], {x, 0, Infinity}], -1 + E], 
 ESameTest[Integrate[Exp[(-I)*x]/Cosh[x]^3, {x, -Infinity, Infinity}], 
  Pi*Sech[Pi/2]], ESameTest[Integrate[Cos[Sin[x]^2], {x, 0, Pi/2}], 
  (1/2)*Pi*BesselJ[0, 1/2]*Cos[1/2]], EComment["Special functions:"], 
 ESameTest[Integrate[BesselK[0, x]^2, {x, 0, Infinity}], Pi^2/4], 
 ESameTest[Integrate[AiryAi[x]^2, {x, 0, Infinity}], 
  1/(3^(2/3)*Gamma[1/3]^2)], ESameTest[Integrate[x*PolyGamma[x], {x, 0, 1}], 
  (-(1/2))*Log[2*Pi]], ESameTest[Integrate[Exp[-x]*Sinc[x], 
   {x, 0, Infinity}], Pi/4], ESameTestBROKEN[Integrate[Sin[x^2]*Erfc[x], 
   {x, 0, Infinity}], (1/16)*(Sqrt[(3 - 2*Sqrt[2])*Pi] + 
    Sqrt[(3 + 2*Sqrt[2])*Pi] - 4*Sqrt[2/Pi]*ArcCoth[Sqrt[2]])], 
 ESameTest[Integrate[KelvinKer[x]*BesselJ[1, x], {x, 0, Infinity}], 
  Log[2]/4], EComment["Piecewise functions:"], 
 ESameTest[Integrate[Max[Sin[x], Cos[x]], {x, 0, 2*Pi}], 2*Sqrt[2]], 
 ESameTest[Integrate[Floor[x^2], {x, 0, 3}], 21 - 3*Sqrt[2] - Sqrt[3] - 
   Sqrt[5] - Sqrt[6] - Sqrt[7]], 
 ESameTest[Integrate[PrimePi[n], {n, 0, 100}], 1440], 
 ESameTest[Integrate[Sin[x]^2*UnitStep[x + Pi]*UnitStep[Pi - x], 
   {x, -Infinity, Infinity}], Pi], 
 EComment["When there are parameters, conditions are often needed:"], 
 ESameTest[Integrate[x^n, {x, 0, 1}], ConditionalExpression[1/(1 + n), 
   Re[n] > -1]], ESameTest[Integrate[Sin[a*x]/x, {x, 0, Infinity}], 
  ConditionalExpression[(1/2)*Pi*Sign[a], Element[a, Reals]]], 
 ESameTestBROKEN[Integrate[1/(1 + a*x), {x, 0, 2*Pi}], 
  ConditionalExpression[Log[1 + 2*a*Pi]/a, 
   Re[a] >= 0 || Pi*Re[a] >= -(1/2) || NotElement[a, Reals]]], 
 EComment["Integrate generalized functions:"], 
 ESameTest[Integrate[f[x]*DiracDelta[x - a], {x, -1, 1}, 
   Assumptions -> Element[a, Reals]], f[a]*HeavisideTheta[1 - a]*
   HeavisideTheta[1 + a]], ESameTest[Integrate[DiracDelta[Cos[x^2 - 1]], 
   {x, -2, 2}], Sqrt[2/(2 + Pi)]], 
 EComment["Integrate a constant over a unit disk:"], 
 ESameTest[Integrate[If[x^2 + y^2 < 1, 1, 0], {x, -1, 1}, {y, -1, 1}], Pi], 
 ESameTest[Integrate[Boole[x^2 + y^2 < 1], {x, -1, 1}, {y, -1, 1}], Pi], 
 EComment["Using region notation: "], 
 ESameTest[Integrate[1, Element[{x, y}, Disk[]]], Pi], 
 ESameTestBROKEN[$Failed, HoldComplete[Pi]], 
 EComment["More general integral over a unit disk:"], 
 ESameTest[Integrate[Abs[Sqrt[x]]*Boole[x^2 + y^2 < 1], {x, -1, 1}, 
   {y, -1, 1}], (Sqrt[Pi]*Gamma[3/4])/Gamma[9/4]], 
 ESameTestBROKEN[Integrate[Abs[Sqrt[x]], Element[{x, y}, Disk[]]], 
  (1/(15*Gamma[5/4]))*2*(-12*I*EllipticE[2]*Gamma[5/4] + 
    (3 + 6*I)*Sqrt[2/Pi]*Gamma[3/4]^2*Gamma[5/4] + 2*Sqrt[Pi]*Gamma[7/4])], 
 ESameTestBROKEN[N[%% - %], -4.44089/10^16 - (1.30653*I)/10^16], 
 EComment["Integrate over the unit circle:"], 
 ESameTestBROKEN[$Failed, HoldComplete[Pi/2]], 
 EComment["Integrate over a sphere of radius r:"], 
 ESameTestBROKEN[$Failed, HoldComplete[ConditionalExpression[4*Pi, 
    Element[x0 | y0 | z0, Reals] && r > 0]]], 
 EComment["Regions can be given as logical combinations of inequalities:"], 
 ESameTestBROKEN[Integrate[Boole[1 < x^2 - y^2 < 4 && x*y < 1 && x > 0 && 
     y > 0], {x, -Infinity, Infinity}, {y, -Infinity, Infinity}], 
  (1/4)*(4*ArcCsch[2] + ArcSinh[2] + 4*Log[2] - 2*Log[4] - 
    2*Log[(1/2)*(1 + Sqrt[5])])], 
 EComment[
  "Visualize 2D regions using RefLink[RegionPlot,paclet:ref/RegionPlot]:"], 
 ESameTestBROKEN[HoldComplete[RegionPlot[1 < x^2 - y^2 < 4 && x*y < 1 && 
     x > 0 && y > 0, {x, 1, 5/2}, {y, 0, 1}]], $Failed], 
 EComment[
  "Regions can be in any dimension; in this case integrate over a cone:"], 
 ESameTest[Integrate[(x^2 + y^2)*Boole[0 <= z <= 1 && x^2 + y^2 <= z^2], 
   {x, -Infinity, Infinity}, {y, -Infinity, Infinity}, 
   {z, -Infinity, Infinity}], Pi/10], EComment["Visualize 3D regions using \
RefLink[RegionPlot3D,paclet:ref/RegionPlot3D]:"], 
 ESameTestBROKEN[HoldComplete[RegionPlot3D[0 <= z <= 1 && x^2 + y^2 <= z^2, 
    {x, -1, 1}, {y, -1, 1}, {z, 0, 1}]], $Failed], 
 EComment[
  "Integrate a function with parameters, getting a piecewise result:"], 
 ESameTestBROKEN[Integrate[Boole[a*x < y], {x, 0, 1}, {y, 0, 1}], 
  Inequality[Piecewise[1]*a, LessEqual, 0*((2 - a)/2)*0, Less, a, LessEqual, 
   1*(1/(2*a))*True]], EComment["Infinite number of regions:"], 
 ESameTest[Integrate[Boole[Sin[x] > 1/2]*Exp[-x], {x, 0, Infinity}], 
  E^(7*(Pi/6))/(1 + E^(2*(Pi/3)) + E^(4*(Pi/3)))], 
 EComment["Integrals involving unknown functions are done when possible:"], 
 ESameTestBROKEN[Integrate[Derivative[1][Derivative[1][f]][x] + 
    2*a*Derivative[1][f][x], x], 2*a*f[x] + (f^\[Prime])[x]], 
 EComment[
  "Symbolic integrals can be differentiated with respect to parameters:"], 
 ESameTestBROKEN[HoldComplete[Integrate[f[x], {x, 0, a}]], $Failed], 
 ESameTestBROKEN[D[%, a], f[a]], ESameTestBROKEN[
  HoldComplete[Integrate[f[x, a], {x, p[a], q[a]}]], $Failed], 
 ESameTestBROKEN[HoldComplete[D[%, a]], $Failed], 
 EComment["The variable of integration need not be a single symbol:"], 
 ESameTest[Integrate[p[x]*Log[p[x]], p[x]], 
  (-(1/4))*p[x]^2 + (1/2)*Log[p[x]]*p[x]^2], 
 EComment["Combination of indefinite and definite integration:"], 
 ESameTest[Integrate[x + y, {y, 0, 1}, x], (1/2)*x*(1 + x)], 
 EComment["Integrand with a removable singularity:"], 
 ESameTest[Integrate[Sin[x]/x, {x, 0, Infinity}], Pi/2], 
 EComment["With no RefLink[Assumptions,paclet:ref/Assumptions], conditions \
are generated: "], ESameTest[Integrate[x^n, {x, 0, 1}], 
  ConditionalExpression[1/(1 + n), Re[n] > -1]], 
 EComment["With RefLink[Assumptions,paclet:ref/Assumptions], a result valid \
under the given assumptions is given:"], 
 ESameTest[Integrate[x^n, {x, 0, 1}, Assumptions -> n > 0], 1/(1 + n)], 
 ESameTest[Assuming[n > 0, Integrate[x^n, {x, 0, 1}]], 1/(1 + n)], 
 EComment[
  "Specify assumptions to evaluate a piecewise indefinite integral:"], 
 ESameTest[Integrate[Abs[x + Abs[x]^2], x], Integrate[Abs[x + Abs[x]^2], x]], 
 ESameTestBROKEN[Integrate[Abs[x + Abs[x]^2], x, 
   Assumptions -> Element[x, Reals]], 
  Inequality[Piecewise[x^2]/2 + (x^3/3)*x, LessEqual, 
   -(1/3) - x^2/2 - x^3/3 - 1, Less, x, LessEqual, 
   0*(1/3) + x^2/2 + (x^3/3)*True]], 
 ESameTest[Integrate[Exp[(-a)*x^2], {x, 0, Infinity}], 
  ConditionalExpression[Sqrt[Pi]/(2*Sqrt[a]), Re[a] > 0]], 
 EComment["Generate a result without conditions that is valid only for some \
values of parameters:"], ESameTest[Integrate[Exp[(-a)*x^2], {x, 0, Infinity}, 
   GenerateConditions -> False], Sqrt[Pi]/(2*Sqrt[a])], 
 EComment["The ordinary Riemann definite integral is divergent:"], 
 ESameTestBROKEN[HoldComplete[Integrate[1/x, {x, -1, 2}]], $Failed], 
 EComment["The Cauchy principal value integral is finite:"], 
 ESameTest[Integrate[1/x, {x, -1, 2}, PrincipalValue -> True], Log[2]], 
 ESameTestBROKEN[HoldComplete[Integrate[Tan[x], {x, 0, Pi}]], $Failed], 
 ESameTest[Integrate[Tan[x], {x, 0, Pi}, PrincipalValue -> True], 0], 
 EComment["Area of a disk with radius r:"], 
 ESameTest[Integrate[Boole[x^2 + y^2 < r^2], {x, -Infinity, Infinity}, 
   {y, -Infinity, Infinity}, Assumptions -> r > 0], Pi*r^2], 
 EComment["Intersection of a disk intersected with a square region:"], 
 ESameTestBROKEN[Integrate[Boole[x^2 + y^2 < a], {x, 0, 1}, {y, 0, 1}], 
  Inequality[Piecewise[1]*a, GreaterEqual, 2*((a*Pi)/4)*0, Less, a, 
   LessEqual, 1*(1/2)*(2*Sqrt[-1 + a] + a*ArcCsc[Sqrt[a]] - 
     a*ArcTan[Sqrt[-1 + a]])*1, Less, a, Less, 2*0*True]], 
 ESameTestBROKEN[HoldComplete[Table[RegionPlot[x^2 + y^2 < a, {x, 0, 1}, 
     {y, 0, 1}, FrameTicks -> None], {a, {1/2, 3/2, 5/2}}]], $Failed], 
 EComment["Find the volume of a four-dimensional unit sphere:"], 
 ESameTest[Integrate[Boole[Sum[x[i]^2, {i, 4}] < 1], {x[1], -1, 1}, 
   {x[2], -1, 1}, {x[3], -1, 1}, {x[4], -1, 1}], Pi^2/2], 
 EComment["Mean and variance of the normal distribution:"], 
 ESameTest[Integrate[x*PDF[NormalDistribution[\[Mu], \[Sigma]], x], 
   {x, -Infinity, Infinity}, Assumptions -> \[Sigma] > 0], \[Mu]], 
 ESameTest[Integrate[(x - \[Mu])^2*PDF[NormalDistribution[\[Mu], \[Sigma]], 
     x], {x, -Infinity, Infinity}, Assumptions -> \[Sigma] > 0], \[Sigma]^2], 
 ESameTestBROKEN[HoldComplete[ListPlot[pts]], $Failed], 
 ESameTestBROKEN[Mean[Norm /@ pts], 0.765734], 
 EComment["Compare to the asymptotic result:"], 
 ESameTest[Integrate[Norm[{x, y}], {x, 0, 1}, {y, 0, 1}], 
  (1/3)*(Sqrt[2] + ArcSinh[1])], ESameTestBROKEN[N[%], 0.765196], 
 EComment[
  "Construct Enneper's minimal surface using Weierstrassian integrals:"], 
 ESameTestBROKEN[HoldComplete[ParametricPlot3D[
    Re[{Integrate[1 - x^2, x], Integrate[I*(1 + x^2), x], 
       Integrate[2*x, x]} /. {x -> r*E^(I*\[Phi])}], {r, 0, 3}, 
    {\[Phi], 0, 2*Pi}, Boxed -> False, Axes -> False, PlotRange -> All, 
    Mesh -> False]], $Failed], 
 EComment["Evaluate integrals numerically using RefLink[N,paclet:ref/N]:"], 
 ESameTestBROKEN[HoldComplete[Integrate[Sin[Sin[x]], {x, 0, 1}]], $Failed], 
 ESameTestBROKEN[N[%], 0.430606], ESameTestBROKEN[
  NIntegrate[Sin[Sin[x]], {x, 0, 1}], 0.430606], 
 EComment["Assumptions about variables can yield different forms:"], 
 ESameTest[Integrate[Exp[-x^a], x], -((x*Gamma[1/a, x^a])/(x^a)^a^(-1)/a)], 
 ESameTestBROKEN[FullSimplify[%, a > 0], 
  -((x*ExpIntegralE[(-1 + a)/a, x^a])/a)], 
 EComment["Solve a simple differential equation:"], 
 ESameTest[Integrate[Sin[x], x], -Cos[x]], 
 ESameTest[DSolve[Derivative[1][y][x] == Sin[x], y, x], 
  {{y -> Function[{x}, C[1] - Cos[x]]}}], EComment["RefLink[Derivative,paclet\
:ref/Derivative] with a negative integer order does integrals:"], 
 ESameTestBROKEN[Derivative[-2][Function[x, x^n]], 
  Function[x, x^(2 + n)/((1 + n)*(2 + n))]], ESameTest[Integrate[x^n, x, x], 
  x^(2 + n)/(2 + 3*n + n^2)], EComment["Laplace transform of an integral:"], 
 ESameTest[LaplaceTransform[Integrate[f[u], {u, 0, t}], t, s], 
  LaplaceTransform[f[t], t, s]/s], EComment["RefLink[ArcLength,paclet:ref/Arc\
Length] is the integral of 1 over a one-dimensional region:"], 
 ESameTestBROKEN[$Failed, HoldComplete[2*Pi]], 
 ESameTestBROKEN[ArcLength[Circle[]], 2*Pi], EComment["RefLink[Area,paclet:re\
f/Area] is the integral of 1 over a two-dimensional region:"], 
 ESameTestBROKEN[$Failed, HoldComplete[4*Pi]], 
 ESameTestBROKEN[Area[Sphere[]], 4*Pi], EComment["RefLink[Volume,paclet:ref/V\
olume] is the integral of 1 over a three-dimensional region:"], 
 ESameTestBROKEN[$Failed, HoldComplete[(4*Pi)/3]], 
 ESameTestBROKEN[Volume[Ball[]], (4*Pi)/3], 
 ESameTestBROKEN[{RegionMeasure[\[ScriptCapitalR]], 
   Integrate[1, Element[{x, y}, \[ScriptCapitalR]]]}, {2*Pi, 2*Pi}], 
 ESameTestBROKEN[{RegionMeasure[\[ScriptCapitalR]], 
   Integrate[1, Element[{x, y, z}, \[ScriptCapitalR]]]}, 
  {(4*Pi)/3, (4*Pi)/3}], ESameTestBROKEN[{RegionCentroid[\[ScriptCapitalR]], 
   Integrate[p, Element[p, \[ScriptCapitalR]]]/m}, {{1, 2, 3}, {1, 2, 3}}], 
 EComment["Many simple integrals cannot be evaluated in terms of standard \
mathematical functions:"], ESameTest[Integrate[Sin[x]/Log[x], x], 
  Integrate[Sin[x]/Log[x], x]], 
 EComment["Simple-looking integrals can give complicated results:"], 
 ESameTest[Integrate[x*Sin[x]*Cos[x^2], x], 
  (1/8)*(2*Cos[(-1 + x)*x] - 2*Cos[x*(1 + x)] + 
    Sqrt[2*Pi]*((-Cos[1/4])*FresnelS[(-1 + 2*x)/Sqrt[2*Pi]] + 
      FresnelC[(-1 + 2*x)/Sqrt[2*Pi]]*Sin[1/4]) + 
    Sqrt[2*Pi]*((-Cos[1/4])*FresnelS[(1 + 2*x)/Sqrt[2*Pi]] + 
      FresnelC[(1 + 2*x)/Sqrt[2*Pi]]*Sin[1/4]))], 
 EComment["The derivative of an integral may not come out in the same form as \
the original function:"], ESameTestBROKEN[Integrate[1/(1 - x^2), x], 
  (1/2)*Log[-1 - x] - (1/2)*Log[-1 + x]], ESameTestBROKEN[D[%, x], 
  -(1/(2*(-1 - x))) - 1/(2*(-1 + x))], ESameTestBROKEN[Simplify[%], 
  1/(1 - x^2)], EComment["Different forms of the same integrand can give \
integrals that differ by constants of integration:"], 
 ESameTest[Integrate[1 + (x + 1)^3, x], x + (1/4)*(1 + x)^4], 
 ESameTest[Integrate[Expand[1 + (x + 1)^3], x], 
  2*x + (3*x^2)/2 + x^3 + x^4/4], ESameTestBROKEN[Simplify[%% - %], 1/4], 
 EComment["Results for integrals can depend on the way parameters appear in \
an integrand:"], ESameTest[Integrate[1/(1 + x^2/a), x], 
  Sqrt[a]*ArcTan[x/Sqrt[a]]], ESameTest[Integrate[1/(1 - x^2/b), x], 
  Sqrt[b]*ArcTanh[x/Sqrt[b]]], 
 EComment[
  "The indefinite integral of a continuous function can be discontinuous:"], 
 ESameTestBROKEN[HoldComplete[{Plot[1/(2 + Sin[x]), {x, 0, 2*Pi}], 
    Plot[Evaluate[Integrate[1/(2 + Sin[x]), x]], {x, 0, 2*Pi}]}], $Failed], 
 EComment[
  "Parameters like n are assumed to be generic inside indefinite integrals:"]\
, ESameTest[Integrate[x^n, x], x^(1 + n)/(1 + n)], 
 ESameTest[Integrate[x^(-1), x], Log[x]], 
 EComment["In definite integration, conditions are generated: "], 
 ESameTestBROKEN[Integrate[x^n, {x, 0, 1}], If[Re[n] > -1, 1/(1 + n), 
   Integrate[x^n, {x, 0, 1}, Assumptions -> Re[n] <= -1]]], 
 ESameTestBROKEN[HoldComplete[Integrate[x^(-1), {x, 0, 1}]], $Failed], 
 EComment[
  "The integration variable cannot itself be a mathematical function:"], 
 ESameTest[Integrate[Log[x], Sin[x]], Integrate[Log[x], Sin[x]]], 
 EComment["When part of a sum cannot be integrated explicitly, the whole sum \
will stay unintegrated:"], ESameTestBROKEN[
  Integrate[f[x] + Derivative[1][f][x], x], Integrate[f[x] + (f^\[Prime])[x], 
   x]], EComment["Substituting limits into an indefinite integral may not \
give the correct result for a definite integral:"], 
 ESameTest[Integrate[1/(2 + Cos[x]), {x, 0, 2*Pi}], (2*Pi)/Sqrt[3]], 
 ESameTest[expr = Integrate[1/(2 + Cos[x]), x], 
  (2*ArcTan[Tan[x/2]/Sqrt[3]])/Sqrt[3]], 
 ESameTest[(expr /. x -> 2*Pi) - (expr /. x -> 0), 0], 
 EComment["The presence of a discontinuity in the expression for the \
indefinite integral leads to the anomaly:"], 
 ESameTestBROKEN[HoldComplete[Plot[expr, {x, 0, 2*Pi}]], $Failed], 
 EComment["Expanding RefLink[RootSum,paclet:ref/RootSum] objects from \
integrals may give large results:"], ESameTestBROKEN[
  Integrate[1/(x^3 + x + 1), {x, 0, Infinity}], 
  -RootSum[1 + #1 + #1^3 & , Log[-#1]/(1 + 3*#1^2) & ]], 
 ESameTestBROKEN[ToRadicals[%], 
  -(Log[(2/(3*(-9 + Sqrt[93])))^(1/3) - ((1/2)*(-9 + Sqrt[93]))^(1/3)/
        3^(2/3)]/(1 + 3*(-(2/(3*(-9 + Sqrt[93])))^(1/3) + 
         ((1/2)*(-9 + Sqrt[93]))^(1/3)/3^(2/3))^2)) - 
   Log[((1 + I*Sqrt[3])*((1/2)*(-9 + Sqrt[93]))^(1/3))/(2*3^(2/3)) - 
      (1 - I*Sqrt[3])/(2^(2/3)*(3*(-9 + Sqrt[93]))^(1/3))]/
    (1 + 3*(-(((1 + I*Sqrt[3])*((1/2)*(-9 + Sqrt[93]))^(1/3))/(2*3^(2/3))) + 
        (1 - I*Sqrt[3])/(2^(2/3)*(3*(-9 + Sqrt[93]))^(1/3)))^2) - 
   Log[((1 - I*Sqrt[3])*((1/2)*(-9 + Sqrt[93]))^(1/3))/(2*3^(2/3)) - 
      (1 + I*Sqrt[3])/(2^(2/3)*(3*(-9 + Sqrt[93]))^(1/3))]/
    (1 + 3*(-(((1 - I*Sqrt[3])*((1/2)*(-9 + Sqrt[93]))^(1/3))/(2*3^(2/3))) + 
        (1 + I*Sqrt[3])/(2^(2/3)*(3*(-9 + Sqrt[93]))^(1/3)))^2)], 
 EComment[
  "A definite integral may have a closed form only over an infinite \
interval:"], ESameTestBROKEN[HoldComplete[Integrate[BesselJ[2, x]/(1 + x^2), 
    {x, 0, 1}]], $Failed], ESameTest[Integrate[BesselJ[2, x]/(1 + x^2), 
   {x, 0, Infinity}], (1/6)*(2 - 3*Pi*BesselI[2, 1] + 3*Pi*StruveL[2, 1])], 
 EComment["With too many components in a piecewise integral, \
RefLink[$MaxPiecewiseCases,paclet:ref/$MaxPiecewiseCases] may have to be \
increased:"], ESameTestBROKEN[HoldComplete[Integrate[Floor[x^2], 
    {x, 0, 10}]], $Failed], ESameTest[Block[{$MaxPiecewiseCases = Infinity}, 
   Integrate[Floor[x^2], {x, 0, 10}]], 945 - 28*Sqrt[2] - 15*Sqrt[3] - 
   10*Sqrt[5] - 10*Sqrt[6] - 6*Sqrt[7] - 6*Sqrt[10] - 6*Sqrt[11] - 
   3*Sqrt[13] - 3*Sqrt[14] - 3*Sqrt[15] - 3*Sqrt[17] - 3*Sqrt[19] - 
   3*Sqrt[21] - 3*Sqrt[22] - 3*Sqrt[23] - Sqrt[26] - Sqrt[29] - Sqrt[30] - 
   Sqrt[31] - Sqrt[33] - Sqrt[34] - Sqrt[35] - Sqrt[37] - Sqrt[38] - 
   Sqrt[39] - Sqrt[41] - Sqrt[42] - Sqrt[43] - Sqrt[46] - Sqrt[47] - 
   Sqrt[51] - Sqrt[53] - Sqrt[55] - Sqrt[57] - Sqrt[58] - Sqrt[59] - 
   Sqrt[61] - Sqrt[62] - Sqrt[65] - Sqrt[66] - Sqrt[67] - Sqrt[69] - 
   Sqrt[70] - Sqrt[71] - Sqrt[73] - Sqrt[74] - Sqrt[77] - Sqrt[78] - 
   Sqrt[79] - Sqrt[82] - Sqrt[83] - Sqrt[85] - Sqrt[86] - Sqrt[87] - 
   Sqrt[89] - Sqrt[91] - Sqrt[93] - Sqrt[94] - Sqrt[95] - Sqrt[97]], 
 EComment["Specifying integer assumptions may not give a simpler result:"], 
 ESameTest[Integrate[k*Cos[k*x], {x, -Pi, Pi}, 
   Assumptions -> Element[k, Integers]], 2*Sin[k*Pi]], 
 EComment[
  "Use RefLink[Refine,paclet:ref/Refine] to obtain the expected result:"], 
 ESameTestBROKEN[Refine[%, Element[k, Integers]], 0], 
 EComment["Borwein-type integral:"], 
 ESameTest[Integrate[Product[Sin[x/(2*k + 1)], {k, 0, 8}]/x^9, 
   {x, 0, Infinity}], (17708695183056190642497315530628422295569865119*Pi)/
   1220462921565155916674902677397230198502690752000000000], 
 ESameTest[Integrate[x^27*ProductLog[x^4], x], 
  (x^28*(720 - 5040*ProductLog[x^4] + 17640*ProductLog[x^4]^2 - 
     41160*ProductLog[x^4]^3 + 72030*ProductLog[x^4]^4 - 
     100842*ProductLog[x^4]^5 + 117649*ProductLog[x^4]^6 - 
     117649*ProductLog[x^4]^7 + 823543*ProductLog[x^4]^8))/
   (23059204*ProductLog[x^4]^7)], 
 EComment["A logarithmic integral from Srinivasa Ramanujan's notebooks:"], 
 ESameTestBROKEN[Integrate[Log[(1 + Sqrt[1 + 4*x])/2]/x, {x, 0, 1}], 
  Pi^2/15], EComment["Nested piecewise integrals:"], 
 ESameTest[Integrate[Ceiling[x^2 + Floor[x]], {x, 0, 5}], 
  125 - 6*Sqrt[2] - 3*Sqrt[3] - 3*Sqrt[5] - 3*Sqrt[6] - Sqrt[7] - Sqrt[10] - 
   Sqrt[11] - Sqrt[13] - Sqrt[14] - Sqrt[15] - Sqrt[17] - Sqrt[19] - 
   Sqrt[21] - Sqrt[22] - Sqrt[23]]]
