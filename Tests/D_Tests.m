(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Derivative with respect to x:"], 
 ESameTest[D[x^n, x], n*x^(-1 + n)], 
 EComment["Fourth derivative with respect to x:"], 
 ESameTest[D[Sin[x]^10, {x, 4}], 5040*Cos[x]^4*Sin[x]^6 - 
   4680*Cos[x]^2*Sin[x]^8 + 280*Sin[x]^10], 
 EComment["Derivative with respect to x and y:"], 
 ESameTest[D[Sin[x*y]/(x^2 + y^2), x, y], -((2*x^2*Cos[x*y])/(x^2 + y^2)^2) - 
   (2*y^2*Cos[x*y])/(x^2 + y^2)^2 + Cos[x*y]/(x^2 + y^2) + 
   (8*x*y*Sin[x*y])/(x^2 + y^2)^3 - (x*y*Sin[x*y])/(x^2 + y^2)], 
 EComment["Derivative involving a symbolic function f:"], 
 ESameTestBROKEN[D[x*f[x]*Derivative[1][f][x], x], 
  f[x]*(f^\[Prime])[x] + x*(f^\[Prime])[x]^2 + 
   x*f[x]*(f^\[Prime]\[Prime])[x]], 
 EComment["Vector derivative (gradient vector):"], 
 ESameTest[D[x^2*Sin[y], {{x, y}}], {2*x*Sin[y], x^2*Cos[y]}], 
 EComment["Second-order derivative tensor:"], 
 ESameTest[D[{Sin[y], Sin[x] + Cos[y]}, {{x, y}, 2}], 
  {{{0, 0}, {0, -Sin[y]}}, {{-Sin[x], 0}, {0, -Cos[y]}}}], 
 EComment["Evaluate derivatives numerically:"], 
 ESameTestBROKEN[N[Derivative[1][Zeta][2]], -0.937548], 
 EComment["Enter \\[PartialD] using Esc\\[ThinSpace]pd\\[ThinSpace]Esc, and \
subscripts using Control+_:"], ESameTestBROKEN[$Failed, 
  HoldComplete[-((2*x)/(1 + x^2)^2)]], 
 EComment["Polynomial and rational functions:"], 
 ESameTest[D[a*x^4 + b*x^3 + c, x], 3*b*x^2 + 4*a*x^3], 
 ESameTest[Together[D[(x - 7)/(2*x^2 + 3*x + 11), x]], 
  -((2*(-16 - 14*x + x^2))/(11 + 3*x + 2*x^2)^2)], 
 EComment["Algebraic functions:"], ESameTest[D[Sqrt[1 + x^3], x], 
  (3*x^2)/(2*Sqrt[1 + x^3])], 
 ESameTest[Together[D[(1 + x^(3/5))^(1/2)/(3*x + 1)^5, x]], 
  -((3*(-1 + 50*x^(2/5) + 47*x))/(10*Sqrt[1 + x^(3/5)]*x^(2/5)*
     (1 + 3*x)^6))], 
 EComment["Trigonometric and inverse trigonometric functions:"], 
 ESameTest[D[Sin[x]*Cos[x + y], x, y], (-Cos[x + y])*Sin[x] - 
   Cos[x]*Sin[x + y]], ESameTest[D[ArcTan[x], x], 1/(1 + x^2)], 
 EComment["Exponential and logarithmic functions:"], 
 ESameTest[Together[D[(2*x + 5)*E^x^2, x]], 2*E^x^2*(1 + 5*x + 2*x^2)], 
 ESameTest[Together[D[Log[(x + 1)/(x - 5)], x]], -(6/((-5 + x)*(1 + x)))], 
 ESameTest[Together[D[x*E^x^x^x, x]], 
  E^x^x^x*(1 + x^(x + x^x) + x^(1 + x + x^x)*Log[x] + 
    x^(1 + x + x^x)*Log[x]^2)], EComment["Hyperbolic functions:"], 
 ESameTest[D[Sinh[x^2], x], 2*x*Cosh[x^2]], ESameTest[D[ArcCoth[x], {x, 2}], 
  (2*x)/(1 - x^2)^2], EComment["The logarithmic derivative of \
RefLink[Gamma,paclet:ref/Gamma] is the \
RefLink[PolyGamma,paclet:ref/PolyGamma] function:"], 
 ESameTest[D[Log[Gamma[x]], x], PolyGamma[0, x]], 
 EComment["Derivatives of Airy functions are given in terms of \
RefLink[AiryAiPrime,paclet:ref/AiryAiPrime] and \
RefLink[AiryBiPrime,paclet:ref/AiryBiPrime]:"], 
 ESameTest[D[AiryAi[x], {x, 7}], 9*x^2*AiryAi[x] + 10*AiryAiPrime[x] + 
   x^3*AiryAiPrime[x]], ESameTest[D[(x + 1)*AiryBi[Sin[x]], x], 
  AiryBi[Sin[x]] + (1 + x)*AiryBiPrime[Sin[x]]*Cos[x]], 
 EComment["The derivative of RefLink[Zeta,paclet:ref/Zeta] has a closed form \
expression at the origin:"], ESameTestBROKEN[der = D[Zeta[x], x], 
  (Zeta^\[Prime])[x]], ESameTest[der /. x -> 0, (-(1/2))*Log[2*Pi]], 
 ESameTestBROKEN[(Zeta^\[Prime])[0], (-(1/2))*Log[2*Pi]], 
 EComment["Special functions with elementary derivatives:"], 
 ESameTest[D[EllipticF[x, m], x], 1/Sqrt[1 - m*Sin[x]^2]], 
 ESameTest[D[Erf[x^2], x], (4*x)/E^x^4/Sqrt[Pi]], 
 EComment["Special functions with derivatives expressed in terms of the same \
functions:"], ESameTest[D[BesselJ[n, x], x], 
  (1/2)*(BesselJ[-1 + n, x] - BesselJ[1 + n, x])], 
 ESameTest[D[GegenbauerC[n, m, x], x], 2*m*GegenbauerC[-1 + n, 1 + m, x]], 
 ESameTest[D[Hypergeometric2F1[a, b, c, x], x], 
  (a*b*Hypergeometric2F1[1 + a, 1 + b, 1 + c, x])/c], 
 EComment["Derivative of RefLink[JacobiSN,paclet:ref/JacobiSN]:"], 
 ESameTest[D[JacobiSN[x, m]^2, x], 2*JacobiCN[x, m]*JacobiDN[x, m]*
   JacobiSN[x, m]], EComment["Derivative of a piecewise function:"], 
 ESameTestBROKEN[D[Max[x, x^2], x], Inequality[Piecewise[2]*x*x, Less, 0*1*0, 
   Less, x, Less, 1*2*x*x, Greater, 1*Indeterminate*True]], 
 EComment["Distributional derivatives of expressions involving the \
RefLink[HeavisideTheta,paclet:ref/HeavisideTheta] function:"], 
 ESameTest[D[HeavisideTheta[x], x], DiracDelta[x]], 
 ESameTest[D[x*HeavisideTheta[x - 2], x], x*DiracDelta[-2 + x] + 
   HeavisideTheta[-2 + x]], ESameTestBROKEN[
  Solve[D[eqn, x], Derivative[1][y][x]], 
  {{(y^\[Prime])[x] -> (2*x)/(3 + 2*y[x])}}], 
 ESameTestBROKEN[HoldComplete[Solve[D[eqn, y], D[z[x, y], y]]], $Failed], 
 EComment["Gradient of a scalar function:"], 
 ESameTest[vars = Array[Subscript[x, #1] & , 5]; 
   f = (#1 . #1 & )[Differences[vars]], 
  (-Subscript[x, 1] + Subscript[x, 2])^2 + 
   (-Subscript[x, 2] + Subscript[x, 3])^2 + 
   (-Subscript[x, 3] + Subscript[x, 4])^2 + 
   (-Subscript[x, 4] + Subscript[x, 5])^2], ESameTest[D[f, {vars}], 
  {-2*(-Subscript[x, 1] + Subscript[x, 2]), 
   2*(-Subscript[x, 1] + Subscript[x, 2]) - 
    2*(-Subscript[x, 2] + Subscript[x, 3]), 
   2*(-Subscript[x, 2] + Subscript[x, 3]) - 
    2*(-Subscript[x, 3] + Subscript[x, 4]), 
   2*(-Subscript[x, 3] + Subscript[x, 4]) - 
    2*(-Subscript[x, 4] + Subscript[x, 5]), 
   2*(-Subscript[x, 4] + Subscript[x, 5])}], EComment["Hessian matrix:"], 
 ESameTestBROKEN[MatrixForm[D[f, {vars, 2}]], 2 - 2*0*0*0 - 2*4 - 2*0*0*0 - 
   2*4 - 2*0*0*0 - 2*4 - 2*0*0*0 - 2*2], 
 EComment["Jacobian of a vector valued function:"], 
 ESameTest[vars = Array[Subscript[x, #1] & , 5]; 
   f = Drop[vars, 1]*Differences[vars], 
  {Subscript[x, 2]*(-Subscript[x, 1] + Subscript[x, 2]), 
   Subscript[x, 3]*(-Subscript[x, 2] + Subscript[x, 3]), 
   Subscript[x, 4]*(-Subscript[x, 3] + Subscript[x, 4]), 
   Subscript[x, 5]*(-Subscript[x, 4] + Subscript[x, 5])}], 
 ESameTestBROKEN[MatrixForm[D[f, {vars}]], -Subscript[x, 2] - 
   Subscript[x, 1] + 2*Subscript[x, 2]*0*0*0*0 - Subscript[x, 3] - 
   Subscript[x, 2] + 2*Subscript[x, 3]*0*0*0*0 - Subscript[x, 4] - 
   Subscript[x, 3] + 2*Subscript[x, 4]*0*0*0*0 - Subscript[x, 5] - 
   Subscript[x, 4] + 2*Subscript[x, 5]], 
 EComment["Second-order derivative tensor:"], 
 ESameTest[D[f, {vars, 2}], {{{0, -1, 0, 0, 0}, {-1, 2, 0, 0, 0}, 
    {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}}, 
   {{0, 0, 0, 0, 0}, {0, 0, -1, 0, 0}, {0, -1, 2, 0, 0}, {0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0}}, {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, -1, 0}, 
    {0, 0, -1, 2, 0}, {0, 0, 0, 0, 0}}, {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0}, {0, 0, 0, 0, -1}, {0, 0, 0, -1, 2}}}], 
 ESameTestBROKEN[HoldComplete[D[f, {SparseArray[vars], 2}]], $Failed], 
 EComment["The gradient can also be computed as a \
RefLink[SparseArray,paclet:ref/SparseArray], but in this case it is \
effectively dense:"], ESameTestBROKEN[
  HoldComplete[D[f, {SparseArray[vars]}]], $Failed], 
 ESameTestBROKEN[HoldComplete[D[f, {SparseArray[vars]}]], $Failed], 
 EComment["Differentiate with respect to different formal variables: "], 
 ESameTestBROKEN[D[Sin[f[x]] + Derivative[1][Derivative[1][f]][x], x], 
  Cos[f[x]]*(f^\[Prime])[x] + (f^3)[x]], 
 ESameTest[D[Sin[f[x]] + Derivative[1][Derivative[1][f]][x], f[x]], 
  Cos[f[x]]], ESameTest[D[Sin[f[x]] + Derivative[1][Derivative[1][f]][x], 
   Derivative[1][Derivative[1][f]][x]], 1], 
 EComment["Differentiate with y considered as depending on x:"], 
 ESameTest[D[x^2 + y^2 == 1, x, NonConstants -> y], 
  2*x + 2*y*D[y, x, NonConstants -> {y}] == 0], 
 EComment[
  "Solve for the derivative of y to effect implicit differentiation:"], 
 ESameTestBROKEN[Solve[%, D[y, x, NonConstants -> {y}]], 
  {{D[y, x, NonConstants -> {y}] -> -(x/y)}}], 
 ESameTestBROKEN[HoldComplete[Plot[f[x], {x, -4, 2}]], $Failed], 
 ESameTestBROKEN[Solve[D[f[x], x] == 0, x], {{x -> -1 - Sqrt[2]}, 
   {x -> -1 + Sqrt[2]}}], 
 EComment["Perform the change of variable t=x^2 in an integral:"], 
 ESameTest[Integrate[x*Exp[x^2], {x, 0, 2}], (1/2)*(-1 + E^4)], 
 ESameTest[Integrate[t^(1/2)*Exp[t]*D[t^(1/2), t], {t, 0, 4}], 
  (1/2)*(-1 + E^4)], ESameTestBROKEN[
  HoldComplete[ParametricPlot3D[Helix[1, 1/11, t], {t, 0, 30}, 
    Boxed -> False, Axes -> False]], $Failed], 
 ESameTestBROKEN[FullSimplify[Curvature[Helix[r, c, t], t], 
   0 < t < Pi/2 && r > 0 && c > 0], r/(c^2 + r^2)], 
 EComment["Compute the coefficients of a power series:"], 
 ESameTest[Table[D[Exp[x^3]*Sin[x], {x, n}]/n!, {n, 0, 8}] /. {x -> 0}, 
  {0, 1, 0, -(1/6), 1, 1/120, -(1/6), 2519/5040, 1/120}], 
 ESameTest[Series[Exp[x^3]*Sin[x], {x, 0, 8}], x - x^3/6 + x^4 + x^5/120 - 
   x^6/6 + (2519*x^7)/5040 + x^8/120 + O[x]^9], 
 ESameTestBROKEN[Derivative[1][y][x] == 
   Apart[Derivative[1][y][x] /. Solve[D[eqn, x], Derivative[1][y][x]][[1]]], 
  (y^\[Prime])[x] == -((x*y[x]^2)/(-1 + x)) + y[x]^3], 
 ESameTestBROKEN[HoldComplete[Plot[Evaluate[{x[t], velocity, acceleration, 
      jerk, snap, crackle, pop}], {t, 0, 3}, Exclusions -> None, 
    PlotLegends -> {"position", "velocity", "acceleration", "jerk", "snap", 
      "crackle", "pop"}, PlotRange -> All]], $Failed], 
 EComment["The fundamental theorem of calculus:"], 
 ESameTestBROKEN[D[Integrate[f[t], {t, 0, x}], x], f[x]], 
 EComment["Differentiation inside of \
RefLink[Integrate,paclet:ref/Integrate]:"], 
 ESameTestBROKEN[HoldComplete[D[Integrate[f[a, t], t], a]], $Failed], 
 EComment["Compute the derivative using the definition:"], 
 ESameTest[D[x^2, x], 2*x], ESameTest[Limit[((x + h)^2 - x^2)/h, h -> 0], 
  2*x], EComment[
  "Results may not immediately be given in the simplest possible form:"], 
 ESameTest[D[Sin[x]^10, {x, 4}], 5040*Cos[x]^4*Sin[x]^6 - 
   4680*Cos[x]^2*Sin[x]^8 + 280*Sin[x]^10], ESameTestBROKEN[FullSimplify[%], 
  10*(141 + 238*Cos[2*x] + 125*Cos[4*x])*Sin[x]^6], 
 EComment["Functions given in different forms can yield the same \
derivatives:"], ESameTest[Simplify[D[ArcTan[x], x]], 1/(1 + x^2)], 
 ESameTest[Simplify[D[-ArcTan[1/x], x]], 1/(1 + x^2)]]
