(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether a list is free of 0:"], 
 TapTestSame[FreeQ[{1, 2, 4, 1, 0}, 0], False], 
 TapComment["RefLink[FreeQ,paclet:ref/FreeQ] normally tests all levels in an \
expression:"], TapTestSame[FreeQ[{{1, 1, 3, 0}, {2, 1, 2, 2}}, 0], False], 
 TapComment["RefLink[FreeQ,paclet:ref/FreeQ] works with patterns:"], 
 TapTestSame[FreeQ[{a, b, b, a, a, a}, _Integer], True], 
 TapTestSame[FreeQ[{x^2, y^3, x^5, x^6}, y^_], False], 
 TapTestSameBROKEN[{f[3*x, x], f[a*x, x], f[(1 + x)*x, x]}, 
  {3*f[x, x], a*f[x, x], f[x*(1 + x), x]}], 
 TapComment["Test which integrals are free of logarithms:"], 
 TapTestSame[Table[FreeQ[Integrate[x^n, x], Log], {n, -5, 5}], 
  {True, True, True, True, False, True, True, True, True, True, True}]]
