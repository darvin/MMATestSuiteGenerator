(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Find the quotient and remainder after dividing one polynomial by another:"]\
, ESameTest[PolynomialQuotientRemainder[x^2, x + a, x], {-a + x, a^2}], 
 EComment["The resulting polynomial will have coefficients that are rational \
expressions of input coefficients:"], 
 ESameTest[PolynomialQuotientRemainder[x^2 + x + 1, 2*x + 1, x], 
  {1/4 + x/2, 3/4}], ESameTest[PolynomialQuotientRemainder[x^2 + b*x + 1, 
   a*x + 1, x], {-(1/a^2) + b/a + x/a, 1 + 1/a^2 - b/a}], 
 ESameTest[PolynomialQuotientRemainder[x^2 + x + 1, Pi*x + 1, x], 
  {-(1/Pi^2) + 1/Pi + x/Pi, 1 + 1/Pi^2 - 1/Pi}], 
 EComment["RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientR\
emainder] also works for rational functions:"], 
 ESameTest[PolynomialQuotientRemainder[(x + 1)/(x + 2), (x + 1)/(x + 3), x], 
  {(3 + x)/(2 + x), 0}], EComment["Use a prime modulus:"], 
 ESameTest[PolynomialQuotientRemainder[x^2 + 4*x + 1, 2*x + 1, x, 
   Modulus -> 2], {1 + x^2, 0}], ESameTest[PolynomialQuotientRemainder[
   x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 3], {1 + 2*x, 0}], 
 ESameTestBROKEN[{q, r} = PolynomialQuotientRemainder[f, g, x], {x, 1}], 
 EComment["The transformed rational function:"], 
 ESameTestBROKEN[f/g == q + r/g, (1 + 2*x + x^2)/(2 + x) == x + 1/(2 + x)], 
 ESameTestBROKEN[Simplify[%], True], ESameTestBROKEN[
  {q, r} = PolynomialQuotientRemainder[f, g, x], {2 + x, -3}], 
 EComment["Use RefLink[Expand,paclet:ref/Expand] to verify identity:"], 
 ESameTest[Expand[q*g + r] == f, True], EComment["RefLink[PolynomialQuotient,\
paclet:ref/PolynomialQuotient] and \
RefLink[PolynomialRemainder,paclet:ref/PolynomialRemainder]: "], 
 ESameTestBROKEN[{PolynomialQuotient[f, g, x], PolynomialRemainder[f, g, x]}, 
  {2 + x, -3}], EComment["RefLink[PolynomialReduce,paclet:ref/PolynomialReduc\
e] generalizes \
RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientRemainder] \
for multivariate polynomials:"], ESameTest[PolynomialReduce[x^2 + 4*x + 1, 
   {x + 2}, {x}], {{2 + x}, -3}], 
 ESameTest[PolynomialQuotientRemainder[x^2 + 4*x + 1, x + 2, x], {2 + x, -3}]]
