(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Pull out an overall numerical factor, but do no further factoring:"], 
 TapTestSame[FactorTermsList[2*x^2 - 2], {2, -1 + x^2}], 
 TapComment["Pull out an overall numerical factor:"], 
 TapTestSameBROKEN[FactorTermsList[f], 
  {2, -6 - 6*a + 2*x^2 + 2*a*x^2 - 3*y + a*y + 4*a^2*y + x^2*y + a*x^2*y + 
    2*a*y^2 + 2*a^2*y^2}], 
 TapComment["Pull out factors that do not depend on x:"], 
 TapTestSameBROKEN[FactorTermsList[f, x], {2, 2 + 2*a + y + a*y, 
   -3 + x^2 + 2*a*y}], TapComment["Pull out factors that do not depend on x \
and y and then factors that do not depend on x:"], 
 TapTestSameBROKEN[FactorTermsList[f, {x, y}], 
  {2, 1 + a, 2 + y, -3 + x^2 + 2*a*y}], 
 TapComment["Here the terms have no common factors:"], 
 TapTestSame[FactorTermsList[2*x^2 - 1], {1, -1 + 2*x^2}], 
 TapComment["Pull out overall numerical factor over integers modulo 7:"], 
 TapTestSame[FactorTermsList[3*x + 10, Modulus -> 7], {3, 1 + x}], 
 TapComment["RefLink[FactorTermsList,paclet:ref/FactorTermsList] gives a list \
of factors:"], TapTestSame[FactorTermsList[14*x + 21*y + 35*x*y + 63], 
  {7, 9 + 2*x + 3*y + 5*x*y}], 
 TapComment["This multiplies the factors together:"], 
 TapTestSameBROKEN[Times @@ %, 7*(9 + 2*x + 3*y + 5*x*y)], 
 TapComment[
  "RefLink[FactorTerms,paclet:ref/FactorTerms] gives a product of factors:"], 
 TapTestSame[FactorTerms[14*x + 21*y + 35*x*y + 63], 
  7*(9 + 2*x + 3*y + 5*x*y)], 
 TapComment[
  "RefLink[Expand,paclet:ref/Expand] combines the factors back together:"], 
 TapTestSameBROKEN[Expand[%], 63 + 14*x + 21*y + 35*x*y], 
 TapComment["RefLink[FactorList,paclet:ref/FactorList] gives a list of all \
irreducible factors:"], TapTestSame[FactorTermsList[4*x^3 - 4], 
  {4, -1 + x^3}], TapTestSame[FactorList[4*x^3 - 4], 
  {{4, 1}, {-1 + x, 1}, {1 + x + x^2, 1}}]]
