(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Generate a symbolic continued fraction:"], 
 ESameTest[t = x; Do[t = 1/(1 + t), {5}]; t, 
  1/(1 + 1/(1 + 1/(1 + 1/(1 + 1/(1 + x)))))], 
 ESameTest[Nest[1/(1 + #1) & , x, 5], 
  1/(1 + 1/(1 + 1/(1 + 1/(1 + 1/(1 + x)))))], 
 EComment["Build up a list of primes:"], 
 ESameTest[t = {}; Do[If[PrimeQ[2^n - 1], AppendTo[t, n]], {n, 100}]; t, 
  {2, 3, 5, 7, 13, 17, 19, 31, 61, 89}], EComment["Alternatively use \
RefLink[Reap,paclet:ref/Reap] and RefLink[Sow,paclet:ref/Sow]:"], 
 ESameTest[Reap[Do[If[PrimeQ[2^n - 1], Sow[n]], {n, 100}]][[2,1]], 
  {2, 3, 5, 7, 13, 17, 19, 31, 61, 89}], 
 ESameTestBROKEN[upperTriangularLinearSolve[{{1, 2}, {0, 3}}, {1, 2}], 
  {-(1/3), 2/3}], ESameTestBROKEN[
  {l, u} = lu[{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}], 
  {{{1, 0, 0}, {4, 1, 0}, {7, 2, 1}}, {{1, 2, 3}, {0, -3, -6}, {0, 0, 0}}}], 
 ESameTestBROKEN[l . u, {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}], 
 EComment["The selection sort algorithm:"], 
 ESameTestBROKEN[list = RandomSample[Range[10], 10], 
  {5, 7, 1, 10, 4, 9, 6, 3, 2, 8}], 
 ESameTest[Do[If[list[[i]] > list[[j]], list[[{i, j}]] = list[[{j, i}]]], 
    {i, Length[list]}, {j, i + 1, Length[list]}]; list, 
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}]]
