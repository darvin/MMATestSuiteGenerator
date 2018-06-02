(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Extract denominator of a rational number:"], 
 ESameTest[Denominator[2/3], 3], 
 EComment["Extract denominator of a rational expression:"], 
 ESameTest[Denominator[(x - 1)*((x - 2)/(x - 3)^2)], (-3 + x)^2], 
 EComment["Rational numbers:"], ESameTest[Denominator[3/7], 7], 
 EComment["Rational expressions:"], 
 ESameTest[Denominator[(x - 1)^2/((x - 2)*(x - 3))], (-3 + x)*(-2 + x)], 
 EComment["Select terms with syntactically negative exponents:"], 
 ESameTest[expr = (a*x^n*Exp[a - b - 2*c + 3*d])/y^m, 
  (a*E^(a - b - 2*c + 3*d)*x^n)/y^m], ESameTest[Denominator[expr], 
  E^(b + 2*c)*y^m], EComment["All exponents syntactically negative:"], 
 ESameTest[Denominator[1/(a^b*x)], a^b*x], 
 EComment["No syntactically negative exponents:"], 
 ESameTest[Denominator[2*x^y*b^2], 1], EComment["RefLink[Denominator,paclet:r\
ef/Denominator] automatically threads over lists:"], 
 ESameTest[Denominator[{1, 2, 3, 4, 5, 6}/3], {3, 3, 1, 3, 3, 1}], 
 EComment["Find denominators over integers modulo m:"], 
 ESameTest[Denominator[((1/3)*x + (3/4)*y)/((3/5)*x - (1/2)*y), 
   Modulus -> 7], 2*x + 3*y], 
 EComment["Denominators of trigonometric functions:"], 
 ESameTest[Denominator[{Sin[x], Cos[x], Tan[x], Csc[x], Sec[x], Cot[x]}, 
   Trig -> True], {1, 1, Cos[x], Sin[x], Cos[x], Sin[x]}], 
 EComment["RefLink[Numerator,paclet:ref/Numerator] gives the terms without \
negative exponents:"], ESameTest[Numerator[(2/3)*a*((x - 1)/(x - 2))], 
  2*a*(-1 + x)], ESameTestBROKEN[num = Numerator[expr], 5*a^b*(-1 + x)^2], 
 ESameTestBROKEN[den = Denominator[expr], 7*c^d*(-2 + x)^3], 
 ESameTest[expr === num/den, True], 
 EComment["Use RefLink[Cancel,paclet:ref/Cancel] to cancel common factors \
between the numerator and the denominator:"], 
 ESameTest[Cancel[(x - 1)*((x - 2)/(x^2 - 1))], (-2 + x)/(1 + x)], 
 EComment["RefLink[Together,paclet:ref/Together] writes an expression as a \
fraction and cancels common terms:"], 
 ESameTest[Together[x*((x - 2)/(x^2 - 1)) + x/(x^2 - 1) - 2/(x^2 - 1)], 
  (-2 + x)/(-1 + x)], ESameTestBROKEN[ExpandDenominator[r], 
  (1 + x)/(4 + 4*x + x^2)], ESameTestBROKEN[
  Numerator[r]/Expand[Denominator[r]], (1 + x)/(4 + 4*x + x^2)], 
 ESameTestBROKEN[HoldComplete[ArrayPlot[Table[Denominator[i/j], {i, 30}, 
     {j, 30}]]], $Failed], EComment["Cyclic addition [WebLink[more \
info,http://www.wolframscience.com/nksonline/page-950b-text]]:"], 
 ESameTestBROKEN[HoldComplete[ListPlot[Flatten[Table[{i/j, Denominator[i/j]}, 
      {i, 20}, {j, 20}], 1]]], $Failed]]
