(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Find a list of variables of a polynomial:"], 
 ESameTest[Variables[(x + y)^2 + 3*z^2 - y*z + 7], {x, y, z}], 
 EComment["A polynomial:"], ESameTest[Variables[x^4 + y^4 + z^4 - 3*x*y*z], 
  {x, y, z}], EComment["A list of polynomials:"], 
 ESameTest[Variables[{x^2 - a*y, y^2 - b*z, z^2 - c*x}], {a, b, c, x, y, z}], 
 EComment["A rational function:"], 
 ESameTest[Variables[(a - b)/(x + y) - 2/z], {a, b, x, y, z}], 
 EComment["Find variables in a radical expression:"], 
 ESameTest[Variables[Sqrt[x + y - z^2] + (-2*t)^(2/3)], {t, x, y, z}], 
 EComment["Find variables present after reducing coefficients modulo 2:"], 
 ESameTest[Variables[x + 2*y + 3*z, Modulus -> 2], {x, z}], 
 ESameTestBROKEN[CoefficientList[f, Variables[f]], 
  {{6, 5, 3}, {4, -2, 0}, {1, 0, 0}}], EComment["RefLink[Variables,paclet:ref\
/Variables] looks for variables only inside sums, products, and rational \
powers:"], ESameTest[Variables[Sin[x] + Cos[x]], {Cos[x], Sin[x]}], 
 ESameTest[Variables[E^x], {}]]
