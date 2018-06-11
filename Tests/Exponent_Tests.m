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
   Trig -> True], -1], TapComment["Compute the leading coefficient:"], 
 TapTestSame[LeadingCoefficient[poly_, x_] := Coefficient[poly, x, 
     Exponent[poly, x]]; LeadingCoefficient[2 + 3*x + 17*x^5, x], 17], 
 TapComment["Compute the leading term:"], 
 TapTestSame[LeadingTerm[poly_, x_] := With[{n = Exponent[poly, x]}, 
     Coefficient[poly, x, n]*x^n]; LeadingTerm[2 + 3*x + 17*x^5, x], 17*x^5], 
 TapComment[
  "The number of complex roots of a polynomial is equal to its degree:"], 
 TapTestSameBROKEN[f = (x + 1)^5 - 2*x + 3 ;; Exponent[f, x], 5], 
 TapComment["Use RefLink[Solve,paclet:ref/Solve] to find the roots:"], 
 TapTestSame[Length[x /. Solve[f == 0, x]], 5], 
 TapComment["Length of the \
RefLink[CoefficientList,paclet:ref/CoefficientList] of a polynomial is one \
more than its degree:"], TapTestSameBROKEN[
  f = (x^2 + 2*x - 1)^7 - 3 ;; Exponent[f, x], 14], 
 TapTestSameBROKEN[Length[CoefficientList[f, x]], 15], 
 TapComment["RefLink[Exponent,paclet:ref/Exponent] is purely syntactical; it \
does not attempt to recognize zero coefficients:"], 
 TapTestSameBROKEN[zero = Sqrt[2] + Sqrt[3] - Sqrt[5 + 2*Sqrt[6]]; 
   f = zero*x^2 + x + 1 ;; Exponent[f, x], 2], 
 TapTestSameBROKEN[Exponent[RootReduce[f], x], 1]]
