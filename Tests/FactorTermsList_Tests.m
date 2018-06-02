(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Pull out an overall numerical factor, but do no further factoring:"], 
 ESameTest[FactorTermsList[2*x^2 - 2], {2, -1 + x^2}], 
 EComment["Pull out an overall numerical factor:"], 
 ESameTestBROKEN[FactorTermsList[f], 
  {2, -6 - 6*a + 2*x^2 + 2*a*x^2 - 3*y + a*y + 4*a^2*y + x^2*y + a*x^2*y + 
    2*a*y^2 + 2*a^2*y^2}], 
 EComment["Pull out factors that do not depend on x:"], 
 ESameTestBROKEN[FactorTermsList[f, x], {2, 2 + 2*a + y + a*y, 
   -3 + x^2 + 2*a*y}], EComment["Pull out factors that do not depend on x and \
y and then factors that do not depend on x:"], 
 ESameTestBROKEN[FactorTermsList[f, {x, y}], 
  {2, 1 + a, 2 + y, -3 + x^2 + 2*a*y}], 
 EComment["Here the terms have no common factors:"], 
 ESameTest[FactorTermsList[2*x^2 - 1], {1, -1 + 2*x^2}], 
 EComment["Pull out overall numerical factor over integers modulo 7:"], 
 ESameTest[FactorTermsList[3*x + 10, Modulus -> 7], {3, 1 + x}], 
 EComment["RefLink[FactorTermsList,paclet:ref/FactorTermsList] gives a list \
of factors:"], ESameTest[FactorTermsList[14*x + 21*y + 35*x*y + 63], 
  {7, 9 + 2*x + 3*y + 5*x*y}], 
 EComment["This multiplies the factors together:"], 
 ESameTestBROKEN[Times @@ %, 7*(9 + 2*x + 3*y + 5*x*y)], 
 EComment[
  "RefLink[FactorTerms,paclet:ref/FactorTerms] gives a product of factors:"], 
 ESameTest[FactorTerms[14*x + 21*y + 35*x*y + 63], 
  7*(9 + 2*x + 3*y + 5*x*y)], 
 EComment[
  "RefLink[Expand,paclet:ref/Expand] combines the factors back together:"], 
 ESameTestBROKEN[Expand[%], 63 + 14*x + 21*y + 35*x*y], 
 EComment["RefLink[FactorList,paclet:ref/FactorList] gives a list of all \
irreducible factors:"], ESameTest[FactorTermsList[4*x^3 - 4], {4, -1 + x^3}], 
 ESameTest[FactorList[4*x^3 - 4], {{4, 1}, {-1 + x, 1}, {1 + x + x^2, 1}}]]
