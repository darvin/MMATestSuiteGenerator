(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Pull out multiple factors:"], 
 ESameTest[FactorSquareFree[x^5 - x^3 - x^2 + 1], 
  (-1 + x)^2*(1 + 2*x + 2*x^2 + x^3)], EComment["A complete factorization:"], 
 ESameTest[Factor[x^5 - x^3 - x^2 + 1], (-1 + x)^2*(1 + x)*(1 + x + x^2)], 
 EComment["A univariate polynomial:"], 
 ESameTest[FactorSquareFree[x^4 - 9*x^3 + 29*x^2 - 39*x + 18], 
  (-3 + x)^2*(2 - 3*x + x^2)], EComment["A multivariate polynomial:"], 
 ESameTest[FactorSquareFree[x^5 - x^3*y^2 - x^2*y^3 + y^5], 
  (x - y)^2*(x^3 + 2*x^2*y + 2*x*y^2 + y^3)], 
 EComment["A rational function:"], 
 ESameTest[FactorSquareFree[(x^3 + x^2)/(x^2 - 4*y^2) - 
    (x + 1)/(x^2 - 4*y^2)], ((-1 + x)*(1 + x)^2)/(x^2 - 4*y^2)], 
 EComment["By default algebraic number coefficients are treated as \
independent variables:"], ESameTest[FactorSquareFree[x^2 + 2*Sqrt[2]*x + 2], 
  2 + 2*Sqrt[2]*x + x^2], EComment["With \
RefLink[Extension,paclet:ref/Extension]->RefLink[Automatic,paclet:ref/Automat\
ic] algebraic dependencies between coefficients are recognized:"], 
 ESameTest[FactorSquareFree[x^2 + 2*Sqrt[2]*x + 2, Extension -> Automatic], 
  (Sqrt[2] + x)^2], 
 EComment["Pull out multiple factors over the integers modulo 2:"], 
 ESameTest[FactorSquareFree[1 + x^4, Modulus -> 2], (1 + x)^4], 
 EComment["Pull out multiple factors in a trigonometric expression:"], 
 ESameTest[FactorSquareFree[1 - Cos[2*x], Trig -> True], 2*Sin[x]^2], 
 ESameTestBROKEN[FactorSquareFree[f], (3 + x)^3*(-4 + x^2)*(-1 + x^2)^2], 
 EComment[
  "RefLink[Factor,paclet:ref/Factor] gives a complete factorization:"], 
 ESameTestBROKEN[Factor[f], (-2 + x)*(-1 + x)^2*(1 + x)^2*(2 + x)*(3 + x)^3], 
 EComment["RefLink[Expand,paclet:ref/Expand] is effectively the inverse of \
RefLink[FactorSquareFree,paclet:ref/FactorSquareFree]:"], 
 ESameTest[FactorSquareFree[x^5 - x^3 - x^2 + 1], 
  (-1 + x)^2*(1 + 2*x + 2*x^2 + x^3)], ESameTestBROKEN[Expand[%], 
  1 - x^2 - x^3 + x^5], EComment["RefLink[FactorSquareFreeList,paclet:ref/Fac\
torSquareFreeList] gives a list of factors:"], 
 ESameTest[FactorSquareFreeList[x^8 + 11*x^7 + 43*x^6 + 59*x^5 - 35*x^4 - 
    151*x^3 - 63*x^2 + 81*x + 54], {{1, 1}, {2 + x, 1}, {3 + x, 3}, 
   {-1 + x^2, 2}}], EComment["A univariate polynomial has multiple factors if \
an only if its RefLink[Discriminant,paclet:ref/Discriminant] is zero:"], 
 ESameTest[Discriminant[x^5 - x^3 - x^2 + 1, x], 0], 
 ESameTest[FactorSquareFree[x^5 - x^3 - x^2 + 1], 
  (-1 + x)^2*(1 + 2*x + 2*x^2 + x^3)], 
 ESameTest[Discriminant[x^5 - x^3 - x^2 - 1, x], 7684], 
 ESameTest[FactorSquareFree[x^5 - x^3 - x^2 - 1], -1 - x^2 - x^3 + x^5]]
