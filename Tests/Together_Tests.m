(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Combine terms over a common denominator:"], 
 TapTestSame[Together[a/b + c/d], (b*c + a*d)/(b*d)], 
 TapComment["Cancel common factors between the numerator and the \
denominator:"], TapTestSame[Together[x^2/(x^2 - 1) + x/(x^2 - 1)], 
  x/(-1 + x)], TapComment["Combine a sum of any number of terms:"], 
 TapTestSame[Together[1/x + 1/(x + 1) + 1/(x + 2) + 1/(x + 3)], 
  (2*(3 + 11*x + 9*x^2 + 2*x^3))/(x*(1 + x)*(2 + x)*(3 + x))], 
 TapComment["Here all factors of the denominator divide the numerator:"], 
 TapTestSame[Together[x^2/(x - y) - x*(y/(x - y))], x], 
 TapComment["RefLink[Together,paclet:ref/Together] threads over equations and \
inequalities:"], TapTestSame[Together[1 < 1/x + 1/(1 + x) < 2], 
  1 < (1 + 2*x)/(x*(1 + x)) < 2], TapComment["By default, \
RefLink[Together,paclet:ref/Together] treats algebraic numbers as independent \
variables:"], TapTestSame[Together[(x^2 - 2)/(Sqrt[2] + x)], 
  (-2 + x^2)/(Sqrt[2] + x)], TapTestSame[
  Together[1/(Sqrt[2] + x) + 1/(x^2 - 2)], (-2 + Sqrt[2] + x + x^2)/
   ((Sqrt[2] + x)*(-2 + x^2))], TapComment["With \
RefLink[Extension,paclet:ref/Extension]->RefLink[Automatic,paclet:ref/Automat\
ic], RefLink[Together,paclet:ref/Together] recognizes algebraically dependent \
coefficients:"], TapTestSame[Together[(x^2 - 2)/(Sqrt[2] + x), 
   Extension -> Automatic], -Sqrt[2] + x], 
 TapTestSame[Together[1/(Sqrt[2] + x) + 1/(x^2 - 2), Extension -> Automatic], 
  (-1 + Sqrt[2] - x)/((Sqrt[2] - x)*(Sqrt[2] + x))], 
 TapComment["Computations over rational numbers:"], 
 TapTestSame[Together[1/x + 1/(1 + x)], (1 + 2*x)/(x*(1 + x))], 
 TapTestSameBROKEN[Together[(x - 1)*((x - 2)/((x - 3)*(x - 4)*(x - 5)))], 
  ((-2 + x)*(-1 + x))/(-60 + 47*x - 12*x^2 + x^3)], 
 TapComment["The same computations over integers modulo 2:"], 
 TapTestSame[Together[1/x + 1/(1 + x), Modulus -> 2], 1/(x*(1 + x))], 
 TapTestSame[Together[(x - 1)*((x - 2)/((x - 3)*(x - 4)*(x - 5))), 
   Modulus -> 2], 1/(1 + x)], TapComment["By default, \
RefLink[Together,paclet:ref/Together] treats trigonometric functions as \
independent variables:"], TapTestSame[Together[1/Sin[x] + 1/Cos[x]], 
  Csc[x] + Sec[x]], TapComment["With \
RefLink[Trig,paclet:ref/Trig]->RefLink[True,paclet:ref/True], \
RefLink[Together,paclet:ref/Together] recognizes dependencies between \
trigonometric functions:"], TapTestSame[Together[1/Sin[x] + 1/Cos[x], 
   Trig -> True], Csc[x]*Sec[x]*(Cos[x] + Sin[x])], 
 TapTestSameBROKEN[rationalFunctionQ[1/x + y/x, {x, y}], True], 
 TapComment["RefLink[Apart,paclet:ref/Apart] acts as a partial inverse of \
RefLink[Together,paclet:ref/Together]:"], TapTestSame[Together[a/b + c/d], 
  (b*c + a*d)/(b*d)], TapTestSameBROKEN[Apart[%], a/b + c/d], 
 TapTestSameBROKEN[Together[r], (3 + 2*x)/((1 + x)*(2 + x))], 
 TapComment["RefLink[Cancel,paclet:ref/Cancel] only cancels common factors \
between numerators and denominators:"], TapTestSameBROKEN[Cancel[r], 
  1/(1 + x) + 1/(2 + x)], TapComment["Use \
RefLink[Numerator,paclet:ref/Numerator] and \
RefLink[Denominator,paclet:ref/Denominator] to extract numerators and \
denominators:"], TapTestSame[expr = Together[1/x + 1/y], (x + y)/(x*y)], 
 TapTestSame[Numerator[expr], x + y], TapTestSame[Denominator[expr], x*y]]
