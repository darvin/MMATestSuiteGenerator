(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Enter an integer:"], TapTestSame[-12, -12], 
 TapComment["RefLink[Integer,paclet:ref/Integer] is the \
RefLink[Head,paclet:ref/Head] used for integers:"], 
 TapTestSameBROKEN[Head[%], Integer], 
 TapComment["Enter a very large integer:"], 
 TapTestSame[
  308301830183093810389108725092184914914891917449832749872947298472, 
  308301830183093810389108725092184914914891917449832749872947298472], 
 TapComment["Enter an integer in base 2:"], TapTestSame[6455773865180671, 
  6455773865180671], TapComment["Enter an integer in hexadecimal:"], 
 TapTestSame[4000, 4000], TapComment["Format an integer using base 2: "], 
 TapTestSame[BaseForm[6455773865180671, 2], 
  Subscript[10110111011110111110111111011111110111111110111111111, 2]], 
 TapComment["_Integer can be used to stand for an integer in a pattern:"], 
 TapTestSame[MatchQ[1234, _Integer], True], 
 TapComment["A rule that replaces integers with their reciprocals:"], 
 TapTestSame[f[3, g[-4]] /. x_Integer -> 1/x, f[1/3, g[-(1/4)]]], 
 TapComment["Define a function that only works for integers:"], 
 TapTestSame[divisibleby3[x_Integer] := Mod[x, 3] == 0; 
   divisibleby3 /@ {123, -40, 3.14}, {True, False, divisibleby3[3.14]}], 
 TapComment["Define a function that has a special case for integers:"], 
 TapTestSame[fd[x_, k_, d_Integer] = D[x^k, x], k*x^(-1 + k)], 
 TapComment["Make a surface plot of the fractional derivative of x^k at x=1 \
as a function of k and order:"], TapTestSameBROKEN[
  HoldComplete[Plot3D[fd[1, k, d], {k, 0, 2}, {d, 0, 5}, PlotRange -> All]], 
  $Failed], TapComment["Integers are numbers:"], 
 TapTestSame[NumberQ[1234], True], 
 TapComment["Integers are atomic objects with no subexpressions:"], 
 TapTestSame[AtomQ[1234], True], TapComment["Use \
RefLink[Integers,paclet:ref/Integers] to represent assumptions and indicate \
domain conditions: "], TapTestSame[Reduce[x^1000 - 2*x^777 + 1 == 0, x, 
   Integers], x == 1]]
