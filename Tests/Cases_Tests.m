(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find cases that explicitly match integers:"], 
 TapTestSame[Cases[{1, 1, f[a], 2, 3, y, f[8], 9, f[10]}, _Integer], 
  {1, 1, 2, 3, 9}], TapComment["Find cases that do not match integers:"], 
 TapTestSame[Cases[{1, 1, f[a], 2, 3, y, f[8], 9, f[10]}, Except[_Integer]], 
  {f[a], y, f[8], f[10]}], 
 TapComment["Return the x from inside each f[x_] matched:"], 
 TapTestSame[Cases[{1, 1, f[a], 2, 3, y, f[8], 9, f[10]}, f[x_] -> x], 
  {a, 8, 10}], TapComment[
  "Use the operator form of RefLink[Cases,paclet:ref/Cases]:"], 
 TapTestSame[Cases[_Integer][{1, 1, f[a], 2, 3, y, f[8], 9, f[10]}], 
  {1, 1, 2, 3, 9}], TapComment[
  "Pick elements from an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Cases[\[LeftAssociation] 1 -> "a", 2 -> "b", 3 -> c, 
    4 -> d \[RightAssociation], _Symbol], {c, d}], 
 TapComment["Find all cases of lists of two elements:"], 
 TapTestSame[Cases[{{1, 2}, {2}, {3, 4, 1}, {5, 4}, {3, 3}}, {_, _}], 
  {{1, 2}, {5, 4}, {3, 3}}], 
 TapComment["Find the sum of every pair of elements:"], 
 TapTestSame[Cases[{{1, 2}, {2}, {3, 4, 1}, {5, 4}, {3, 3}}, 
   {a_, b_} -> a + b], {3, 9, 6}], 
 TapComment["Pick out elements that are not 0:"], 
 TapTestSame[Cases[{1, 0, 2, 0, 3, 5, 6, 7, 0, 0, 0}, Except[0]], 
  {1, 2, 3, 5, 6, 7}], TapComment[
  "Pick out cases of integers down to level 2:"], 
 TapTestSame[Cases[{{1, 4, a, 0}, {b, 3, 2, 2}, {c, c, 5, 5}}, _Integer, 2], 
  {1, 4, 0, 3, 2, 2, 5, 5}], 
 TapComment["Return only the first three matching elements:"], 
 TapTestSame[Cases[Sqrt[Range[100]], _Integer, {1}, 3], {1, 2, 3}], 
 TapComment[
  "Use :> to evaluate only after explicit elements have been found:"], 
 TapTestSame[Cases[{f[{a, b}], f[{a}], g[{a}], f[{a, b, c, d}]}, 
   f[x_] :> Length[x]], {2, 1, 4}], 
 TapComment["Find all possible subexpressions at any level:"], 
 TapTestSame[Cases[{1, 2, f[a, b]}, _, {0, Infinity}], 
  {1, 2, a, b, f[a, b], {1, 2, f[a, b]}}], TapComment["Find all possible \
subexpressions at any level, including the head of the expression:"], 
 TapTestSame[Cases[{1, 2, f[a, b]}, _, {0, Infinity}, Heads -> True], 
  {List, 1, 2, f, a, b, f[a, b], {1, 2, f[a, b]}}], 
 TapComment["Pick elements from nested associations:"], 
 TapTestSame[Cases[\[LeftAssociation] 1 -> c, 
    2 -> \[LeftAssociation] 3 -> 1, 
      a -> b \[RightAssociation] \[RightAssociation], _Symbol, Infinity], 
  {c, b}], TapComment["Find symbols among the elements of an expression:"], 
 TapTestSame[Cases[{a, 5, Pi}, _Symbol], {a, Pi}], 
 TapComment["Also include the head of the expression in the search:"], 
 TapTestSame[Cases[{a, 5, Pi}, _Symbol, Heads -> True], {List, a, Pi}], 
 TapComment["RefLink[Count,paclet:ref/Count] returns the length of the result \
given by RefLink[Cases,paclet:ref/Cases]:"], 
 TapTestSame[Length[Cases[{1, "f", g, "h", "7"}, _?StringQ]], 3], 
 TapTestSame[Count[{1, "f", g, "h", "7"}, _?StringQ], 3], 
 TapComment["A rule transforms the matching elements into its right side:"], 
 TapTestSame[Cases[{1, b -> Automatic, c -> 3}, _ -> Automatic], 
  {Automatic, Automatic, Automatic}], TapComment["Use \
RefLink[HoldPattern,paclet:ref/HoldPattern] to treat the rule itself as a \
pattern:"], TapTestSame[Cases[{1, b -> Automatic, c -> 3}, 
   HoldPattern[_ -> Automatic]], {b -> Automatic}]]
