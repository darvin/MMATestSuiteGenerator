(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Extract denominator of a rational number:"], 
 TapTestSame[Denominator[2/3], 3], 
 TapComment["Extract denominator of a rational expression:"], 
 TapTestSame[Denominator[(x - 1)*((x - 2)/(x - 3)^2)], (-3 + x)^2], 
 TapComment["Rational numbers:"], TapTestSame[Denominator[3/7], 7], 
 TapComment["Rational expressions:"], 
 TapTestSame[Denominator[(x - 1)^2/((x - 2)*(x - 3))], (-3 + x)*(-2 + x)], 
 TapComment["Select terms with syntactically negative exponents:"], 
 TapTestSame[expr = (a*x^n*Exp[a - b - 2*c + 3*d])/y^m, 
  (a*E^(a - b - 2*c + 3*d)*x^n)/y^m], TapTestSame[Denominator[expr], 
  E^(b + 2*c)*y^m], TapComment["All exponents syntactically negative:"], 
 TapTestSame[Denominator[1/(a^b*x)], a^b*x], 
 TapComment["No syntactically negative exponents:"], 
 TapTestSame[Denominator[2*x^y*b^2], 1], TapComment["RefLink[Denominator,pacl\
et:ref/Denominator] automatically threads over lists:"], 
 TapTestSame[Denominator[{1, 2, 3, 4, 5, 6}/3], {3, 3, 1, 3, 3, 1}], 
 TapComment["Find denominators over integers modulo m:"], 
 TapTestSame[Denominator[((1/3)*x + (3/4)*y)/((3/5)*x - (1/2)*y), 
   Modulus -> 7], 2*x + 3*y], 
 TapComment["Denominators of trigonometric functions:"], 
 TapTestSame[Denominator[{Sin[x], Cos[x], Tan[x], Csc[x], Sec[x], Cot[x]}, 
   Trig -> True], {1, 1, Cos[x], Sin[x], Cos[x], Sin[x]}], 
 TapComment["RefLink[Numerator,paclet:ref/Numerator] gives the terms without \
negative exponents:"], TapTestSame[Numerator[(2/3)*a*((x - 1)/(x - 2))], 
  2*a*(-1 + x)], TapComment[
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
  (-2 + x)/(-1 + x)], TapComment["Use \
RefLink[ExpandDenominator,paclet:ref/ExpandDenominator] to directly expand \
all denominators:"], TapTestSameBROKEN[
  r = (x + 1)/(x + 2)^2 ;; ExpandDenominator[r], (1 + x)/(4 + 4*x + x^2)], 
 TapTestSameBROKEN[Numerator[r]/Expand[Denominator[r]], 
  (1 + x)/(4 + 4*x + x^2)], TapTestSame[
  HoldComplete[ArrayPlot[Table[Denominator[i/j], {i, 30}, {j, 30}]]], 
  $Failed], TapComment["Cyclic addition [WebLink[more \
info,http://www.wolframscience.com/nksonline/page-950b-text]]:"], 
 TapTestSame[HoldComplete[ListPlot[Flatten[Table[{i/j, Denominator[i/j]}, 
      {i, 20}, {j, 20}], 1]]], $Failed]]
