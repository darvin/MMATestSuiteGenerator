(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Total the values in a list:"], 
 TapTestSame[Total[{a, b, c, d}], a + b + c + d], 
 TapComment["Use exact arithmetic to total the values:"], 
 TapTestSameBROKEN[list = {Pi, 1, 4, E, 7, 8} ;; Total[list], 20 + E + Pi], 
 TapComment["Use machine arithmetic:"], TapTestSameBROKEN[Total[N[list]], 
  25.8599], TapComment["Use 47-digit precision arithmetic:"], 
 TapTestSameBROKEN[Total[N[list, 47]], 
  25.859874482048838473822930854632165381954416493`46.412626412582824], 
 TapComment["Total the columns of a matrix:"], 
 TapTestSameBROKEN[m = 1*2*3*4*5*6*7*8*9 ;; Total[m], {12, 15, 18}], 
 TapComment["Total the rows:"], TapTestSameBROKEN[Total[m, {2}], 
  {6, 15, 24}], TapComment["Total all the elements:"], 
 TapTestSameBROKEN[Total[m, 2], 45], 
 TapComment["Total by adding parts in the first dimension:"], 
 TapTestSame[t = Array[Subscript[a, ##1] & , {2, 3, 4}], 
  {{{Subscript[a, 1, 1, 1], Subscript[a, 1, 1, 2], Subscript[a, 1, 1, 3], 
     Subscript[a, 1, 1, 4]}, {Subscript[a, 1, 2, 1], Subscript[a, 1, 2, 2], 
     Subscript[a, 1, 2, 3], Subscript[a, 1, 2, 4]}, 
    {Subscript[a, 1, 3, 1], Subscript[a, 1, 3, 2], Subscript[a, 1, 3, 3], 
     Subscript[a, 1, 3, 4]}}, {{Subscript[a, 2, 1, 1], Subscript[a, 2, 1, 2], 
     Subscript[a, 2, 1, 3], Subscript[a, 2, 1, 4]}, 
    {Subscript[a, 2, 2, 1], Subscript[a, 2, 2, 2], Subscript[a, 2, 2, 3], 
     Subscript[a, 2, 2, 4]}, {Subscript[a, 2, 3, 1], Subscript[a, 2, 3, 2], 
     Subscript[a, 2, 3, 3], Subscript[a, 2, 3, 4]}}}], 
 TapTestSame[Total[t], {{Subscript[a, 1, 1, 1] + Subscript[a, 2, 1, 1], 
    Subscript[a, 1, 1, 2] + Subscript[a, 2, 1, 2], 
    Subscript[a, 1, 1, 3] + Subscript[a, 2, 1, 3], 
    Subscript[a, 1, 1, 4] + Subscript[a, 2, 1, 4]}, 
   {Subscript[a, 1, 2, 1] + Subscript[a, 2, 2, 1], 
    Subscript[a, 1, 2, 2] + Subscript[a, 2, 2, 2], 
    Subscript[a, 1, 2, 3] + Subscript[a, 2, 2, 3], 
    Subscript[a, 1, 2, 4] + Subscript[a, 2, 2, 4]}, 
   {Subscript[a, 1, 3, 1] + Subscript[a, 2, 3, 1], 
    Subscript[a, 1, 3, 2] + Subscript[a, 2, 3, 2], 
    Subscript[a, 1, 3, 3] + Subscript[a, 2, 3, 3], 
    Subscript[a, 1, 3, 4] + Subscript[a, 2, 3, 4]}}], 
 TapComment["Total in the last dimension only:"], 
 TapTestSame[Total[t, {-1}], 
  {{Subscript[a, 1, 1, 1] + Subscript[a, 1, 1, 2] + Subscript[a, 1, 1, 3] + 
     Subscript[a, 1, 1, 4], Subscript[a, 1, 2, 1] + Subscript[a, 1, 2, 2] + 
     Subscript[a, 1, 2, 3] + Subscript[a, 1, 2, 4], 
    Subscript[a, 1, 3, 1] + Subscript[a, 1, 3, 2] + Subscript[a, 1, 3, 3] + 
     Subscript[a, 1, 3, 4]}, {Subscript[a, 2, 1, 1] + Subscript[a, 2, 1, 2] + 
     Subscript[a, 2, 1, 3] + Subscript[a, 2, 1, 4], 
    Subscript[a, 2, 2, 1] + Subscript[a, 2, 2, 2] + Subscript[a, 2, 2, 3] + 
     Subscript[a, 2, 2, 4], Subscript[a, 2, 3, 1] + Subscript[a, 2, 3, 2] + 
     Subscript[a, 2, 3, 3] + Subscript[a, 2, 3, 4]}}], 
 TapComment["Total in the last two dimensions:"], 
 TapTestSame[Total[t, -2], {Subscript[a, 1, 1, 1] + Subscript[a, 1, 2, 1] + 
    Subscript[a, 1, 3, 1] + Subscript[a, 2, 1, 1] + Subscript[a, 2, 2, 1] + 
    Subscript[a, 2, 3, 1], Subscript[a, 1, 1, 2] + Subscript[a, 1, 2, 2] + 
    Subscript[a, 1, 3, 2] + Subscript[a, 2, 1, 2] + Subscript[a, 2, 2, 2] + 
    Subscript[a, 2, 3, 2], Subscript[a, 1, 1, 3] + Subscript[a, 1, 2, 3] + 
    Subscript[a, 1, 3, 3] + Subscript[a, 2, 1, 3] + Subscript[a, 2, 2, 3] + 
    Subscript[a, 2, 3, 3], Subscript[a, 1, 1, 4] + Subscript[a, 1, 2, 4] + 
    Subscript[a, 1, 3, 4] + Subscript[a, 2, 1, 4] + Subscript[a, 2, 2, 4] + 
    Subscript[a, 2, 3, 4]}], TapComment["Total all the elements:"], 
 TapTestSame[Total[t, Infinity], Subscript[a, 1, 1, 1] + 
   Subscript[a, 1, 1, 2] + Subscript[a, 1, 1, 3] + Subscript[a, 1, 1, 4] + 
   Subscript[a, 1, 2, 1] + Subscript[a, 1, 2, 2] + Subscript[a, 1, 2, 3] + 
   Subscript[a, 1, 2, 4] + Subscript[a, 1, 3, 1] + Subscript[a, 1, 3, 2] + 
   Subscript[a, 1, 3, 3] + Subscript[a, 1, 3, 4] + Subscript[a, 2, 1, 1] + 
   Subscript[a, 2, 1, 2] + Subscript[a, 2, 1, 3] + Subscript[a, 2, 1, 4] + 
   Subscript[a, 2, 2, 1] + Subscript[a, 2, 2, 2] + Subscript[a, 2, 2, 3] + 
   Subscript[a, 2, 2, 4] + Subscript[a, 2, 3, 1] + Subscript[a, 2, 3, 2] + 
   Subscript[a, 2, 3, 3] + Subscript[a, 2, 3, 4]], 
 TapComment["Total the last dimension in a ragged array:"], 
 TapTestSameBROKEN[a = {{1, 2, 3}, {4, 5}, {6}} ;; Total[a, {-1}], 
  {6, 9, 6}], TapComment["Total all the elements:"], 
 TapTestSameBROKEN[Total[a, Infinity], 21], TapComment["You cannot total in \
the first dimension because the lists have incompatible lengths:"], 
 TapTestSameBROKEN[Total[a], Total[{{1, 2, 3}, {4, 5}, {6}}]], 
 TapComment["Total the columns in a sparse matrix:"], 
 TapTestSameBROKEN[HoldComplete[
   s = SparseArray[{{i_, i_} -> -2, {i_, j_} /; Abs[i - j] == 1 -> 1}, 
     {10, 10}]], $Failed], TapTestSame[Total[s], 
  {-1, 0, 0, 0, 0, 0, 0, 0, 0, -1}], TapComment["Total the rows:"], 
 TapTestSame[Total[s, {2}], {-1, 0, 0, 0, 0, 0, 0, 0, 0, -1}], 
 TapComment["Total several sparse vectors:"], 
 TapTestSameBROKEN[HoldComplete[list = Table[SparseArray[{2^i} -> 1, {100}], 
     {i, 6}]], $Failed], TapTestSameBROKEN[HoldComplete[Total[list]], 
  $Failed], TapComment["Total all the elements in all the vectors:"], 
 TapTestSame[Total[list, Infinity], 6], 
 TapComment["RefLink[Total,paclet:ref/Total] works with any head:"], 
 TapTestSame[Total[f[1, 2, 1]], 4], 
 TapComment["Find the total derivative order:"], 
 TapTestSame[Total[Derivative[1, 2, 1]], 4], 
 TapComment["Use RefLink[Method,paclet:ref/Method]->\"CompensatedSummation\" \
to reduce accumulated errors in a sum:"], 
 TapTestSameBROKEN[x = ConstantArray[0.1, 10^6] ;; 
    Total[x, Method -> "CompensatedSummation"] - 10^5, 0.], 
 TapComment[
  "Without compensated summation, small errors may accumulate with each \
term:"], TapTestSameBROKEN[Total[x] - 10^5, 8.73115/10^10], 
 TapComment["Form a polynomial from monomials:"], 
 TapTestSame[Total[{x^2, 3*x^3, 1}], 1 + x^2 + 3*x^3], 
 TapComment[
  "Show that the trace of a matrix is equal to the total of its eigenvalues:"]\
, TapTestSameBROKEN[m = RandomReal[1, {10, 10}] ;; Tr[m], 4.30281], 
 TapTestSameBROKEN[Total[Eigenvalues[m]], 4.30281 + 0.*I], 
 TapComment["Search for WebLink[\"perfect\" \
numbers,http://mathworld.wolfram.com/PerfectNumber.html] equal to the sum of \
their divisors:"], TapTestSame[
  perfectQ[x_Integer] := Total[Divisors[x]] == 2*x; 
   Last[Reap[Do[If[perfectQ[x], Sow[x]], {x, 1, 10000}]]], 
  {{6, 28, 496, 8128}}], TapComment["RefLink[Total,paclet:ref/Total][list] is \
equivalent to \
RefLink[Apply,paclet:ref/Apply][RefLink[Plus,paclet:ref/Plus],list]:"], 
 TapTestSameBROKEN[list = RandomInteger[9, {10}], 
  {9, 9, 4, 2, 5, 6, 0, 3, 4, 1}], TapTestSameBROKEN[Total[list], 43], 
 TapTestSameBROKEN[Plus @@ list, 43], TapComment["RefLink[Total,paclet:ref/To\
tal][list,k] is equivalent to \
RefLink[Total,paclet:ref/Total][RefLink[Flatten,paclet:ref/Flatten][list,k-1]\
]:"], TapTestSame[t = Array[Subscript[a, ##1] & , {2, 3, 4, 2}], 
  {{{{Subscript[a, 1, 1, 1, 1], Subscript[a, 1, 1, 1, 2]}, 
     {Subscript[a, 1, 1, 2, 1], Subscript[a, 1, 1, 2, 2]}, 
     {Subscript[a, 1, 1, 3, 1], Subscript[a, 1, 1, 3, 2]}, 
     {Subscript[a, 1, 1, 4, 1], Subscript[a, 1, 1, 4, 2]}}, 
    {{Subscript[a, 1, 2, 1, 1], Subscript[a, 1, 2, 1, 2]}, 
     {Subscript[a, 1, 2, 2, 1], Subscript[a, 1, 2, 2, 2]}, 
     {Subscript[a, 1, 2, 3, 1], Subscript[a, 1, 2, 3, 2]}, 
     {Subscript[a, 1, 2, 4, 1], Subscript[a, 1, 2, 4, 2]}}, 
    {{Subscript[a, 1, 3, 1, 1], Subscript[a, 1, 3, 1, 2]}, 
     {Subscript[a, 1, 3, 2, 1], Subscript[a, 1, 3, 2, 2]}, 
     {Subscript[a, 1, 3, 3, 1], Subscript[a, 1, 3, 3, 2]}, 
     {Subscript[a, 1, 3, 4, 1], Subscript[a, 1, 3, 4, 2]}}}, 
   {{{Subscript[a, 2, 1, 1, 1], Subscript[a, 2, 1, 1, 2]}, 
     {Subscript[a, 2, 1, 2, 1], Subscript[a, 2, 1, 2, 2]}, 
     {Subscript[a, 2, 1, 3, 1], Subscript[a, 2, 1, 3, 2]}, 
     {Subscript[a, 2, 1, 4, 1], Subscript[a, 2, 1, 4, 2]}}, 
    {{Subscript[a, 2, 2, 1, 1], Subscript[a, 2, 2, 1, 2]}, 
     {Subscript[a, 2, 2, 2, 1], Subscript[a, 2, 2, 2, 2]}, 
     {Subscript[a, 2, 2, 3, 1], Subscript[a, 2, 2, 3, 2]}, 
     {Subscript[a, 2, 2, 4, 1], Subscript[a, 2, 2, 4, 2]}}, 
    {{Subscript[a, 2, 3, 1, 1], Subscript[a, 2, 3, 1, 2]}, 
     {Subscript[a, 2, 3, 2, 1], Subscript[a, 2, 3, 2, 2]}, 
     {Subscript[a, 2, 3, 3, 1], Subscript[a, 2, 3, 3, 2]}, 
     {Subscript[a, 2, 3, 4, 1], Subscript[a, 2, 3, 4, 2]}}}}], 
 TapTestSameBROKEN[Table[Total[t, k] === Total[Flatten[t, k - 1]], 
   {k, 1, ArrayDepth[t]}], {True, True, True, True}]]
