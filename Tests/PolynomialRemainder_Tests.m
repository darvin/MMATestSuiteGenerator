(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Find the remainder after dividing one polynomial by another:"], 
 TapTestSame[PolynomialRemainder[x^2, x + a, x], a^2], 
 TapComment["The resulting polynomial will have coefficients that are \
rational expressions of input coefficients:"], 
 TapTestSame[PolynomialRemainder[x^2 + x + 1, 2*x + 1, x], 3/4], 
 TapTestSame[PolynomialRemainder[x^2 + b*x + 1, a*x + 1, x], 
  1 + 1/a^2 - b/a], TapTestSame[PolynomialRemainder[x^2 + x + 1, Pi*x + 1, 
   x], 1 + 1/Pi^2 - 1/Pi], TapComment["RefLink[PolynomialRemainder,paclet:ref\
/PolynomialRemainder] also works for rational functions:"], 
 TapTestSame[PolynomialRemainder[(x + 1)/(x + 2), (x + 1)/(x + 3), x], 0], 
 TapComment["Use a prime modulus:"], 
 TapTestSame[PolynomialRemainder[x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 2], 
  0], TapTestSame[PolynomialRemainder[x^2 + 4*x + 1, 2*x + 1, x, 
   Modulus -> 5], 3], TapComment[
  "Euclid's algorithm for the greatest common divisor:"], 
 TapTestSame[Euclid[f_, g_, x_] /; Exponent[f, x] < Exponent[g, x] := 
    Euclid[g, f, x]; Euclid[f_, (g_)?NumericQ, x_] := 
    If[PossibleZeroQ[g], f, 1]; Euclid[f_, g_, x_] := 
    Euclid[g, PolynomialRemainder[f, g, x], x]; Euclid[(x + 1)*(x + 2), 
    (x + 2)*(x + 3), x], -4 - 2*x], 
 TapComment["Divide by the leading coefficient:"], 
 TapTestSameBROKEN[Expand[%/Coefficient[%, x, 1]], 2 + x], 
 TapTestSame[PolynomialGCD[(x + 1)*(x + 2), (x + 2)*(x + 3)], 2 + x], 
 TapComment["For a polynomial f, f==qg+r, where q is given by \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient]:"], 
 TapTestSameBROKEN[{f, g} = {x^2 + 4*x + 1, x + 2} ;; q = 
    PolynomialQuotient[f, g, x], 2 + x], TapTestSameBROKEN[
  r = PolynomialRemainder[f, g, x], -3], 
 TapComment["Use RefLink[Expand,paclet:ref/Expand] to verify identity:"], 
 TapTestSameBROKEN[Expand[q*g + r] == f, True], 
 TapComment["To get both quotient and remainder use \
RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientRemainder]:"]\
, TapTestSameBROKEN[PolynomialQuotientRemainder[f, g, x], {2 + x, -3}], 
 TapComment["RefLink[PolynomialReduce,paclet:ref/PolynomialReduce] \
generalizes RefLink[PolynomialRemainder,paclet:ref/PolynomialRemainder] for \
multivariate polynomials:"], TapTestSame[PolynomialReduce[x^2 + 4*x + 1, 
   {x + 2}, {x}], {{2 + x}, -3}], TapTestSame[PolynomialRemainder[x^2, x + a, 
   x], a^2], TapTestSame[PolynomialMod[x^2, x + a], x^2], 
 TapComment["The variable assumed for the polynomials matters:"], 
 TapTestSame[{PolynomialRemainder[x + y, x - y, x], 
   PolynomialRemainder[x + y, x - y, y]}, {2*y, 2*x}]]
