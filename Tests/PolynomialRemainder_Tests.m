(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Find the remainder after dividing one polynomial by another:"], 
 ESameTest[PolynomialRemainder[x^2, x + a, x], a^2], 
 EComment["The resulting polynomial will have coefficients that are rational \
expressions of input coefficients:"], 
 ESameTest[PolynomialRemainder[x^2 + x + 1, 2*x + 1, x], 3/4], 
 ESameTest[PolynomialRemainder[x^2 + b*x + 1, a*x + 1, x], 1 + 1/a^2 - b/a], 
 ESameTest[PolynomialRemainder[x^2 + x + 1, Pi*x + 1, x], 1 + 1/Pi^2 - 1/Pi], 
 EComment["RefLink[PolynomialRemainder,paclet:ref/PolynomialRemainder] also \
works for rational functions:"], 
 ESameTest[PolynomialRemainder[(x + 1)/(x + 2), (x + 1)/(x + 3), x], 0], 
 EComment["Use a prime modulus:"], 
 ESameTest[PolynomialRemainder[x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 2], 0], 
 ESameTest[PolynomialRemainder[x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 5], 3], 
 ESameTestBROKEN[Euclid[(x + 1)*(x + 2), (x + 2)*(x + 3), x], -4 - 2*x], 
 EComment["Divide by the leading coefficient:"], 
 ESameTestBROKEN[Expand[%/Coefficient[%, x, 1]], 2 + x], 
 ESameTest[PolynomialGCD[(x + 1)*(x + 2), (x + 2)*(x + 3)], 2 + x], 
 ESameTestBROKEN[q = PolynomialQuotient[f, g, x], 2 + x], 
 ESameTestBROKEN[r = PolynomialRemainder[f, g, x], -3], 
 EComment["Use RefLink[Expand,paclet:ref/Expand] to verify identity:"], 
 ESameTest[Expand[q*g + r] == f, True], EComment["To get both quotient and \
remainder use \
RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientRemainder]:"]\
, ESameTestBROKEN[PolynomialQuotientRemainder[f, g, x], {2 + x, -3}], 
 EComment["RefLink[PolynomialReduce,paclet:ref/PolynomialReduce] generalizes \
RefLink[PolynomialRemainder,paclet:ref/PolynomialRemainder] for multivariate \
polynomials:"], ESameTest[PolynomialReduce[x^2 + 4*x + 1, {x + 2}, {x}], 
  {{2 + x}, -3}], ESameTest[PolynomialRemainder[x^2, x + a, x], a^2], 
 ESameTest[PolynomialMod[x^2, x + a], x^2], 
 EComment["The variable assumed for the polynomials matters:"], 
 ESameTest[{PolynomialRemainder[x + y, x - y, x], 
   PolynomialRemainder[x + y, x - y, y]}, {2*y, 2*x}]]
