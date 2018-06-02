(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Give a sorted list of distinct elements:"], 
 ESameTest[Union[{1, 2, 1, 3, 6, 2, 2}], {1, 2, 3, 6}], 
 EComment["Give a sorted list of distinct elements from all the lists:"], 
 ESameTest[Union[{a, b, a, c}, {d, a, e, b}, {c, a}], {a, b, c, d, e}], 
 EComment["Enter using Esc\\[ThinSpace]un\\[ThinSpace]Esc:"], 
 ESameTest[Union[{a, b, c}, {b, c, d}], {a, b, c, d}], 
 EComment["Give a list of the distinct lists:"], 
 ESameTest[Union[{{1, 2}, {1, 2, 3}}, {{2, 1}, {1, 2}}, 
   {{3, 2, 1}, {1, 2, 3}}], {{1, 2}, {2, 1}, {1, 2, 3}, {3, 2, 1}}], 
 EComment["RefLink[Union,paclet:ref/Union] works with any head, not just \
RefLink[List,paclet:ref/List]:"], 
 ESameTest[Union[f[a, b], f[c, a], f[b, b, a]], f[a, b, c]], 
 EComment["Use equivalence classes based on absolute value: "], 
 ESameTest[Union[{2, -2, 1, 3, 1}, SameTest -> (Abs[#1] == Abs[#2] & )], 
  {-2, 1, 3}], EComment[
  "Use equivalence classes based on RefLink[Floor,paclet:ref/Floor]:"], 
 ESameTest[Union[{1.1, 3.4, 0.5, 7.6, 7.1, 1.9}, 
   SameTest -> (Floor[#1] == Floor[#2] & )], {0.5, 1.1, 3.4, 7.1}], 
 EComment["Use RefLink[Total,paclet:ref/Total] of list elements:"], 
 ESameTest[Union[{{1, 2}, {3}, {4, 5, 6}, {9, 6}}, 
   SameTest -> (Total[#1] == Total[#2] & )], {{3}, {9, 6}}], 
 EComment["Use equality of last and first elements:"], 
 ESameTest[Union[{{1, 2}, {2, 1}, {3, 2, 1}, {3}, {4, 5}, {5, 4, 3, 2, 1}}, 
   SameTest -> (First[#1] == Last[#2] & )], {{3}, {1, 2}, {4, 5}}], 
 EComment["Find divisors that occur in any of 10, 12, and 20:"], 
 ESameTest[Union[Divisors[10], Divisors[12], Divisors[20]], 
  {1, 2, 3, 4, 5, 6, 10, 12, 20}], EComment["Find all the triples of bits \
that occur in the binary decomposition of 10!:"], 
 ESameTest[Union[Partition[IntegerDigits[10!, 2], 3, 1]], 
  {{0, 0, 0}, {0, 1, 0}, {0, 1, 1}, {1, 0, 0}, {1, 0, 1}, {1, 1, 0}, 
   {1, 1, 1}}], EComment["Find the distinct elements in the iteration:"], 
 ESameTest[Union[NestList[Mod[5*#1, 11] & , 1, 100]], {1, 3, 4, 5, 9}], 
 EComment["Find what options are used by a list of functions:"], 
 ESameTest[Union[Flatten[(Options[#1][[All,1]] & ) /@ 
     {FindFit, FindMinimum, FindRoot}]], {AccuracyGoal, Compiled, 
   DampingFactor, Evaluated, EvaluationMonitor, Gradient, Jacobian, 
   MaxIterations, Method, NormFunction, PrecisionGoal, StepMonitor, 
   WorkingPrecision}], 
 EComment["Split on the sorted set gives lists of the same elements:"], 
 ESameTestBROKEN[ints = RandomInteger[9, 10], {0, 3, 1, 7, 1, 4, 7, 0, 9, 
   5}], ESameTestBROKEN[splits = Split[Sort[ints]], 
  {{0, 0}, {1, 1}, {3}, {4}, {5}, {7, 7}, {9}}], 
 EComment["The union is equivalent to the first elements of these lists:"], 
 ESameTest[Union[ints] === splits[[All,1]], True], 
 EComment["RefLink[Tally,paclet:ref/Tally] gets the count of identical \
elements and returns them in the original order:"], 
 ESameTestBROKEN[ints = RandomInteger[9, 10], {0, 4, 7, 0, 6, 1, 3, 0, 1, 
   5}], ESameTestBROKEN[tally = Tally[ints], {{0, 3}, {4, 1}, {7, 1}, {6, 1}, 
   {1, 2}, {3, 1}, {5, 1}}], EComment["The union is the sorted list of the \
elements returned by RefLink[Tally,paclet:ref/Tally]:"], 
 ESameTest[Union[ints] === Sort[tally[[All,1]]], True], 
 ESameTestBROKEN[
  Timing[Length[u = Union[ints, SameTest -> 
       (Floor[#1/2] == Floor[#2/2] & )]]], {0.719, 429}], 
 EComment["When equivalence class representatives can be found, it may be \
faster to use RefLink[Union,paclet:ref/Union] on these:"], 
 ESameTestBROKEN[Timing[Length[fu = 2*Union[Floor[ints/2]]]], {0., 429}], 
 EComment[
  "The results are the same except for the choice of representative:"], 
 ESameTestBROKEN[Union[u - fu], {0, 1}]]
