(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Pull out multiple factors:"], 
 TapTestSame[FactorSquareFree[x^5 - x^3 - x^2 + 1], 
  (-1 + x)^2*(1 + 2*x + 2*x^2 + x^3)], 
 TapComment["A complete factorization:"], 
 TapTestSame[Factor[x^5 - x^3 - x^2 + 1], (-1 + x)^2*(1 + x)*(1 + x + x^2)], 
 TapComment["A univariate polynomial:"], 
 TapTestSame[FactorSquareFree[x^4 - 9*x^3 + 29*x^2 - 39*x + 18], 
  (-3 + x)^2*(2 - 3*x + x^2)], TapComment["A multivariate polynomial:"], 
 TapTestSame[FactorSquareFree[x^5 - x^3*y^2 - x^2*y^3 + y^5], 
  (x - y)^2*(x^3 + 2*x^2*y + 2*x*y^2 + y^3)], 
 TapComment["A rational function:"], 
 TapTestSame[FactorSquareFree[(x^3 + x^2)/(x^2 - 4*y^2) - 
    (x + 1)/(x^2 - 4*y^2)], ((-1 + x)*(1 + x)^2)/(x^2 - 4*y^2)], 
 TapComment["By default algebraic number coefficients are treated as \
independent variables:"], TapTestSame[FactorSquareFree[
   x^2 + 2*Sqrt[2]*x + 2], 2 + 2*Sqrt[2]*x + x^2], 
 TapComment["With \
RefLink[Extension,paclet:ref/Extension]->RefLink[Automatic,paclet:ref/Automat\
ic] algebraic dependencies between coefficients are recognized:"], 
 TapTestSame[FactorSquareFree[x^2 + 2*Sqrt[2]*x + 2, Extension -> Automatic], 
  (Sqrt[2] + x)^2], TapComment[
  "Pull out multiple factors over the integers modulo 2:"], 
 TapTestSame[FactorSquareFree[1 + x^4, Modulus -> 2], (1 + x)^4], 
 TapComment["Pull out multiple factors in a trigonometric expression:"], 
 TapTestSame[FactorSquareFree[1 - Cos[2*x], Trig -> True], 2*Sin[x]^2], 
 TapTestSameBROKEN[FactorSquareFree[f], (3 + x)^3*(-4 + x^2)*(-1 + x^2)^2], 
 TapComment[
  "RefLink[Factor,paclet:ref/Factor] gives a complete factorization:"], 
 TapTestSameBROKEN[Factor[f], (-2 + x)*(-1 + x)^2*(1 + x)^2*(2 + x)*
   (3 + x)^3], TapComment["RefLink[Expand,paclet:ref/Expand] is effectively \
the inverse of RefLink[FactorSquareFree,paclet:ref/FactorSquareFree]:"], 
 TapTestSame[FactorSquareFree[x^5 - x^3 - x^2 + 1], 
  (-1 + x)^2*(1 + 2*x + 2*x^2 + x^3)], TapTestSameBROKEN[Expand[%], 
  1 - x^2 - x^3 + x^5], TapComment["RefLink[FactorSquareFreeList,paclet:ref/F\
actorSquareFreeList] gives a list of factors:"], 
 TapTestSame[FactorSquareFreeList[x^8 + 11*x^7 + 43*x^6 + 59*x^5 - 35*x^4 - 
    151*x^3 - 63*x^2 + 81*x + 54], {{1, 1}, {2 + x, 1}, {3 + x, 3}, 
   {-1 + x^2, 2}}], TapComment["A univariate polynomial has multiple factors \
if an only if its RefLink[Discriminant,paclet:ref/Discriminant] is zero:"], 
 TapTestSame[Discriminant[x^5 - x^3 - x^2 + 1, x], 0], 
 TapTestSame[FactorSquareFree[x^5 - x^3 - x^2 + 1], 
  (-1 + x)^2*(1 + 2*x + 2*x^2 + x^3)], 
 TapTestSame[Discriminant[x^5 - x^3 - x^2 - 1, x], 7684], 
 TapTestSame[FactorSquareFree[x^5 - x^3 - x^2 - 1], -1 - x^2 - x^3 + x^5]]
