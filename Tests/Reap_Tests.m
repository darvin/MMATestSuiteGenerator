(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Evaluate a sequence of expressions, \"reaping\" ones \
that have been \"sown\":"], TapTestSame[Reap[Sow[a]; b; Sow[c]; Sow[d]; e], 
  {e, {{a, c, d}}}], TapComment[
  "Compute a sum, \"reaping\" i^2 \"sown\" at each step:"], 
 TapTestSame[Reap[Sum[Sow[i^2] + 1, {i, 10}]], 
  {395, {{1, 4, 9, 16, 25, 36, 49, 64, 81, 100}}}], 
 TapComment["Make a separate sublist for each tag being reaped:"], 
 TapTestSame[Reap[Sow[1, {x, x}]; Sow[2, y]; Sow[3, x], {x, x, y}], 
  {3, {{{1, 1, 3}}, {{1, 1, 3}}, {{2}}}}], 
 TapComment[
  "Count the number of instances of each integer separating the negative:"], 
 TapTestSameBROKEN[Reap[Sow[1, RandomInteger[{-9, 9}, 100]], 
   {_?Negative, _?NonNegative}, #1 -> Total[#2] & ], 
  {1, {{-1 -> 4, -3 -> 5, -2 -> 5, -9 -> 6, -4 -> 4, -7 -> 3, -8 -> 3, 
     -5 -> 8, -6 -> 1}, {1 -> 7, 0 -> 7, 6 -> 6, 4 -> 7, 8 -> 9, 9 -> 2, 
     7 -> 12, 2 -> 3, 5 -> 2, 3 -> 6}}}], 
 TapComment["Apply f to each distinct tag and list of values:"], 
 TapTestSame[Reap[Sow[1, {x, x}]; Sow[2, y]; Sow[3, x], _, f], 
  {3, {f[x, {1, 1, 3}], f[y, {2}]}}], 
 TapTestSame[Reap[Sow[1, {x, x}]; Sow[2, y]; Sow[3, x], _, Rule], 
  {3, {x -> {1, 1, 3}, y -> {2}}}], TapComment["Find the unique elements in a \
list, in the order they first occur (unsorted union):"], 
 TapTestSame[Reap[Sow[1, {a, a, b, d, c, a}], _, #1 & ][[2]], {a, b, d, c}], 
 TapComment[
  "Find the list of values sampled by RefLink[Plot,paclet:ref/Plot]:"], 
 TapTestSameBROKEN[HoldComplete[
   Short[Reap[Plot[Sin[x], {x, 0, 10}, EvaluationMonitor :> Sow[x]]; ]]], 
  $Failed], TapTestSameBROKEN[unsortedUnion[{b, b, c, a, c, a, b, d}], 
  {b, c, a, d}], TapComment[
  "This is like RefLink[Union,paclet:ref/Union] without the sorting:"], 
 TapTestSame[Union[{b, b, c, a, c, a, b, d}], {a, b, c, d}], 
 TapComment["If no expressions are sown, RefLink[Reap,paclet:ref/Reap] \
returns an empty list of expressions it has reaped:"], 
 TapTestSame[Reap[x], {x, {}}], TapComment["RefLink[Reap,paclet:ref/Reap] \
collects expressions in exactly the order they are sown:"], 
 TapTestSame[Reap[Sow //@ ((a + b)*(c + x^2)); ], 
  {Null, {{a, b, a + b, c, x, 2, x^2, c + x^2, (a + b)*(c + x^2)}}}], 
 TapComment[
  "The list associated with the first tag to be encountered is given first:"]\
, TapTestSame[Reap[Sow[1, y]; Sow[2, x]; Sow[3, y]], {3, {{1, 3}, {2}}}], 
 TapTestSame[Reap[Sow[1, y]; Sow[2, x]; Sow[3, y], _, Rule], 
  {3, {y -> {1, 3}, x -> {2}}}]]
