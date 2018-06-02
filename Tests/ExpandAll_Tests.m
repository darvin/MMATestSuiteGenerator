(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Expand polynomials anywhere inside an expression: "], 
 ESameTest[ExpandAll[1/(1 + x)^3 + Sin[(1 + x)^3]], 
  1/(1 + 3*x + 3*x^2 + x^3) + Sin[1 + 3*x + 3*x^2 + x^3]], 
 ESameTest[Expand[1/(1 + x)^3 + Sin[(1 + x)^3]], 
  1/(1 + x)^3 + Sin[(1 + x)^3]], 
 EComment["RefLink[ExpandAll,paclet:ref/ExpandAll] goes into heads:"], 
 ESameTest[ExpandAll[((1 + a)*(1 + b))[x]], (1 + a + b + a*b)[x]]]
