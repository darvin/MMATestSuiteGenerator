(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Extract the numerator of a rational number:"], 
 ESameTest[Numerator[2/3], 2], 
 EComment["Extract the numerator of a rational expression:"], 
 ESameTest[Numerator[(x - 1)*((x - 2)/(x - 3)^2)], (-2 + x)*(-1 + x)], 
 EComment["Rational numbers:"], ESameTest[Numerator[3/7], 3], 
 EComment["Rational expressions:"], 
 ESameTest[Numerator[(x - 1)^2/((x - 2)*(x - 3))], (-1 + x)^2], 
 EComment["Select terms without syntactically negative exponents:"], 
 ESameTest[expr = (a*x^n*Exp[a - b - 2*c + 3*d])/y^m, 
  (a*E^(a - b - 2*c + 3*d)*x^n)/y^m], ESameTest[Numerator[expr], 
  a*E^(a + 3*d)*x^n], EComment["All exponents syntactically negative:"], 
 ESameTest[Numerator[1/(a^b*x)], 1], 
 EComment["No syntactically negative exponents:"], 
 ESameTest[Numerator[2*x^y*b^2], 2*b^2*x^y], 
 EComment[
  "RefLink[Numerator,paclet:ref/Numerator] automatically threads over lists:"]\
, ESameTest[Numerator[{1, 2, 3, 4, 5, 6}/3], {1, 2, 1, 4, 5, 2}], 
 EComment["Find numerators over integers modulo m:"], 
 ESameTest[Numerator[((1/3)*x + (3/4)*y)/((3/5)*x - (1/2)*y), Modulus -> 7], 
  5*x + 6*y], EComment["Numerators of trigonometric functions:"], 
 ESameTest[Numerator[{Sin[x], Cos[x], Tan[x], Csc[x], Sec[x], Cot[x]}, 
   Trig -> True], {Sin[x], Cos[x], Sin[x], 1, 1, Cos[x]}], 
 EComment["RefLink[Denominator,paclet:ref/Denominator] gives the terms with \
negative exponents:"], ESameTest[Denominator[(2/3)*((x - 1)/(x - 2))], 
  3*(-2 + x)], ESameTestBROKEN[num = Numerator[expr], 5*a^b*(-1 + x)^2], 
 ESameTestBROKEN[den = Denominator[expr], 7*c^d*(-2 + x)^3], 
 ESameTest[expr === num/den, True], 
 EComment["Use RefLink[Cancel,paclet:ref/Cancel] to cancel common factors \
between the numerator and the denominator:"], 
 ESameTest[Cancel[(x - 1)*((x - 2)/(x^2 - 1))], (-2 + x)/(1 + x)], 
 EComment["RefLink[Together,paclet:ref/Together] writes an expression as a \
fraction and cancels common terms:"], 
 ESameTest[Together[x*((x - 2)/(x^2 - 1)) + x/(x^2 - 1) - 2/(x^2 - 1)], 
  (-2 + x)/(-1 + x)]]
