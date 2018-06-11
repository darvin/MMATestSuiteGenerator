(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "The quotient of x^2 by x+a, with the remainder dropped:"], 
 TapTestSame[PolynomialQuotient[x^2, x + a, x], -a + x], 
 TapTestSameBROKEN[Expand[%*(x + a)], -a^2 + x^2], 
 TapComment["The resulting polynomial will have coefficients that are \
rational expressions of input coefficients:"], 
 TapTestSame[PolynomialQuotient[x^2 + x + 1, 2*x + 1, x], 1/4 + x/2], 
 TapTestSame[PolynomialQuotient[x^2 + b*x + 1, a*x + 1, x], 
  -(1/a^2) + b/a + x/a], TapTestSame[PolynomialQuotient[x^2 + x + 1, 
   Pi*x + 1, x], -(1/Pi^2) + 1/Pi + x/Pi], TapComment["RefLink[PolynomialQuot\
ient,paclet:ref/PolynomialQuotient] also works for rational functions:"], 
 TapTestSame[PolynomialQuotient[(x + 1)/(x + 2), (x + 1)/(x + 3), x], 
  (3 + x)/(2 + x)], TapComment["Use a prime modulus:"], 
 TapTestSame[PolynomialQuotient[x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 2], 
  1 + x^2], TapTestSame[PolynomialQuotient[x^2 + 4*x + 1, 2*x + 1, x, 
   Modulus -> 3], 1 + 2*x], TapComment["For a polynomial f, f==gq+r, where r \
is given by RefLink[PolynomialRemainder,paclet:ref/PolynomialRemainder]:"], 
 TapTestSameBROKEN[{f, g} = {x^2 + 4*x + 1, x + 2} ;; q = 
    PolynomialQuotient[f, g, x], 2 + x], TapTestSameBROKEN[
  r = PolynomialRemainder[f, g, x], -3], 
 TapComment["Use RefLink[Expand,paclet:ref/Expand] to verify identity:"], 
 TapTestSameBROKEN[Expand[q*g + r] == f, True], 
 TapComment["To get both quotient and remainder use \
RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientRemainder]:"]\
, TapTestSameBROKEN[PolynomialQuotientRemainder[f, g, x], {2 + x, -3}], 
 TapComment["RefLink[PolynomialReduce,paclet:ref/PolynomialReduce] \
generalizes RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] for \
multivariate polynomials:"], TapTestSame[PolynomialReduce[x^2 + 4*x + 1, 
   {x + 2}, {x}], {{2 + x}, -3}], TapComment["Use \
RefLink[PolynomialGCD,paclet:ref/PolynomialGCD] to find a common divisor:"], 
 TapTestSameBROKEN[{f, g} = {x^2 + 3*x + 2, x^2 + 5*x + 6} ;; h = 
    PolynomialGCD[f, g], 2 + x], TapComment["Use \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] to see the \
resulting factorization:"], TapTestSameBROKEN[
  f == PolynomialQuotient[f, h, x]*h, 2 + 3*x + x^2 == (1 + x)*(2 + x)], 
 TapTestSameBROKEN[g == PolynomialQuotient[g, h, x]*h, 
  6 + 5*x + x^2 == (2 + x)*(3 + x)], 
 TapComment[
  "For rational functions common divisors are not automatically canceled:"], 
 TapTestSameBROKEN[f/g, (2 + 3*x + x^2)/(6 + 5*x + x^2)], 
 TapComment["RefLink[Cancel,paclet:ref/Cancel] effectively uses \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] to cancel common \
divisors:"], TapTestSameBROKEN[Cancel[%], (1 + x)/(3 + x)], 
 TapComment["The RefLink[Cyclotomic,paclet:ref/Cyclotomic] polynomials are \
defined as quotients:"], TapTestSame[PolynomialQuotient[x^5 - 1, x - 1, x], 
  1 + x + x^2 + x^3 + x^4], TapTestSame[Cyclotomic[5, x], 
  1 + x + x^2 + x^3 + x^4], 
 TapComment["The result depends on what is assumed to be a variable:"], 
 TapTestSame[{PolynomialQuotient[x^3 + y^2, x - y, x], 
   PolynomialQuotient[x^3 + y^2, x - y, y]}, {x^2 + x*y + y^2, -x - y}], 
 TapComment["The result from \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] depends on \
recognizing zeros:"], TapTestSame[PolynomialQuotient[x^3 + x + 1, 
   zero*x^2 + x + 1, x], -(1/zero^2) + x/zero], 
 TapTestSame[PolynomialQuotient[x^3 + x + 1, x + 1, x], 2 - x + x^2], 
 TapComment["This is a hidden zero:"], TapTestSameBROKEN[
  zero = Sin[Sqrt[2] + Sqrt[3]] - Sin[Sqrt[5 + 2*Sqrt[6]]] ;; 
    FullSimplify[zero], 0], 
 TapComment["The result is as if the hidden zero was not zero:"], 
 TapTestSameBROKEN[N[PolynomialQuotient[x^3 + x + 1, zero*x^2 + x + 1, x]], 
  -5.0706*10^30 - 2.2518*10^15*x]]
