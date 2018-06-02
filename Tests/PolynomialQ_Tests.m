(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Test whether an expression is a polynomial in the specified variable:"], 
 TapTestSame[PolynomialQ[x^3 - 2*(x/y) + 3*x*z, x], True], 
 TapTestSame[PolynomialQ[x^3 - 2*(x/y) + 3*x*z, y], False], 
 TapComment["Test whether an expression is a polynomial in the specified set \
of variables:"], TapTestSame[PolynomialQ[x^2 + a*x*y^2 - b*Sin[c], {x, y}], 
  True], TapTestSame[PolynomialQ[x^2 + a*x*y^2 - b*Sin[c], {a, b, c}], False]]
