(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[I,paclet:ref/I] can be entered as \
Esc\\[ThinSpace]ii\\[ThinSpace]Esc (for \"imaginary i\"):"], 
 TapTestSame[I, I], TapComment[
  "Generate from square roots of negative real numbers:"], 
 TapTestSame[Sqrt[-16], 4*I], 
 TapComment[
  "Use RefLink[I,paclet:ref/I] in exact and approximate calculations:"], 
 TapTestSame[(3 + I)^2/(5 - I), 17/13 + (19*I)/13], 
 TapTestSameBROKEN[Tan[3.5 + I], 0.145477 + 0.803096*I], 
 TapComment["Built-in mathematical functions work with complex numbers:"], 
 TapTestSameBROKEN[Log[4.5 + 2*I], 1.59421 + 0.418224*I], 
 TapTestSame[GCD[3 - I, 66 + 2*I], 1 + I], 
 TapComment["Extract imaginary parts:"], TapTestSame[Im[(E + I*Pi)^3], 
  3*E^2*Pi - Pi^3], TapComment["Use Esc\\[ThinSpace]jj\\[ThinSpace]Esc to \
enter the engineering notation \\[ImaginaryJ] for RefLink[I,paclet:ref/I]:"], 
 TapTestSame[I, I], TapComment["Use as a direction in infinite quantities:"], 
 TapTestSame[DirectedInfinity[I], I*Infinity], 
 TapTestSameBROKEN[Exp[I*%], 0], 
 TapComment["Use as a direction in RefLink[Limit,paclet:ref/Limit]:"], 
 TapTestSame[Limit[Exp[I/x], x -> 0, Direction -> I], 0], 
 TapComment["Use as a generator of extension fields:"], 
 TapTestSame[Factor[x^2 + 1], 1 + x^2], 
 TapTestSame[Factor[x^2 + 1, Extension -> {I}], (-I + x)*(I + x)], 
 TapComment["Factor integers over the Gaussians:"], 
 TapTestSame[FactorInteger[Prime[100], GaussianIntegers -> True], 
  {{-I, 1}, {10 + 21*I, 1}, {21 + 10*I, 1}}], 
 TapComment["Use as an expansion point for series:"], 
 TapTestSameBROKEN[Series[ArcTan[z], {z, I, 2}], 
  Pi*Floor[(Pi/2 - Arg[-I + z])/(2*Pi)] + 
   ((1/4)*(Pi + 2*I*Log[2] - 2*I*Log[-I + z]) + (z - I)/4 + 
    (1/16)*I*(z - I)^2 + O[z - I]^3)], 
 TapComment["Convert a complex number from polar to rectangular form:"], 
 TapTestSameBROKEN[2.5*Exp[I*30*Degree], 2.16506 + 1.25*I], 
 TapComment[
  "Flow around a cylinder as the real part of a complex-valued function:"], 
 TapTestSameBROKEN[HoldComplete[ContourPlot[Im[(#1 + 1/#1 & )[I*x - y]], 
    {x, -3, 3}, {y, -3, 3}, Contours -> 25, Epilog -> Disk[{0, 0}, 1]]], 
  $Failed], TapComment["RefLink[I,paclet:ref/I] is represented as a complex \
number with vanishing real part:"], TapTestSameBROKEN[FullForm[I], 
  Complex[0, 1]], TapComment["RefLink[I,paclet:ref/I] is an exact number:"], 
 TapTestSame[ExactNumberQ[I], True], TapComment["Use \
RefLink[ComplexExpand,paclet:ref/ComplexExpand] to extract real and imaginary \
parts:"], TapTestSame[ComplexExpand[I^I^I], Cos[((1/2)*Pi)/E^(Pi/2)] + 
   I*Sin[((1/2)*Pi)/E^(Pi/2)]], TapComment["Use \
RefLink[ExpToTrig,paclet:ref/ExpToTrig] to convert exponentials containing \
RefLink[I,paclet:ref/I] into trigonometric form:"], 
 TapTestSame[ExpToTrig[Exp[I*x]], Cos[x] + I*Sin[x]], 
 TapComment["Simplify expressions containing RefLink[I,paclet:ref/I]:"], 
 TapTestSame[{x*Im[Exp[I*(Pi/3)]*x], Im[2 + 3*I*x]}, 
  {x*Im[E^((I*Pi)/3)*x], 3*Re[x]}], TapTestSameBROKEN[Simplify[%, x > 3], 
  {(Sqrt[3]*x^2)/2, 3*x}], 
 TapComment["RefLink[I,paclet:ref/I] is an algebraic number:"], 
 TapTestSame[Element[I, Algebraics], True], TapComment["Trigonometric \
functions with purely imaginary arguments evaluate to simpler forms:"], 
 TapTestSame[Cos[I*x], Cosh[x]], TapTestSame[Sech[I*x], Sec[x]], 
 TapComment[
  "Obtain RefLink[I,paclet:ref/I] in solutions of polynomial equations:"], 
 TapTestSame[Solve[x^2 + 1 == 0, x], {{x -> -I}, {x -> I}}], 
 TapComment[
  "Roots of quadratic polynomials can evaluate to complex numbers:"], 
 TapTestSame[Root[#1^2 + 1 & , 2], I], 
 TapComment[
  "Use RefLink[Chop,paclet:ref/Chop] to remove small imaginary parts:"], 
 TapTestSame[N[2 + I/10^12], 2. + (1.*I)/10^12], 
 TapTestSameBROKEN[Chop[%], 2.], 
 TapComment["Use RefLink[I,paclet:ref/I] as limits of integration:"], 
 TapTestSame[Integrate[Abs[x], {x, -I, I}], I], 
 TapTestSameBROKEN[NIntegrate[Abs[x], {x, -I, I}], 0. + 1.*I], 
 TapComment["Sort numbers by increasing imaginary parts:"], 
 TapTestSame[SortBy[{3 - 2*I, 5 + 3*I, 2*I, -4, -6 + 6*I}, Im], 
  {3 - 2*I, -4, 2*I, 5 + 3*I, -6 + 6*I}], TapComment["Machine-precision \
evaluation of RefLink[I,paclet:ref/I] yields an approximate zero real part:"]\
, TapTestSame[N[I], 0. + 1.*I], 
 TapComment[
  "Arbitrary-precision evaluation yields an exact zero real part:"], 
 TapTestSame[N[I, 20], 1.`19.*I], 
 TapComment[
  "Real and imaginary parts of complex numbers can have different \
precisions:"], TapTestSame[1.64 + I, 1.64 + I], 
 TapComment["Arithmetic operations will typically mix them:"], 
 TapTestSameBROKEN[%^4, -7.90365 + 11.0838*I], 
 TapComment["The overall precision of a complex number depends on both real \
and imaginary parts:"], TapTestSame[SetPrecision[1, 10] + 
   I*SetPrecision[100, 20], 1. + 100.`19.*I], TapTestSameBROKEN[Precision[%], 
  12.], TapComment["Complex numbers are atomic objects and do not explicitly \
contain RefLink[I,paclet:ref/I]:"], TapTestSameBROKEN[FullForm[2 + I], 
  Complex[2, 1]], TapTestSame[MatchQ[2 + I, _ + I], False], 
 TapTestSame[MemberQ[2 + I, I], False], TapComment["Disguised purely real \
quantities that contain RefLink[I,paclet:ref/I] cannot be used in numerical \
comparisons:"], TapTestSame[ComplexExpand[I^I], E^(-Pi/2)], 
 TapTestSame[I^I < 1, I^I < 1], TapComment["Real roots of irreducible cubics \
still contain RefLink[I,paclet:ref/I] in their algebraic forms:"], 
 TapTestSame[Solve[-61 + 110*x - 60*x^2 + 10*x^3 == 0, x], 
  {{x -> 2 + ((1/5)*(9 + I*Sqrt[1119]))^(1/3)/6^(2/3) + 
      2^(2/3)/((3/5)*(9 + I*Sqrt[1119]))^(1/3)}, 
   {x -> 2 - ((1 + I*Sqrt[3])*((1/5)*(9 + I*Sqrt[1119]))^(1/3))/(2*6^(2/3)) - 
      (1 - I*Sqrt[3])/((6/5)*(9 + I*Sqrt[1119]))^(1/3)}, 
   {x -> 2 - ((1 - I*Sqrt[3])*((1/5)*(9 + I*Sqrt[1119]))^(1/3))/(2*6^(2/3)) - 
      (1 + I*Sqrt[3])/((6/5)*(9 + I*Sqrt[1119]))^(1/3)}}], 
 TapComment[
  "Machine-precision numerical evaluation gives a spurious imaginary part:"], 
 TapTestSameBROKEN[N[%], {{x -> 3.04668 - (8.32667*I)/10^17}, 
   {x -> 1.89897 + (1.11022*I)/10^16}, {x -> 1.05435 - (1.11022*I)/10^16}}], 
 TapComment[
  "Arbitrary-precision evaluation still leaves an imaginary part:"], 
 TapTestSameBROKEN[N[%%, 20], 
  {{x -> 3.0466805318046022612`19.483826917449353 + (0.*I)/10^20}, 
   {x -> 1.89896874211898918230000000001`19.278517816113027 + (0.*I)/10^20}, 
   {x -> 1.05435072607640855653`20.02298510144839 + (0.*I)/10^21}}], 
 TapComment["Use RefLink[Reduce,paclet:ref/Reduce] with an option to get \
explicitly real roots:"], TapTestSame[
  Reduce[-61 + 110*x - 60*x^2 + 10*x^3 == 0, x, Cubics -> False], 
  x == Root[-61 + 110*#1 - 60*#1^2 + 10*#1^3 & , 1] || 
   x == Root[-61 + 110*#1 - 60*#1^2 + 10*#1^3 & , 2] || 
   x == Root[-61 + 110*#1 - 60*#1^2 + 10*#1^3 & , 3]], 
 TapTestSameBROKEN[N[%], x == 1.05435 || x == 1.89897 || x == 3.04668], 
 TapComment["Finite imaginary quantities are absorbed by infinite real or \
complex quantities:"], TapTestSame[Infinity + I, Infinity], 
 TapTestSameBROKEN[Im[%], 0], 
 TapComment["RefLink[I,paclet:ref/I] cannot be used in intervals:"], 
 TapTestSame[IntervalMemberQ[Interval[{-I, I}], 0], False], 
 TapComment["The symbol RefLink[I,paclet:ref/I] needs to be evaluated to \
become a complex number:"], TapTestSame[NumberQ[Unevaluated[I]], False], 
 TapTestSame[Head[Unevaluated[I]], Symbol], 
 TapComment["Nested powers of RefLink[I,paclet:ref/I]:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot[({Re[#1], Im[#1]} & ) /@ 
     NestList[I^#1 & , N[I], 100]]], $Failed], 
 TapComment["Find the limit in closed form:"], 
 TapTestSame[Solve[I^w == w, w], {{w -> (2*I*ProductLog[-((I*Pi)/2)])/Pi}}], 
 TapTestSameBROKEN[N[%], {{w -> 0.438283 + 0.360592*I}}], 
 TapComment[
  "Generate all possible nestings of powers of RefLink[I,paclet:ref/I]:"], 
 TapTestSame[
  Union[Flatten[
    Nest[Flatten[(ReplaceList[#1, {a___, b_, c_, d___} :> {a, b^c, d}] & ) /@ 
        #1, 1] & , {{I, I, I, I, I, I, I}}, 5]]], 
  {-I, I, (-I)^(-I), (-I)^I, (-I)^I^I, (-I)^I^I^I, I^(-I), I^I, I^(-I)^I, 
   I^(-I)^I^I, I^I^(-I), I^I^I, I^I^(-I)^I, I^I^I^(-I), I^I^I^I, I^I^I^I^I, 
   I^I^I^I^I^I, I^I^(I^I)^I^I, I^I^(I^I^I)^I, I^(I^I)^I^I, I^(I^I)^I^I^I, 
   I^(I^I^I)^I, I^(I^I^I)^I^I, I^(I^I^I^I)^I, I^((I^I)^I^I)^I, 
   I^((I^I^I)^I)^I, ((-I)^I)^I^I, ((-I)^I^I)^I, (I^(-I))^I^I, (I^I)^(-I)^I, 
   (I^I)^I^(-I), (I^I)^I^I, (I^I)^I^I^I, (I^I)^I^I^I^I, (I^I)^(I^I)^I^I, 
   (I^I)^(I^I^I)^I, (I^(-I)^I)^I, (I^I^(-I))^I, (I^I^I)^(-I), (I^I^I)^I, 
   (I^I^I)^I^I, (I^I^I)^I^I^I, (I^I^I^I)^I, (I^I^I^I)^I^I, (I^I^I^I^I)^I, 
   (I^(I^I)^I^I)^I, (I^(I^I^I)^I)^I, ((I^I)^I^I)^I, ((I^I)^I^I)^I^I, 
   ((I^I)^I^I^I)^I, ((I^I^I)^I)^I, ((I^I^I)^I)^I^I, ((I^I^I)^I^I)^I, 
   ((I^I^I^I)^I)^I, (((I^I)^I^I)^I)^I, (((I^I^I)^I)^I)^I}], 
 TapComment["Plot the points in the complex plane:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot[({Re[#1], Im[#1]} & ) /@ N[%]]], 
  $Failed]]
