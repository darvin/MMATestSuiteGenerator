(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Combine terms over a common denominator:"], 
 ESameTest[Together[a/b + c/d], (b*c + a*d)/(b*d)], 
 EComment[
  "Cancel common factors between the numerator and the denominator:"], 
 ESameTest[Together[x^2/(x^2 - 1) + x/(x^2 - 1)], x/(-1 + x)], 
 EComment["Combine a sum of any number of terms:"], 
 ESameTest[Together[1/x + 1/(x + 1) + 1/(x + 2) + 1/(x + 3)], 
  (2*(3 + 11*x + 9*x^2 + 2*x^3))/(x*(1 + x)*(2 + x)*(3 + x))], 
 EComment["Here all factors of the denominator divide the numerator:"], 
 ESameTest[Together[x^2/(x - y) - x*(y/(x - y))], x], 
 EComment["RefLink[Together,paclet:ref/Together] threads over equations and \
inequalities:"], ESameTest[Together[1 < 1/x + 1/(1 + x) < 2], 
  1 < (1 + 2*x)/(x*(1 + x)) < 2], EComment["By default, \
RefLink[Together,paclet:ref/Together] treats algebraic numbers as independent \
variables:"], ESameTest[Together[(x^2 - 2)/(Sqrt[2] + x)], 
  (-2 + x^2)/(Sqrt[2] + x)], 
 ESameTest[Together[1/(Sqrt[2] + x) + 1/(x^2 - 2)], 
  (-2 + Sqrt[2] + x + x^2)/((Sqrt[2] + x)*(-2 + x^2))], 
 EComment["With \
RefLink[Extension,paclet:ref/Extension]->RefLink[Automatic,paclet:ref/Automat\
ic], RefLink[Together,paclet:ref/Together] recognizes algebraically dependent \
coefficients:"], ESameTest[Together[(x^2 - 2)/(Sqrt[2] + x), 
   Extension -> Automatic], -Sqrt[2] + x], 
 ESameTest[Together[1/(Sqrt[2] + x) + 1/(x^2 - 2), Extension -> Automatic], 
  (-1 + Sqrt[2] - x)/((Sqrt[2] - x)*(Sqrt[2] + x))], 
 EComment["Computations over rational numbers:"], 
 ESameTest[Together[1/x + 1/(1 + x)], (1 + 2*x)/(x*(1 + x))], 
 ESameTestBROKEN[Together[(x - 1)*((x - 2)/((x - 3)*(x - 4)*(x - 5)))], 
  ((-2 + x)*(-1 + x))/(-60 + 47*x - 12*x^2 + x^3)], 
 EComment["The same computations over integers modulo 2:"], 
 ESameTest[Together[1/x + 1/(1 + x), Modulus -> 2], 1/(x*(1 + x))], 
 ESameTest[Together[(x - 1)*((x - 2)/((x - 3)*(x - 4)*(x - 5))), 
   Modulus -> 2], 1/(1 + x)], EComment["By default, \
RefLink[Together,paclet:ref/Together] treats trigonometric functions as \
independent variables:"], ESameTest[Together[1/Sin[x] + 1/Cos[x]], 
  Csc[x] + Sec[x]], EComment["With \
RefLink[Trig,paclet:ref/Trig]->RefLink[True,paclet:ref/True], \
RefLink[Together,paclet:ref/Together] recognizes dependencies between \
trigonometric functions:"], ESameTest[Together[1/Sin[x] + 1/Cos[x], 
   Trig -> True], Csc[x]*Sec[x]*(Cos[x] + Sin[x])], 
 ESameTestBROKEN[rationalFunctionQ[1/x + y/x, {x, y}], True], 
 EComment["RefLink[Apart,paclet:ref/Apart] acts as a partial inverse of \
RefLink[Together,paclet:ref/Together]:"], ESameTest[Together[a/b + c/d], 
  (b*c + a*d)/(b*d)], ESameTestBROKEN[Apart[%], a/b + c/d], 
 ESameTestBROKEN[Together[r], (3 + 2*x)/((1 + x)*(2 + x))], 
 EComment["RefLink[Cancel,paclet:ref/Cancel] only cancels common factors \
between numerators and denominators:"], ESameTestBROKEN[Cancel[r], 
  1/(1 + x) + 1/(2 + x)], EComment["Use \
RefLink[Numerator,paclet:ref/Numerator] and \
RefLink[Denominator,paclet:ref/Denominator] to extract numerators and \
denominators:"], ESameTest[expr = Together[1/x + 1/y], (x + y)/(x*y)], 
 ESameTest[Numerator[expr], x + y], ESameTest[Denominator[expr], x*y]]
