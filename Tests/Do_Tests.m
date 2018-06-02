(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Generate a symbolic continued fraction:"], 
 TapTestSame[t = x; Do[t = 1/(1 + t), {5}]; t, 
  1/(1 + 1/(1 + 1/(1 + 1/(1 + 1/(1 + x)))))], 
 TapTestSame[Nest[1/(1 + #1) & , x, 5], 
  1/(1 + 1/(1 + 1/(1 + 1/(1 + 1/(1 + x)))))], 
 TapComment["Build up a list of primes:"], 
 TapTestSame[t = {}; Do[If[PrimeQ[2^n - 1], AppendTo[t, n]], {n, 100}]; t, 
  {2, 3, 5, 7, 13, 17, 19, 31, 61, 89}], TapComment["Alternatively use \
RefLink[Reap,paclet:ref/Reap] and RefLink[Sow,paclet:ref/Sow]:"], 
 TapTestSame[Reap[Do[If[PrimeQ[2^n - 1], Sow[n]], {n, 100}]][[2,1]], 
  {2, 3, 5, 7, 13, 17, 19, 31, 61, 89}], TapTestSameBROKEN[
  upperTriangularLinearSolve[{{1, 2}, {0, 3}}, {1, 2}], {-(1/3), 2/3}], 
 TapTestSameBROKEN[{l, u} = lu[{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}], 
  {{{1, 0, 0}, {4, 1, 0}, {7, 2, 1}}, {{1, 2, 3}, {0, -3, -6}, {0, 0, 0}}}], 
 TapTestSameBROKEN[l . u, {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}], 
 TapComment["The selection sort algorithm:"], 
 TapTestSameBROKEN[list = RandomSample[Range[10], 10], 
  {5, 7, 1, 10, 4, 9, 6, 3, 2, 8}], 
 TapTestSame[Do[If[list[[i]] > list[[j]], list[[{i, j}]] = list[[{j, i}]]], 
    {i, Length[list]}, {j, i + 1, Length[list]}]; list, 
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}]]
