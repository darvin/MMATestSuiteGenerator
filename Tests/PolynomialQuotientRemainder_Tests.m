(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Find the quotient and remainder after dividing one polynomial by another:"]\
, TapTestSame[PolynomialQuotientRemainder[x^2, x + a, x], {-a + x, a^2}], 
 TapComment["The resulting polynomial will have coefficients that are \
rational expressions of input coefficients:"], 
 TapTestSame[PolynomialQuotientRemainder[x^2 + x + 1, 2*x + 1, x], 
  {1/4 + x/2, 3/4}], TapTestSame[PolynomialQuotientRemainder[x^2 + b*x + 1, 
   a*x + 1, x], {-(1/a^2) + b/a + x/a, 1 + 1/a^2 - b/a}], 
 TapTestSame[PolynomialQuotientRemainder[x^2 + x + 1, Pi*x + 1, x], 
  {-(1/Pi^2) + 1/Pi + x/Pi, 1 + 1/Pi^2 - 1/Pi}], 
 TapComment["RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotien\
tRemainder] also works for rational functions:"], 
 TapTestSame[PolynomialQuotientRemainder[(x + 1)/(x + 2), (x + 1)/(x + 3), 
   x], {(3 + x)/(2 + x), 0}], TapComment["Use a prime modulus:"], 
 TapTestSame[PolynomialQuotientRemainder[x^2 + 4*x + 1, 2*x + 1, x, 
   Modulus -> 2], {1 + x^2, 0}], TapTestSame[PolynomialQuotientRemainder[
   x^2 + 4*x + 1, 2*x + 1, x, Modulus -> 3], {1 + 2*x, 0}], 
 TapTestSameBROKEN[{q, r} = PolynomialQuotientRemainder[f, g, x], {x, 1}], 
 TapComment["The transformed rational function:"], 
 TapTestSameBROKEN[f/g == q + r/g, (1 + 2*x + x^2)/(2 + x) == x + 1/(2 + x)], 
 TapTestSameBROKEN[Simplify[%], True], TapTestSameBROKEN[
  {q, r} = PolynomialQuotientRemainder[f, g, x], {2 + x, -3}], 
 TapComment["Use RefLink[Expand,paclet:ref/Expand] to verify identity:"], 
 TapTestSame[Expand[q*g + r] == f, True], TapComment["RefLink[PolynomialQuoti\
ent,paclet:ref/PolynomialQuotient] and \
RefLink[PolynomialRemainder,paclet:ref/PolynomialRemainder]: "], 
 TapTestSameBROKEN[{PolynomialQuotient[f, g, x], PolynomialRemainder[f, g, 
    x]}, {2 + x, -3}], TapComment["RefLink[PolynomialReduce,paclet:ref/Polyno\
mialReduce] generalizes \
RefLink[PolynomialQuotientRemainder,paclet:ref/PolynomialQuotientRemainder] \
for multivariate polynomials:"], TapTestSame[PolynomialReduce[x^2 + 4*x + 1, 
   {x + 2}, {x}], {{2 + x}, -3}], TapTestSame[PolynomialQuotientRemainder[
   x^2 + 4*x + 1, x + 2, x], {2 + x, -3}]]
