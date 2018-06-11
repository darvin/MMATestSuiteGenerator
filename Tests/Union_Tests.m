(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Give a sorted list of distinct elements:"], 
 TapTestSame[Union[{1, 2, 1, 3, 6, 2, 2}], {1, 2, 3, 6}], 
 TapComment["Give a sorted list of distinct elements from all the lists:"], 
 TapTestSame[Union[{a, b, a, c}, {d, a, e, b}, {c, a}], {a, b, c, d, e}], 
 TapComment["Enter using Esc\\[ThinSpace]un\\[ThinSpace]Esc:"], 
 TapTestSame[Union[{a, b, c}, {b, c, d}], {a, b, c, d}], 
 TapComment["Give a list of the distinct lists:"], 
 TapTestSame[Union[{{1, 2}, {1, 2, 3}}, {{2, 1}, {1, 2}}, 
   {{3, 2, 1}, {1, 2, 3}}], {{1, 2}, {2, 1}, {1, 2, 3}, {3, 2, 1}}], 
 TapComment["RefLink[Union,paclet:ref/Union] works with any head, not just \
RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Union[f[a, b], f[c, a], f[b, b, a]], f[a, b, c]], 
 TapComment["Use equivalence classes based on absolute value: "], 
 TapTestSame[Union[{2, -2, 1, 3, 1}, SameTest -> (Abs[#1] == Abs[#2] & )], 
  {-2, 1, 3}], TapComment[
  "Use equivalence classes based on RefLink[Floor,paclet:ref/Floor]:"], 
 TapTestSame[Union[{1.1, 3.4, 0.5, 7.6, 7.1, 1.9}, 
   SameTest -> (Floor[#1] == Floor[#2] & )], {0.5, 1.1, 3.4, 7.1}], 
 TapComment["Use RefLink[Total,paclet:ref/Total] of list elements:"], 
 TapTestSame[Union[{{1, 2}, {3}, {4, 5, 6}, {9, 6}}, 
   SameTest -> (Total[#1] == Total[#2] & )], {{3}, {9, 6}}], 
 TapComment["Use equality of last and first elements:"], 
 TapTestSame[Union[{{1, 2}, {2, 1}, {3, 2, 1}, {3}, {4, 5}, {5, 4, 3, 2, 1}}, 
   SameTest -> (First[#1] == Last[#2] & )], {{3}, {1, 2}, {4, 5}}], 
 TapComment["Find divisors that occur in any of 10, 12, and 20:"], 
 TapTestSame[Union[Divisors[10], Divisors[12], Divisors[20]], 
  {1, 2, 3, 4, 5, 6, 10, 12, 20}], TapComment["Find all the triples of bits \
that occur in the binary decomposition of 10!:"], 
 TapTestSame[Union[Partition[IntegerDigits[10!, 2], 3, 1]], 
  {{0, 0, 0}, {0, 1, 0}, {0, 1, 1}, {1, 0, 0}, {1, 0, 1}, {1, 1, 0}, 
   {1, 1, 1}}], TapComment["Find the distinct elements in the iteration:"], 
 TapTestSame[Union[NestList[Mod[5*#1, 11] & , 1, 100]], {1, 3, 4, 5, 9}], 
 TapComment["Find what options are used by a list of functions:"], 
 TapTestSame[Union[Flatten[(Options[#1][[All,1]] & ) /@ 
     {FindFit, FindMinimum, FindRoot}]], {AccuracyGoal, Compiled, 
   DampingFactor, Evaluated, EvaluationMonitor, Gradient, Jacobian, 
   MaxIterations, Method, NormFunction, PrecisionGoal, StepMonitor, 
   WorkingPrecision}], TapComment[
  "Split on the sorted set gives lists of the same elements:"], 
 TapTestSameBROKEN[ints = RandomInteger[9, 10], 
  {0, 3, 1, 7, 1, 4, 7, 0, 9, 5}], TapTestSameBROKEN[
  splits = Split[Sort[ints]], {{0, 0}, {1, 1}, {3}, {4}, {5}, {7, 7}, {9}}], 
 TapComment["The union is equivalent to the first elements of these lists:"], 
 TapTestSame[Union[ints] === splits[[All,1]], True], 
 TapComment["RefLink[Tally,paclet:ref/Tally] gets the count of identical \
elements and returns them in the original order:"], 
 TapTestSameBROKEN[ints = RandomInteger[9, 10], 
  {0, 4, 7, 0, 6, 1, 3, 0, 1, 5}], TapTestSameBROKEN[tally = Tally[ints], 
  {{0, 3}, {4, 1}, {7, 1}, {6, 1}, {1, 2}, {3, 1}, {5, 1}}], 
 TapComment["The union is the sorted list of the elements returned by \
RefLink[Tally,paclet:ref/Tally]:"], 
 TapTestSame[Union[ints] === Sort[tally[[All,1]]], True], 
 TapComment["For large sets RefLink[Union,paclet:ref/Union] may be slow with \
RefLink[SameTest,paclet:ref/SameTest] since it requires all pairwise \
comparisons:"], TapTestSameBROKEN[ints = RandomInteger[1000, 1000] ;; 
    Timing[Length[u = Union[ints, SameTest -> 
         (Floor[#1/2] == Floor[#2/2] & )]]], {0.719, 429}], 
 TapComment["When equivalence class representatives can be found, it may be \
faster to use RefLink[Union,paclet:ref/Union] on these:"], 
 TapTestSameBROKEN[Timing[Length[fu = 2*Union[Floor[ints/2]]]], {0., 429}], 
 TapComment[
  "The results are the same except for the choice of representative:"], 
 TapTestSameBROKEN[Union[u - fu], {0, 1}]]
