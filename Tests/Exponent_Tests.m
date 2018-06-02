(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the highest exponent of x:"], 
 TapTestSame[Exponent[1 + x^2 + a*x^3, x], 3], 
 TapComment["The degree of a polynomial:"], 
 TapTestSame[Exponent[(x^2 + 1)^3 + 1, x], 6], 
 TapComment["Exponents may be rational numbers or symbolic expressions:"], 
 TapTestSame[Exponent[x^(n + 1) + 2*Sqrt[x] + 1, x], Max[1/2, 1 + n]], 
 TapComment["The lowest exponent in a polynomial:"], 
 TapTestSame[Exponent[(x^2 + 1)^3 - 1, x, Min], 2], 
 TapComment["The list of all exponents with which x appears:"], 
 TapTestSame[Exponent[1 + x^2 + a*x^3, x, List], {0, 2, 3}], 
 TapComment["The degree of a polynomial over the integers modulo 2:"], 
 TapTestSame[Exponent[2*x^2 - x + 1, x, Modulus -> 2], 1], 
 TapComment["With \
RefLink[Trig,paclet:ref/Trig]->RefLink[True,paclet:ref/True], \
RefLink[Exponent,paclet:ref/Exponent] recognizes dependencies between \
trigonometric functions:"], TapTestSame[Exponent[Tan[x], Cos[x], 
   Trig -> True], -1], TapTestSameBROKEN[LeadingCoefficient[2 + 3*x + 17*x^5, 
   x], 17], TapTestSameBROKEN[LeadingTerm[2 + 3*x + 17*x^5, x], 17*x^5], 
 TapTestSameBROKEN[Exponent[f, x], 5], 
 TapComment["Use RefLink[Solve,paclet:ref/Solve] to find the roots:"], 
 TapTestSameBROKEN[Length[x /. Solve[f == 0, x]], 5], 
 TapTestSameBROKEN[Exponent[f, x], 14], TapTestSameBROKEN[
  Length[CoefficientList[f, x]], 15], TapTestSameBROKEN[Exponent[f, x], 2], 
 TapTestSameBROKEN[Exponent[RootReduce[f], x], 1]]
