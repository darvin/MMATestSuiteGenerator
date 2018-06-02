(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find a list of variables of a polynomial:"], 
 TapTestSame[Variables[(x + y)^2 + 3*z^2 - y*z + 7], {x, y, z}], 
 TapComment["A polynomial:"], TapTestSame[
  Variables[x^4 + y^4 + z^4 - 3*x*y*z], {x, y, z}], 
 TapComment["A list of polynomials:"], 
 TapTestSame[Variables[{x^2 - a*y, y^2 - b*z, z^2 - c*x}], 
  {a, b, c, x, y, z}], TapComment["A rational function:"], 
 TapTestSame[Variables[(a - b)/(x + y) - 2/z], {a, b, x, y, z}], 
 TapComment["Find variables in a radical expression:"], 
 TapTestSame[Variables[Sqrt[x + y - z^2] + (-2*t)^(2/3)], {t, x, y, z}], 
 TapComment["Find variables present after reducing coefficients modulo 2:"], 
 TapTestSame[Variables[x + 2*y + 3*z, Modulus -> 2], {x, z}], 
 TapTestSameBROKEN[CoefficientList[f, Variables[f]], 
  {{6, 5, 3}, {4, -2, 0}, {1, 0, 0}}], TapComment["RefLink[Variables,paclet:r\
ef/Variables] looks for variables only inside sums, products, and rational \
powers:"], TapTestSame[Variables[Sin[x] + Cos[x]], {Cos[x], Sin[x]}], 
 TapTestSame[Variables[E^x], {}]]
