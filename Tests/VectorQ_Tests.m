(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test whether an object is a vector:"], 
 ESameTest[VectorQ[{a, b, c}], True], 
 ESameTest[VectorQ[SparseArray[{{1} -> a, {5} -> b}]], True], 
 EComment["These are not vectors: "], ESameTest[VectorQ[{{1}, {2}}], False], 
 ESameTest[VectorQ[vector], False], 
 EComment["Use specific tests to generalize or specialize:"], 
 ESameTest[VectorQ[{{1}, {2, 3}}, ListQ], True], 
 ESameTest[VectorQ[{a, 1.2}, NumericQ], False], 
 EComment["Test for a vector of integers:"], 
 ESameTest[VectorQ[Range[10], IntegerQ], True], 
 EComment["Test for a vector of machine-real numbers:"], 
 ESameTest[VectorQ[Range[10], MachineNumberQ], False], 
 ESameTest[VectorQ[N[Range[10]], MachineNumberQ], True], 
 EComment["Test for a vector of real-valued numeric quantities:"], 
 ESameTest[VectorQ[{1, Pi, Sin[1], Sqrt[2]}, NumericQ[#1] && Im[#1] == 0 & ], 
  True], EComment["Faster test for explicit real-valued numbers:"], 
 ESameTest[VectorQ[{1, N[Pi], Sin[1.], 3/4}, 
   NumberQ[#1] &&  !MatchQ[#1, _Complex] & ], True], 
 EComment[
  "Numerically find the minimum of the functions with n components:"], 
 ESameTestBROKEN[TableForm[
   Quiet[Table[FindMinimum[f[v], {v, RandomReal[1, n]}], {n, 1, 5}]]], 
  (5.55905*v)/10^17 -> ({1.}*2.86365*v)/10^15 -> 
    ({1., 1.}*2.92116*v)/10^15 -> ({1., 1., 2.}*5.37532*v)/10^13 -> 
      ({1., 1., 2., 4.}*5.36966*v)/10^13 -> {1., 1., 2., 4., 3.}], 
 ESameTestBROKEN[{VectorQ[v], ArrayQ[v, 1]}, {True, True}], 
 ESameTestBROKEN[{VectorQ[v, NumericQ], ArrayQ[v, 1, NumericQ]}, 
  {True, True}], ESameTest[{VectorQ[v, Im[#1] == 0 & ], 
   ArrayQ[v, 1, Im[#1] == 0 & ]}, {False, False}], 
 EComment["A function equivalent to RefLink[VectorQ,paclet:ref/VectorQ]: "], 
 ESameTest[testf = MatchQ[#1, {(args___)?( !ListQ[#1] & )}] & , 
  MatchQ[#1, {(args___)?( !ListQ[#1] & )}] & ], 
 ESameTestBROKEN[TableForm[Table[{v, VectorQ[v], testf[v]}, {v, vectors}], 
   TableDepth -> 2], {}*True*True*{1, 2}*True*True*{1, {2}}*False*False*
   {{1, 2}}*False*False]]
