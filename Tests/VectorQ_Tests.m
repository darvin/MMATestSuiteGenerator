(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether an object is a vector:"], 
 TapTestSame[VectorQ[{a, b, c}], True], 
 TapTestSame[VectorQ[SparseArray[{{1} -> a, {5} -> b}]], True], 
 TapComment["These are not vectors: "], TapTestSame[VectorQ[{{1}, {2}}], 
  False], TapTestSame[VectorQ[vector], False], 
 TapComment["Use specific tests to generalize or specialize:"], 
 TapTestSame[VectorQ[{{1}, {2, 3}}, ListQ], True], 
 TapTestSame[VectorQ[{a, 1.2}, NumericQ], False], 
 TapComment["Test for a vector of integers:"], 
 TapTestSame[VectorQ[Range[10], IntegerQ], True], 
 TapComment["Test for a vector of machine-real numbers:"], 
 TapTestSame[VectorQ[Range[10], MachineNumberQ], False], 
 TapTestSame[VectorQ[N[Range[10]], MachineNumberQ], True], 
 TapComment["Test for a vector of real-valued numeric quantities:"], 
 TapTestSame[VectorQ[{1, Pi, Sin[1], Sqrt[2]}, 
   NumericQ[#1] && Im[#1] == 0 & ], True], 
 TapComment["Faster test for explicit real-valued numbers:"], 
 TapTestSame[VectorQ[{1, N[Pi], Sin[1.], 3/4}, 
   NumberQ[#1] &&  !MatchQ[#1, _Complex] & ], True], 
 TapComment["Numerically find the minimum of the functions with n \
components:"], TapTestSameBROKEN[
  TableForm[Quiet[Table[FindMinimum[f[v], {v, RandomReal[1, n]}], 
     {n, 1, 5}]]], (5.55905*v)/10^17 -> ({1.}*2.86365*v)/10^15 -> 
    ({1., 1.}*2.92116*v)/10^15 -> ({1., 1., 2.}*5.37532*v)/10^13 -> 
      ({1., 1., 2., 4.}*5.36966*v)/10^13 -> {1., 1., 2., 4., 3.}], 
 TapTestSameBROKEN[{VectorQ[v], ArrayQ[v, 1]}, {True, True}], 
 TapTestSameBROKEN[{VectorQ[v, NumericQ], ArrayQ[v, 1, NumericQ]}, 
  {True, True}], TapTestSame[{VectorQ[v, Im[#1] == 0 & ], 
   ArrayQ[v, 1, Im[#1] == 0 & ]}, {False, False}], 
 TapComment[
  "A function equivalent to RefLink[VectorQ,paclet:ref/VectorQ]: "], 
 TapTestSame[testf = MatchQ[#1, {(args___)?( !ListQ[#1] & )}] & , 
  MatchQ[#1, {(args___)?( !ListQ[#1] & )}] & ], 
 TapTestSameBROKEN[TableForm[Table[{v, VectorQ[v], testf[v]}, {v, vectors}], 
   TableDepth -> 2], {}*True*True*{1, 2}*True*True*{1, {2}}*False*False*
   {{1, 2}}*False*False]]
