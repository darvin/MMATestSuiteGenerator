(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find which elements in the first list are not in any of \
the subsequent lists:"], TapTestSame[Complement[{a, b, c, d, e}, {a, c}, 
   {d}], {b, e}], TapComment["RefLink[Complement,paclet:ref/Complement] works \
with any head, not just RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Complement[f[a, b, c, d], f[c, a], f[b, b, a]], f[d]], 
 TapComment["Use equivalence classes based on absolute value: "], 
 TapTestSame[Complement[{2, -2, 1, 3}, {2, 1, -2, -1}, 
   SameTest -> (Abs[#1] == Abs[#2] & )], {3}], 
 TapComment[
  "Use equivalence classes based on RefLink[Floor,paclet:ref/Floor]:"], 
 TapTestSame[Complement[{1.1, 3.4, 0.5, 7.6, 7.1, 1.9}, {1.2, 3.3, 1.3}, 
   SameTest -> (Floor[#1] == Floor[#2] & )], {0.5, 7.1}], 
 TapComment["Use RefLink[Total,paclet:ref/Total] of list elements:"], 
 TapTestSame[Complement[{{1, 2}, {3}, {4, 5, 6}, {9, 5}}, 
   {{2, 1}, {8, 4, 3}}, SameTest -> (Total[#1] == Total[#2] & )], {{9, 5}}], 
 TapComment["Find divisors of 20 that are not also divisors of 12:"], 
 TapTestSame[Complement[Divisors[20], Divisors[12]], {5, 10, 20}], 
 TapComment["Find which triples of digits do not occur in the binary \
decomposition of 12345:"], TapTestSame[Complement[Tuples[{0, 1}, 3], 
   Partition[IntegerDigits[12345, 2], 3, 1]], {{0, 1, 0}, {1, 0, 1}}], 
 TapComment["Find which options to RefLink[Plot,paclet:ref/Plot] are not also \
options to RefLink[Graphics,paclet:ref/Graphics]:"], 
 TapTestSameBROKEN[Complement[First /@ Options[Plot], 
   First /@ Options[Graphics]], {ClippingStyle, ColorFunction, 
   ColorFunctionScaling, Evaluated, EvaluationMonitor, Exclusions, 
   ExclusionsStyle, Filling, FillingStyle, MaxRecursion, Mesh, MeshFunctions, 
   MeshShading, MeshStyle, PerformanceGoal, PlotPoints, PlotStyle, 
   RegionFunction, WorkingPrecision}], TapComment["Find which length-5 \
sequences never occur after 2 steps in any elementary cellular automaton:"], 
 TapTestSame[Complement[Tuples[{0, 1}, 5], 
   Table[Last[CellularAutomaton[i, {{1}, 0}, {2, All}]], {i, 0, 255}]], 
  {{0, 1, 1, 0, 1}, {1, 0, 1, 1, 0}}]]
