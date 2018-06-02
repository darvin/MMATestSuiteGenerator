(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "The quotient of x^2 by x+a, with the remainder dropped:"], 
 ESameTest[PolynomialQuotient[x^2, x + a, x], -a + x], 
 ESameTestBROKEN[Expand[%*(x + a)], -a^2 + x^2], 
 EComment["The resulting polynomial will have coefficients that are rational \
expressions of input coefficients:"], 
 ESameTest[PolynomialQuotient[x^2 + x + 1, 2*x + 1, x], 1/4 + x/2], 
 ESameTest[PolynomialQuotient[x^2 + b*x + 1, a*x + 1, x], 
  -(1/a^2) + b/a + x/a], ESameTest[PolynomialQuotient[x^2 + x + 1, Pi*x + 1, 
   x], -(1/Pi^2) + 1/Pi + x/Pi], EComment["RefLink[PolynomialQuotient,paclet:\
ref/PolynomialQuotient] also works for rational functions:"], 
 ESameTest[PolynomialQuotient[(x + 1)/(x + 2), (x + 1)/(x + 3), x], 
  (3 + x)/(2 + x)], EComment["Use a prime modulus:"], 
 ESameTest[PolynomialQuotient[x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 2], 
  1 + x^2], ESameTest[PolynomialQuotient[x^2 + 4*x + 1, 2*x + 1, x, 
   Modulus -> 3], 1 + 2*x], ESameTestBROKEN[q = PolynomialQuotient[f, g, x], 
  2 + x], ESameTestBROKEN[r = PolynomialRemainder[f, g, x], -3], 
 EComment["Use RefLink[Expand,paclet:ref/Expand] to verify identity:"], 
 ESameTest[Expand[q*g + r] == f, True], EComment["To get both quotient and \
remainder use \
RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientRemainder]:"]\
, ESameTestBROKEN[PolynomialQuotientRemainder[f, g, x], {2 + x, -3}], 
 EComment["RefLink[PolynomialReduce,paclet:ref/PolynomialReduce] generalizes \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] for multivariate \
polynomials:"], ESameTest[PolynomialReduce[x^2 + 4*x + 1, {x + 2}, {x}], 
  {{2 + x}, -3}], ESameTestBROKEN[h = PolynomialGCD[f, g], 2 + x], 
 EComment["Use RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] to \
see the resulting factorization:"], ESameTestBROKEN[
  f == PolynomialQuotient[f, h, x]*h, 2 + 3*x + x^2 == (1 + x)*(2 + x)], 
 ESameTestBROKEN[g == PolynomialQuotient[g, h, x]*h, 
  6 + 5*x + x^2 == (2 + x)*(3 + x)], 
 EComment[
  "For rational functions common divisors are not automatically canceled:"], 
 ESameTestBROKEN[f/g, (2 + 3*x + x^2)/(6 + 5*x + x^2)], 
 EComment["RefLink[Cancel,paclet:ref/Cancel] effectively uses \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] to cancel common \
divisors:"], ESameTestBROKEN[Cancel[%], (1 + x)/(3 + x)], 
 EComment["The RefLink[Cyclotomic,paclet:ref/Cyclotomic] polynomials are \
defined as quotients:"], ESameTest[PolynomialQuotient[x^5 - 1, x - 1, x], 
  1 + x + x^2 + x^3 + x^4], ESameTest[Cyclotomic[5, x], 
  1 + x + x^2 + x^3 + x^4], 
 EComment["The result depends on what is assumed to be a variable:"], 
 ESameTest[{PolynomialQuotient[x^3 + y^2, x - y, x], 
   PolynomialQuotient[x^3 + y^2, x - y, y]}, {x^2 + x*y + y^2, -x - y}], 
 EComment["The result from \
RefLink[PolynomialQuotient,paclet:ref/PolynomialQuotient] depends on \
recognizing zeros:"], ESameTest[PolynomialQuotient[x^3 + x + 1, 
   zero*x^2 + x + 1, x], -(1/zero^2) + x/zero], 
 ESameTest[PolynomialQuotient[x^3 + x + 1, x + 1, x], 2 - x + x^2], 
 ESameTestBROKEN[FullSimplify[zero], 0], 
 EComment["The result is as if the hidden zero was not zero:"], 
 ESameTestBROKEN[N[PolynomialQuotient[x^3 + x + 1, zero*x^2 + x + 1, x]], 
  -5.0706*10^30 - 2.2518*10^15*x]]
