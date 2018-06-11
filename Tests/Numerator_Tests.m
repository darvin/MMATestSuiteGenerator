(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Extract the numerator of a rational number:"], 
 TapTestSame[Numerator[2/3], 2], 
 TapComment["Extract the numerator of a rational expression:"], 
 TapTestSame[Numerator[(x - 1)*((x - 2)/(x - 3)^2)], (-2 + x)*(-1 + x)], 
 TapComment["Rational numbers:"], TapTestSame[Numerator[3/7], 3], 
 TapComment["Rational expressions:"], 
 TapTestSame[Numerator[(x - 1)^2/((x - 2)*(x - 3))], (-1 + x)^2], 
 TapComment["Select terms without syntactically negative exponents:"], 
 TapTestSame[expr = (a*x^n*Exp[a - b - 2*c + 3*d])/y^m, 
  (a*E^(a - b - 2*c + 3*d)*x^n)/y^m], TapTestSame[Numerator[expr], 
  a*E^(a + 3*d)*x^n], TapComment["All exponents syntactically negative:"], 
 TapTestSame[Numerator[1/(a^b*x)], 1], 
 TapComment["No syntactically negative exponents:"], 
 TapTestSame[Numerator[2*x^y*b^2], 2*b^2*x^y], 
 TapComment[
  "RefLink[Numerator,paclet:ref/Numerator] automatically threads over lists:"]\
, TapTestSame[Numerator[{1, 2, 3, 4, 5, 6}/3], {1, 2, 1, 4, 5, 2}], 
 TapComment["Find numerators over integers modulo m:"], 
 TapTestSame[Numerator[((1/3)*x + (3/4)*y)/((3/5)*x - (1/2)*y), 
   Modulus -> 7], 5*x + 6*y], 
 TapComment["Numerators of trigonometric functions:"], 
 TapTestSame[Numerator[{Sin[x], Cos[x], Tan[x], Csc[x], Sec[x], Cot[x]}, 
   Trig -> True], {Sin[x], Cos[x], Sin[x], 1, 1, Cos[x]}], 
 TapComment["RefLink[Denominator,paclet:ref/Denominator] gives the terms with \
negative exponents:"], TapTestSame[Denominator[(2/3)*((x - 1)/(x - 2))], 
  3*(-2 + x)], TapComment[
  "An expression is a quotient of its numerator and denominator:"], 
 TapTestSameBROKEN[expr = ((5/7)*((x - 1)^2/(x - 2)^3)*a^b)/c^d ;; num = 
    Numerator[expr], 5*a^b*(-1 + x)^2], TapTestSameBROKEN[
  den = Denominator[expr], 7*c^d*(-2 + x)^3], 
 TapTestSameBROKEN[expr === num/den, True], 
 TapComment["Use RefLink[Cancel,paclet:ref/Cancel] to cancel common factors \
between the numerator and the denominator:"], 
 TapTestSame[Cancel[(x - 1)*((x - 2)/(x^2 - 1))], (-2 + x)/(1 + x)], 
 TapComment["RefLink[Together,paclet:ref/Together] writes an expression as a \
fraction and cancels common terms:"], 
 TapTestSame[Together[x*((x - 2)/(x^2 - 1)) + x/(x^2 - 1) - 2/(x^2 - 1)], 
  (-2 + x)/(-1 + x)]]
