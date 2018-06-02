(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Obtain tallies for a list of symbols:"], 
 ESameTest[Tally[{a, a, b, a, c, b, a}], {{a, 4}, {b, 2}, {c, 1}}], 
 EComment["Use test argument to count expressions with the same \
RefLink[Head,paclet:ref/Head]:"], 
 ESameTest[Tally[{{a, b}, {w, x, y, z}, E, {w, x, y, z}, E}, 
   Head[#1] === Head[#2] & ], {{{a, b}, 3}, {E, 2}}], 
 EComment["Results are returned in order of first occurrence in the list:"], 
 ESameTest[Tally[{b, a, b, a, c, b, a}], {{b, 3}, {a, 3}, {c, 1}}], 
 EComment["Count the instances of randomly generated integers:"], 
 ESameTestBROKEN[Tally[RandomInteger[10, 50]], {{7, 9}, {2, 6}, {0, 6}, 
   {8, 2}, {6, 4}, {5, 2}, {10, 5}, {1, 2}, {3, 3}, {4, 4}, {9, 7}}], 
 EComment["Elements of the list can be any expression:"], 
 ESameTest[Tally[{{a, b}, {w, x, y, z}, E, {w, x, y, z}, E}], 
  {{{a, b}, 1}, {{w, x, y, z}, 2}, {E, 2}}], 
 ESameTestBROKEN[HoldComplete[Tally[Characters[s]]], $Failed], 
 EComment["Elements with highest frequencies are given by \
RefLink[Commonest,paclet:ref/Commonest]:"], 
 ESameTest[Tally[{b, a, c, b, a, c, b, a}], {{b, 3}, {a, 3}, {c, 2}}], 
 ESameTest[Commonest[{b, a, c, b, a, c, b, a}], {b, a}], 
 EComment["A sorted RefLink[Tally,paclet:ref/Tally] is equivalent to a list \
of counts for the RefLink[Union,paclet:ref/Union]:"], 
 ESameTest[Sort[Tally[{b, a, c, b, a, c, b, a}]], {{a, 3}, {b, 3}, {c, 2}}], 
 ESameTest[({#1, Count[{b, a, c, b, a, c, b, a}, #1]} & ) /@ 
   Union[{b, a, c, b, a, c, b, a}], {{a, 3}, {b, 3}, {c, 2}}], 
 EComment["RefLink[Tally,paclet:ref/Tally] is a discrete analog of \
RefLink[BinCounts,paclet:ref/BinCounts]:"], 
 ESameTestBROKEN[data = RandomReal[10, 20], {5.2463, 6.90299, 2.04446, 
   1.00571, 0.744409, 0.595887, 1.04772, 0.345916, 9.45821, 3.81133, 5.64206, 
   0.759455, 5.38873, 2.11686, 1.68955, 9.9494, 0.99969, 3.97087, 3.95308, 
   7.51713}], ESameTestBROKEN[Sort[Tally[Ceiling[data]]], 
  {{1, 5}, {2, 3}, {3, 2}, {4, 3}, {6, 3}, {7, 1}, {8, 1}, {10, 2}}], 
 ESameTestBROKEN[BinCounts[data, {0, 10}], {5, 3, 2, 3, 0, 3, 1, 1, 0, 2}]]
