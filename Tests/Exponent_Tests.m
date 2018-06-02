(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Find the highest exponent of x:"], 
 ESameTest[Exponent[1 + x^2 + a*x^3, x], 3], 
 EComment["The degree of a polynomial:"], 
 ESameTest[Exponent[(x^2 + 1)^3 + 1, x], 6], 
 EComment["Exponents may be rational numbers or symbolic expressions:"], 
 ESameTest[Exponent[x^(n + 1) + 2*Sqrt[x] + 1, x], Max[1/2, 1 + n]], 
 EComment["The lowest exponent in a polynomial:"], 
 ESameTest[Exponent[(x^2 + 1)^3 - 1, x, Min], 2], 
 EComment["The list of all exponents with which x appears:"], 
 ESameTest[Exponent[1 + x^2 + a*x^3, x, List], {0, 2, 3}], 
 EComment["The degree of a polynomial over the integers modulo 2:"], 
 ESameTest[Exponent[2*x^2 - x + 1, x, Modulus -> 2], 1], 
 EComment["With RefLink[Trig,paclet:ref/Trig]->RefLink[True,paclet:ref/True], \
RefLink[Exponent,paclet:ref/Exponent] recognizes dependencies between \
trigonometric functions:"], ESameTest[Exponent[Tan[x], Cos[x], Trig -> True], 
  -1], ESameTestBROKEN[LeadingCoefficient[2 + 3*x + 17*x^5, x], 17], 
 ESameTestBROKEN[LeadingTerm[2 + 3*x + 17*x^5, x], 17*x^5], 
 ESameTestBROKEN[Exponent[f, x], 5], 
 EComment["Use RefLink[Solve,paclet:ref/Solve] to find the roots:"], 
 ESameTestBROKEN[Length[x /. Solve[f == 0, x]], 5], 
 ESameTestBROKEN[Exponent[f, x], 14], ESameTestBROKEN[
  Length[CoefficientList[f, x]], 15], ESameTestBROKEN[Exponent[f, x], 2], 
 ESameTestBROKEN[Exponent[RootReduce[f], x], 1]]
