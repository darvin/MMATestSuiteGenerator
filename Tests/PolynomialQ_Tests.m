(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Test whether an expression is a polynomial in the specified variable:"], 
 ESameTest[PolynomialQ[x^3 - 2*(x/y) + 3*x*z, x], True], 
 ESameTest[PolynomialQ[x^3 - 2*(x/y) + 3*x*z, y], False], 
 EComment["Test whether an expression is a polynomial in the specified set of \
variables:"], ESameTest[PolynomialQ[x^2 + a*x*y^2 - b*Sin[c], {x, y}], True], 
 ESameTest[PolynomialQ[x^2 + a*x*y^2 - b*Sin[c], {a, b, c}], False]]
