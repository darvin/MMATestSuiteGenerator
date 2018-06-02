(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Expand polynomials anywhere inside an expression: "], 
 TapTestSame[ExpandAll[1/(1 + x)^3 + Sin[(1 + x)^3]], 
  1/(1 + 3*x + 3*x^2 + x^3) + Sin[1 + 3*x + 3*x^2 + x^3]], 
 TapTestSame[Expand[1/(1 + x)^3 + Sin[(1 + x)^3]], 
  1/(1 + x)^3 + Sin[(1 + x)^3]], 
 TapComment["RefLink[ExpandAll,paclet:ref/ExpandAll] goes into heads:"], 
 TapTestSame[ExpandAll[((1 + a)*(1 + b))[x]], (1 + a + b + a*b)[x]]]
