(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Pull out an overall numerical factor, but do no further factoring:"], 
 TapTestSame[FactorTerms[3 + 6*x + 3*x^2], 3*(1 + 2*x + x^2)], 
 TapComment["Pull out an overall numerical factor:"], 
 TapTestSameBROKEN[FactorTerms[f], 2*(-6 - 6*a + 2*x^2 + 2*a*x^2 - 3*y + 
    a*y + 4*a^2*y + x^2*y + a*x^2*y + 2*a*y^2 + 2*a^2*y^2)], 
 TapComment["Pull out factors that do not depend on x:"], 
 TapTestSameBROKEN[FactorTerms[f, x], 2*(2 + 2*a + y + a*y)*
   (-3 + x^2 + 2*a*y)], TapComment["Pull out factors that do not depend on x \
and y and then factors that do not depend on x:"], 
 TapTestSameBROKEN[FactorTerms[f, {x, y}], 2*(1 + a)*(2 + y)*
   (-3 + x^2 + 2*a*y)], TapComment[
  "Pull out overall numerical factor over integers modulo 7:"], 
 TapTestSame[FactorTerms[3*x + 10, Modulus -> 7], 3*(1 + x)], 
 TapComment["RefLink[Expand,paclet:ref/Expand] distributes the common factor \
over the terms, effectively reverting \
RefLink[FactorTerms,paclet:ref/FactorTerms]:"], 
 TapTestSame[FactorTerms[14*x + 21*y + 35*x*y + 63], 
  7*(9 + 2*x + 3*y + 5*x*y)], TapTestSameBROKEN[Expand[%], 
  63 + 14*x + 21*y + 35*x*y], TapComment["RefLink[FactorTermsList,paclet:ref/\
FactorTermsList] gives a list of factors:"], 
 TapTestSame[FactorTermsList[14*x + 21*y + 35*x*y + 63], 
  {7, 9 + 2*x + 3*y + 5*x*y}], 
 TapComment[
  "RefLink[Factor,paclet:ref/Factor] performs a complete factorization:"], 
 TapTestSame[FactorTerms[4*x^3 - 4], 4*(-1 + x^3)], 
 TapTestSameBROKEN[Factor[%], 4*(-1 + x)*(1 + x + x^2)]]
