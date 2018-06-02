(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The greatest common divisor of polynomials:"], 
 TapTestSame[PolynomialGCD[(1 + x)^2*(2 + x)*(4 + x), 
   (1 + x)*(2 + x)*(3 + x)], (1 + x)*(2 + x)], 
 TapComment["The GCD of univariate polynomials:"], 
 TapTestSame[PolynomialGCD[x^4 - 4, x^4 + 4*x^2 + 4], 2 + x^2], 
 TapComment["The GCD of multivariate polynomials:"], 
 TapTestSame[PolynomialGCD[x^2 + 2*x*y + y^2, x^3 + y^3], x + y], 
 TapComment["The GCD of more than two polynomials:"], 
 TapTestSame[PolynomialGCD[x^2 - 1, x^3 - 1, x^4 - 1, x^5 - 1, x^6 - 1, 
   x^7 - 1], -1 + x], TapComment["The GCD of rational functions:"], 
 TapTestSame[PolynomialGCD[(x - 1)*((x - 2)/((x - 3)*(x - 4))), 
   (x - 1)*((x - 5)/((x - 3)*(x - 6)))], 
  (-1 + x)/((-6 + x)*(-4 + x)*(-3 + x))], 
 TapComment[
  "By default, algebraic numbers are treated as independent variables:"], 
 TapTestSame[PolynomialGCD[x^2 - 2, x - Sqrt[2]], 1], 
 TapComment["With \
RefLink[Extension,paclet:ref/Extension]->RefLink[Automatic,paclet:ref/Automat\
ic], RefLink[PolynomialGCD,paclet:ref/PolynomialGCD] detects algebraically \
dependent coefficients:"], TapTestSame[PolynomialGCD[x^2 - 2, x - Sqrt[2], 
   Extension -> Automatic], Sqrt[2] - x], 
 TapComment["Compute the GCD over the integers modulo 2:"], 
 TapTestSame[PolynomialGCD[(x + 1)^3, x^3 + x, Modulus -> 2], (1 + x)^2], 
 TapComment["By default, RefLink[PolynomialGCD,paclet:ref/PolynomialGCD] \
treats trigonometric functions as independent variables:"], 
 TapTestSame[PolynomialGCD[Sin[2*x], 1 - Cos[x]^2], 1], 
 TapComment["With \
RefLink[Trig,paclet:ref/Trig]->RefLink[True,paclet:ref/True], \
RefLink[PolynomialGCD,paclet:ref/PolynomialGCD] recognizes dependencies \
between trigonometric functions:"], 
 TapTestSame[PolynomialGCD[Sin[2*x], 1 - Cos[x]^2, Trig -> True], Sin[x]], 
 TapComment["Find common roots of univariate polynomials:"], 
 TapTestSame[f = x^7 - 2*x^5 - x^4 + 5*x^3 + 4*x^2 - 12*x + 5; 
   g = x^7 - 9*x^5 + x^4 + 17*x^3 - 7*x^2 - 6*x + 3; d = PolynomialGCD[f, g], 
  1 - 2*x + x^3], TapTestSame[x /. Solve[d == 0, x], 
  {1, (1/2)*(-1 - Sqrt[5]), (1/2)*(-1 + Sqrt[5])}], 
 TapTestSame[Intersection[x /. Solve[f == 0, x], x /. Solve[g == 0, x]], 
  {1, (1/2)*(-1 - Sqrt[5]), (1/2)*(-1 + Sqrt[5])}], 
 TapComment["Find multiple roots of univariate polynomials:"], 
 TapTestSame[f = x^9 - 7*x^8 + 19*x^7 - 27*x^6 + 35*x^5 - 77*x^4 + 145*x^3 - 
     157*x^2 + 88*x - 20; d = PolynomialGCD[f, D[f, x]], 
  -2 + 5*x - 4*x^2 + x^3], TapTestSame[x /. Solve[d == 0, x], {1, 1, 2}], 
 TapTestSameBROKEN[N[x /. Solve[f == 0, x]], {1., 1., 1., 2., 2., 
   -1.06876 - 1.26889*I, -1.06876 + 1.26889*I, 1.06876 - 0.821224*I, 
   1.06876 + 0.821224*I}], TapComment["The GCD of polynomials divides the \
polynomials; use RefLink[PolynomialMod,paclet:ref/PolynomialMod] to prove \
it:"], TapTestSame[f = x^7 - 2*x^5 - x^4 + 5*x^3 + 4*x^2 - 12*x + 5; 
   g = x^7 - 9*x^5 + x^4 + 17*x^3 - 7*x^2 - 6*x + 3; d = PolynomialGCD[f, g], 
  1 - 2*x + x^3], TapTestSame[PolynomialMod[{f, g}, d], {0, 0}], 
 TapComment["RefLink[Cancel,paclet:ref/Cancel] divides the numerator and the \
denominator of a rational function by their GCD:"], 
 TapTestSame[Cancel[f/g], (5 - 2*x + x^4)/(3 - 7*x^2 + x^4)], 
 TapComment["RefLink[PolynomialLCM,paclet:ref/PolynomialLCM] finds the least \
common multiple of polynomials:"], TapTestSame[PolynomialLCM[f, g], 
  (5 - 2*x + x^4)*(3 - 6*x - 7*x^2 + 17*x^3 + x^4 - 9*x^5 + x^7)], 
 TapTestSameBROKEN[Together[% - (f*g)/d], 0], TapComment["RefLink[Resultant,p\
aclet:ref/Resultant] of two polynomials is zero if and only if their GCD has \
a nonzero degree:"], TapTestSame[Resultant[x^2 - 4, x^2 + 4*x + 4, x], 0], 
 TapTestSame[PolynomialGCD[x^2 - 4, x^2 + 4*x + 4], 2 + x], 
 TapTestSame[Resultant[3*x + 9, 6*x^3 - 3*x + 12, x], -3807], 
 TapTestSame[PolynomialGCD[3*x + 9, 6*x^3 - 3*x + 12], 3], 
 TapTestSameBROKEN[Discriminant[f, x], 0], 
 TapTestSameBROKEN[PolynomialGCD[f, D[f, x]], -1 + x], 
 TapTestSameBROKEN[Discriminant[g, x], 5], 
 TapTestSame[PolynomialGCD[g, D[g, x], x], 1], 
 TapComment["RefLink[Discriminant,paclet:ref/Discriminant] of a polynomial f \
is zero if and only if the polynomial has multiple roots:"], 
 TapTestSameBROKEN[x /. Solve[f == 0, x], {-2, 1, 1}], 
 TapTestSameBROKEN[x /. Solve[g == 0, x], {1, (1/2)*(-1 - Sqrt[5]), 
   (1/2)*(-1 + Sqrt[5])}]]
