(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Make a vector of 10 c's:"], 
 ESameTest[ConstantArray[c, 10], {c, c, c, c, c, c, c, c, c, c}], 
 EComment["Make a 3*4 array of c's:"], ESameTest[ConstantArray[c, {3, 4}], 
  {{c, c, c, c}, {c, c, c, c}, {c, c, c, c}}], 
 EComment["A machine-zero vector:"], ESameTest[ConstantArray[0., 10], 
  {0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}], 
 EComment["A vector of exact zeros:"], ESameTest[ConstantArray[0, 10], 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}], EComment["A machine-zero matrix:"], 
 ESameTest[zm = ConstantArray[0., {3, 3}], {{0., 0., 0.}, {0., 0., 0.}, 
   {0., 0., 0.}}], EComment["A matrix of exact zeros:"], 
 ESameTest[ConstantArray[0, {3, 3}], {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}}], 
 EComment["A vector of ones:"], ESameTest[ConstantArray[1, 10], 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}], 
 EComment["A machine-number vector of ones:"], 
 ESameTest[ConstantArray[1., 10], {1., 1., 1., 1., 1., 1., 1., 1., 1., 1.}], 
 EComment["A deeply nested constant array:"], 
 ESameTest[ConstantArray[x, {2, 1, 2, 1, 2}], {{{{{x, x}}, {{x, x}}}}, 
   {{{{x, x}}, {{x, x}}}}}], ESameTestBROKEN[
  HoldComplete[ListPlot[sol, DataRange -> {0, 1}]], $Failed], 
 EComment["Find the sum of the elements in a list:"], 
 ESameTestBROKEN[list = RandomInteger[9, 20], {4, 0, 2, 3, 9, 3, 2, 9, 8, 2, 
   2, 7, 1, 6, 7, 9, 2, 3, 1, 1}], ESameTestBROKEN[
  list . ConstantArray[1, Length[list]], 81], 
 EComment["This can also be done with RefLink[Total,paclet:ref/Total]:"], 
 ESameTestBROKEN[Total[list], 81], EComment["Use a vector of ones to see the \
effects of conditioning on the solution of a linear system:"], 
 ESameTest[ones = ConstantArray[1, 10], {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}], 
 EComment["The solution at machine precision has significant errors:"], 
 ESameTestBROKEN[x = LinearSolve[N[m], b], {1., 1., 1., 0.999971, 1.00014, 
   0.999631, 1.0006, 0.999422, 1.0003, 0.999934}], 
 ESameTestBROKEN[Norm[x - ones], 0.00097329], 
 EComment["At higher precision, the solution is much better:"], 
 ESameTestBROKEN[x30 = LinearSolve[N[m, 30], b]; 
   Norm[Block[{$MaxPrecision = 30, $MinPrecision = 30}, x30 - ones]], 
  3.42707739967263571112712880383`29.5349239129712/10^36], 
 EComment["RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims] has \
RefLink[Dimensions,paclet:ref/Dimensions][dims]:"], 
 ESameTestBROKEN[dims = RandomInteger[{1, 4}, 5], {3, 1, 3, 4, 3}], 
 ESameTestBROKEN[Dimensions[ConstantArray[c, dims]], {3, 1, 3, 4, 3}], 
 ESameTestBROKEN[HoldComplete[s = SparseArray[{}, dims, c]], $Failed], 
 ESameTest[ConstantArray[c, dims] == s, True], 
 EComment["RefLink[Normal,paclet:ref/Normal][s] is identical to \
RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims]:"], 
 ESameTest[ConstantArray[c, dims] === Normal[s], True], 
 ESameTest[ConstantArray[c, dims] === (Table[c, ##1] & ) @@ List /@ dims, 
  True]]
