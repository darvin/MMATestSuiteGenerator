(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Make a vector of 10 c's:"], 
 TapTestSame[ConstantArray[c, 10], {c, c, c, c, c, c, c, c, c, c}], 
 TapComment["Make a 3*4 array of c's:"], 
 TapTestSame[ConstantArray[c, {3, 4}], {{c, c, c, c}, {c, c, c, c}, 
   {c, c, c, c}}], TapComment["A machine-zero vector:"], 
 TapTestSame[ConstantArray[0., 10], {0., 0., 0., 0., 0., 0., 0., 0., 0., 
   0.}], TapComment["A vector of exact zeros:"], 
 TapTestSame[ConstantArray[0, 10], {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}], 
 TapComment["A machine-zero matrix:"], 
 TapTestSame[zm = ConstantArray[0., {3, 3}], {{0., 0., 0.}, {0., 0., 0.}, 
   {0., 0., 0.}}], TapComment["A matrix of exact zeros:"], 
 TapTestSame[ConstantArray[0, {3, 3}], {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}}], 
 TapComment["A vector of ones:"], TapTestSame[ConstantArray[1, 10], 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}], 
 TapComment["A machine-number vector of ones:"], 
 TapTestSame[ConstantArray[1., 10], {1., 1., 1., 1., 1., 1., 1., 1., 1., 
   1.}], TapComment["A deeply nested constant array:"], 
 TapTestSame[ConstantArray[x, {2, 1, 2, 1, 2}], 
  {{{{{x, x}}, {{x, x}}}}, {{{{x, x}}, {{x, x}}}}}], 
 TapComment["Numerically solve x'[t]==1/(t+x[t]^2) using Euler's method:"], 
 TapTestSameBROKEN[HoldComplete[
   sol = esteps[Function[{t, x}, 1/(t + x^2)], 1, 0.01, 100] ;; 
     ListPlot[sol, DataRange -> {0, 1}]], $Failed], 
 TapComment["Find the sum of the elements in a list:"], 
 TapTestSameBROKEN[list = RandomInteger[9, 20], 
  {4, 0, 2, 3, 9, 3, 2, 9, 8, 2, 2, 7, 1, 6, 7, 9, 2, 3, 1, 1}], 
 TapTestSameBROKEN[list . ConstantArray[1, Length[list]], 81], 
 TapComment["This can also be done with RefLink[Total,paclet:ref/Total]:"], 
 TapTestSameBROKEN[Total[list], 81], TapComment["Use a vector of ones to see \
the effects of conditioning on the solution of a linear system:"], 
 TapTestSame[ones = ConstantArray[1, 10], {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}], 
 TapComment["The solution at machine precision has significant errors:"], 
 TapTestSameBROKEN[x = LinearSolve[N[m], b], {1., 1., 1., 0.999971, 1.00014, 
   0.999631, 1.0006, 0.999422, 1.0003, 0.999934}], 
 TapTestSameBROKEN[Norm[x - ones], 0.00097329], 
 TapComment["At higher precision, the solution is much better:"], 
 TapTestSameBROKEN[x30 = LinearSolve[N[m, 30], b]; 
   Norm[Block[{$MaxPrecision = 30, $MinPrecision = 30}, x30 - ones]], 
  3.42707739967263571112712880383`29.5349239129712/10^36], 
 TapComment["RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims] has \
RefLink[Dimensions,paclet:ref/Dimensions][dims]:"], 
 TapTestSameBROKEN[dims = RandomInteger[{1, 4}, 5], {3, 1, 3, 4, 3}], 
 TapTestSameBROKEN[Dimensions[ConstantArray[c, dims]], {3, 1, 3, 4, 3}], 
 TapComment["RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims] is equal \
to RefLink[SparseArray,paclet:ref/SparseArray][{},dims,c]:"], 
 TapTestSameBROKEN[HoldComplete[dims = RandomInteger[{1, 4}, 5] ;; s = 
     SparseArray[{}, dims, c]], $Failed], 
 TapTestSameBROKEN[ConstantArray[c, dims] == s, True], 
 TapComment["RefLink[Normal,paclet:ref/Normal][s] is identical to \
RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims]:"], 
 TapTestSameBROKEN[ConstantArray[c, dims] === Normal[s], True], 
 TapComment["RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims] is \
equivalent to \
RefLink[Apply,paclet:ref/Apply][RefLink[Table,paclet:ref/Table][c,##]&,RefLin\
k[Map,paclet:ref/Map][RefLink[List,paclet:ref/List],dims]]:"], 
 TapTestSameBROKEN[dims = RandomInteger[{1, 4}, 5] ;; 
     ConstantArray[c, dims] === (Table[c, ##1] & ) @@ List /@ dims, True]]
