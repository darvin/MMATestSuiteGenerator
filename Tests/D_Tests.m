(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Derivative with respect to x:"], 
 TapTestSame[D[x^n, x], n*x^(-1 + n)], 
 TapComment["Fourth derivative with respect to x:"], 
 TapTestSame[D[Sin[x]^10, {x, 4}], 5040*Cos[x]^4*Sin[x]^6 - 
   4680*Cos[x]^2*Sin[x]^8 + 280*Sin[x]^10], 
 TapComment["Derivative with respect to x and y:"], 
 TapTestSame[D[Sin[x*y]/(x^2 + y^2), x, y], 
  -((2*x^2*Cos[x*y])/(x^2 + y^2)^2) - (2*y^2*Cos[x*y])/(x^2 + y^2)^2 + 
   Cos[x*y]/(x^2 + y^2) + (8*x*y*Sin[x*y])/(x^2 + y^2)^3 - 
   (x*y*Sin[x*y])/(x^2 + y^2)], 
 TapComment["Derivative involving a symbolic function f:"], 
 TapTestSameBROKEN[D[x*f[x]*Derivative[1][f][x], x], 
  f[x]*(f^\[Prime])[x] + x*(f^\[Prime])[x]^2 + 
   x*f[x]*(f^\[Prime]\[Prime])[x]], 
 TapComment["Vector derivative (gradient vector):"], 
 TapTestSame[D[x^2*Sin[y], {{x, y}}], {2*x*Sin[y], x^2*Cos[y]}], 
 TapComment["Second-order derivative tensor:"], 
 TapTestSame[D[{Sin[y], Sin[x] + Cos[y]}, {{x, y}, 2}], 
  {{{0, 0}, {0, -Sin[y]}}, {{-Sin[x], 0}, {0, -Cos[y]}}}], 
 TapComment["Evaluate derivatives numerically:"], 
 TapTestSameBROKEN[N[Derivative[1][Zeta][2]], -0.937548], 
 TapComment["Enter \\[PartialD] using Esc\\[ThinSpace]pd\\[ThinSpace]Esc, and \
subscripts using Control+_:"], TapTestSameBROKEN[$Failed, 
  HoldComplete[-((2*x)/(1 + x^2)^2)]], 
 TapComment["Polynomial and rational functions:"], 
 TapTestSame[D[a*x^4 + b*x^3 + c, x], 3*b*x^2 + 4*a*x^3], 
 TapTestSame[Together[D[(x - 7)/(2*x^2 + 3*x + 11), x]], 
  -((2*(-16 - 14*x + x^2))/(11 + 3*x + 2*x^2)^2)], 
 TapComment["Algebraic functions:"], TapTestSame[D[Sqrt[1 + x^3], x], 
  (3*x^2)/(2*Sqrt[1 + x^3])], TapTestSame[
  Together[D[(1 + x^(3/5))^(1/2)/(3*x + 1)^5, x]], 
  -((3*(-1 + 50*x^(2/5) + 47*x))/(10*Sqrt[1 + x^(3/5)]*x^(2/5)*
     (1 + 3*x)^6))], TapComment[
  "Trigonometric and inverse trigonometric functions:"], 
 TapTestSame[D[Sin[x]*Cos[x + y], x, y], (-Cos[x + y])*Sin[x] - 
   Cos[x]*Sin[x + y]], TapTestSame[D[ArcTan[x], x], 1/(1 + x^2)], 
 TapComment["Exponential and logarithmic functions:"], 
 TapTestSame[Together[D[(2*x + 5)*E^x^2, x]], 2*E^x^2*(1 + 5*x + 2*x^2)], 
 TapTestSame[Together[D[Log[(x + 1)/(x - 5)], x]], -(6/((-5 + x)*(1 + x)))], 
 TapTestSame[Together[D[x*E^x^x^x, x]], 
  E^x^x^x*(1 + x^(x + x^x) + x^(1 + x + x^x)*Log[x] + 
    x^(1 + x + x^x)*Log[x]^2)], TapComment["Hyperbolic functions:"], 
 TapTestSame[D[Sinh[x^2], x], 2*x*Cosh[x^2]], 
 TapTestSame[D[ArcCoth[x], {x, 2}], (2*x)/(1 - x^2)^2], 
 TapComment["The logarithmic derivative of RefLink[Gamma,paclet:ref/Gamma] is \
the RefLink[PolyGamma,paclet:ref/PolyGamma] function:"], 
 TapTestSame[D[Log[Gamma[x]], x], PolyGamma[0, x]], 
 TapComment["Derivatives of Airy functions are given in terms of \
RefLink[AiryAiPrime,paclet:ref/AiryAiPrime] and \
RefLink[AiryBiPrime,paclet:ref/AiryBiPrime]:"], 
 TapTestSame[D[AiryAi[x], {x, 7}], 9*x^2*AiryAi[x] + 10*AiryAiPrime[x] + 
   x^3*AiryAiPrime[x]], TapTestSame[D[(x + 1)*AiryBi[Sin[x]], x], 
  AiryBi[Sin[x]] + (1 + x)*AiryBiPrime[Sin[x]]*Cos[x]], 
 TapComment["The derivative of RefLink[Zeta,paclet:ref/Zeta] has a closed \
form expression at the origin:"], TapTestSameBROKEN[der = D[Zeta[x], x], 
  (Zeta^\[Prime])[x]], TapTestSame[der /. x -> 0, (-(1/2))*Log[2*Pi]], 
 TapTestSameBROKEN[(Zeta^\[Prime])[0], (-(1/2))*Log[2*Pi]], 
 TapComment["Special functions with elementary derivatives:"], 
 TapTestSame[D[EllipticF[x, m], x], 1/Sqrt[1 - m*Sin[x]^2]], 
 TapTestSame[D[Erf[x^2], x], (4*x)/E^x^4/Sqrt[Pi]], 
 TapComment["Special functions with derivatives expressed in terms of the \
same functions:"], TapTestSame[D[BesselJ[n, x], x], 
  (1/2)*(BesselJ[-1 + n, x] - BesselJ[1 + n, x])], 
 TapTestSame[D[GegenbauerC[n, m, x], x], 2*m*GegenbauerC[-1 + n, 1 + m, x]], 
 TapTestSame[D[Hypergeometric2F1[a, b, c, x], x], 
  (a*b*Hypergeometric2F1[1 + a, 1 + b, 1 + c, x])/c], 
 TapComment["Derivative of RefLink[JacobiSN,paclet:ref/JacobiSN]:"], 
 TapTestSame[D[JacobiSN[x, m]^2, x], 2*JacobiCN[x, m]*JacobiDN[x, m]*
   JacobiSN[x, m]], TapComment["Derivative of a piecewise function:"], 
 TapTestSameBROKEN[D[Max[x, x^2], x], Inequality[Piecewise[2]*x*x, Less, 
   0*1*0, Less, x, Less, 1*2*x*x, Greater, 1*Indeterminate*True]], 
 TapComment["Distributional derivatives of expressions involving the \
RefLink[HeavisideTheta,paclet:ref/HeavisideTheta] function:"], 
 TapTestSame[D[HeavisideTheta[x], x], DiracDelta[x]], 
 TapTestSame[D[x*HeavisideTheta[x - 2], x], x*DiracDelta[-2 + x] + 
   HeavisideTheta[-2 + x]], TapTestSameBROKEN[
  Solve[D[eqn, x], Derivative[1][y][x]], 
  {{(y^\[Prime])[x] -> (2*x)/(3 + 2*y[x])}}], 
 TapTestSameBROKEN[HoldComplete[Solve[D[eqn, y], D[z[x, y], y]]], $Failed], 
 TapComment["Gradient of a scalar function:"], 
 TapTestSame[vars = Array[Subscript[x, #1] & , 5]; 
   f = (#1 . #1 & )[Differences[vars]], 
  (-Subscript[x, 1] + Subscript[x, 2])^2 + 
   (-Subscript[x, 2] + Subscript[x, 3])^2 + 
   (-Subscript[x, 3] + Subscript[x, 4])^2 + 
   (-Subscript[x, 4] + Subscript[x, 5])^2], TapTestSame[D[f, {vars}], 
  {-2*(-Subscript[x, 1] + Subscript[x, 2]), 
   2*(-Subscript[x, 1] + Subscript[x, 2]) - 
    2*(-Subscript[x, 2] + Subscript[x, 3]), 
   2*(-Subscript[x, 2] + Subscript[x, 3]) - 
    2*(-Subscript[x, 3] + Subscript[x, 4]), 
   2*(-Subscript[x, 3] + Subscript[x, 4]) - 
    2*(-Subscript[x, 4] + Subscript[x, 5]), 
   2*(-Subscript[x, 4] + Subscript[x, 5])}], TapComment["Hessian matrix:"], 
 TapTestSameBROKEN[MatrixForm[D[f, {vars, 2}]], 
  2 - 2*0*0*0 - 2*4 - 2*0*0*0 - 2*4 - 2*0*0*0 - 2*4 - 2*0*0*0 - 2*2], 
 TapComment["Jacobian of a vector valued function:"], 
 TapTestSame[vars = Array[Subscript[x, #1] & , 5]; 
   f = Drop[vars, 1]*Differences[vars], 
  {Subscript[x, 2]*(-Subscript[x, 1] + Subscript[x, 2]), 
   Subscript[x, 3]*(-Subscript[x, 2] + Subscript[x, 3]), 
   Subscript[x, 4]*(-Subscript[x, 3] + Subscript[x, 4]), 
   Subscript[x, 5]*(-Subscript[x, 4] + Subscript[x, 5])}], 
 TapTestSameBROKEN[MatrixForm[D[f, {vars}]], 
  -Subscript[x, 2] - Subscript[x, 1] + 2*Subscript[x, 2]*0*0*0*0 - 
   Subscript[x, 3] - Subscript[x, 2] + 2*Subscript[x, 3]*0*0*0*0 - 
   Subscript[x, 4] - Subscript[x, 3] + 2*Subscript[x, 4]*0*0*0*0 - 
   Subscript[x, 5] - Subscript[x, 4] + 2*Subscript[x, 5]], 
 TapComment["Second-order derivative tensor:"], 
 TapTestSame[D[f, {vars, 2}], {{{0, -1, 0, 0, 0}, {-1, 2, 0, 0, 0}, 
    {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}}, 
   {{0, 0, 0, 0, 0}, {0, 0, -1, 0, 0}, {0, -1, 2, 0, 0}, {0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0}}, {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, -1, 0}, 
    {0, 0, -1, 2, 0}, {0, 0, 0, 0, 0}}, {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0}, {0, 0, 0, 0, -1}, {0, 0, 0, -1, 2}}}], 
 TapTestSameBROKEN[HoldComplete[D[f, {SparseArray[vars], 2}]], $Failed], 
 TapComment["The gradient can also be computed as a \
RefLink[SparseArray,paclet:ref/SparseArray], but in this case it is \
effectively dense:"], TapTestSameBROKEN[
  HoldComplete[D[f, {SparseArray[vars]}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[D[f, {SparseArray[vars]}]], $Failed], 
 TapComment["Differentiate with respect to different formal variables: "], 
 TapTestSameBROKEN[D[Sin[f[x]] + Derivative[1][Derivative[1][f]][x], x], 
  Cos[f[x]]*(f^\[Prime])[x] + (f^3)[x]], 
 TapTestSame[D[Sin[f[x]] + Derivative[1][Derivative[1][f]][x], f[x]], 
  Cos[f[x]]], TapTestSame[D[Sin[f[x]] + Derivative[1][Derivative[1][f]][x], 
   Derivative[1][Derivative[1][f]][x]], 1], 
 TapComment["Differentiate with y considered as depending on x:"], 
 TapTestSame[D[x^2 + y^2 == 1, x, NonConstants -> y], 
  2*x + 2*y*D[y, x, NonConstants -> {y}] == 0], 
 TapComment[
  "Solve for the derivative of y to effect implicit differentiation:"], 
 TapTestSameBROKEN[Solve[%, D[y, x, NonConstants -> {y}]], 
  {{D[y, x, NonConstants -> {y}] -> -(x/y)}}], 
 TapTestSameBROKEN[HoldComplete[Plot[f[x], {x, -4, 2}]], $Failed], 
 TapTestSameBROKEN[Solve[D[f[x], x] == 0, x], {{x -> -1 - Sqrt[2]}, 
   {x -> -1 + Sqrt[2]}}], TapComment[
  "Perform the change of variable t=x^2 in an integral:"], 
 TapTestSame[Integrate[x*Exp[x^2], {x, 0, 2}], (1/2)*(-1 + E^4)], 
 TapTestSame[Integrate[t^(1/2)*Exp[t]*D[t^(1/2), t], {t, 0, 4}], 
  (1/2)*(-1 + E^4)], TapTestSameBROKEN[
  HoldComplete[ParametricPlot3D[Helix[1, 1/11, t], {t, 0, 30}, 
    Boxed -> False, Axes -> False]], $Failed], 
 TapTestSameBROKEN[FullSimplify[Curvature[Helix[r, c, t], t], 
   0 < t < Pi/2 && r > 0 && c > 0], r/(c^2 + r^2)], 
 TapComment["Compute the coefficients of a power series:"], 
 TapTestSame[Table[D[Exp[x^3]*Sin[x], {x, n}]/n!, {n, 0, 8}] /. {x -> 0}, 
  {0, 1, 0, -(1/6), 1, 1/120, -(1/6), 2519/5040, 1/120}], 
 TapTestSame[Series[Exp[x^3]*Sin[x], {x, 0, 8}], 
  x - x^3/6 + x^4 + x^5/120 - x^6/6 + (2519*x^7)/5040 + x^8/120 + O[x]^9], 
 TapTestSameBROKEN[Derivative[1][y][x] == 
   Apart[Derivative[1][y][x] /. Solve[D[eqn, x], Derivative[1][y][x]][[1]]], 
  (y^\[Prime])[x] == -((x*y[x]^2)/(-1 + x)) + y[x]^3], 
 TapTestSameBROKEN[HoldComplete[
   Plot[Evaluate[{x[t], velocity, acceleration, jerk, snap, crackle, pop}], 
    {t, 0, 3}, Exclusions -> None, PlotLegends -> {"position", "velocity", 
      "acceleration", "jerk", "snap", "crackle", "pop"}, PlotRange -> All]], 
  $Failed], TapComment["The fundamental theorem of calculus:"], 
 TapTestSameBROKEN[D[Integrate[f[t], {t, 0, x}], x], f[x]], 
 TapComment[
  "Differentiation inside of RefLink[Integrate,paclet:ref/Integrate]:"], 
 TapTestSameBROKEN[HoldComplete[D[Integrate[f[a, t], t], a]], $Failed], 
 TapComment["Compute the derivative using the definition:"], 
 TapTestSame[D[x^2, x], 2*x], TapTestSame[Limit[((x + h)^2 - x^2)/h, h -> 0], 
  2*x], TapComment[
  "Results may not immediately be given in the simplest possible form:"], 
 TapTestSame[D[Sin[x]^10, {x, 4}], 5040*Cos[x]^4*Sin[x]^6 - 
   4680*Cos[x]^2*Sin[x]^8 + 280*Sin[x]^10], 
 TapTestSameBROKEN[FullSimplify[%], 10*(141 + 238*Cos[2*x] + 125*Cos[4*x])*
   Sin[x]^6], TapComment[
  "Functions given in different forms can yield the same derivatives:"], 
 TapTestSame[Simplify[D[ArcTan[x], x]], 1/(1 + x^2)], 
 TapTestSame[Simplify[D[-ArcTan[1/x], x]], 1/(1 + x^2)]]
