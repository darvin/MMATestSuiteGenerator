(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Assign l to a list:"], TapTestSame[l = {1, 2, 4, 9}, 
  {1, 2, 4, 9}], TapComment[
  "Include a new value at the beginning of the list:"], 
 TapTestSame[PrependTo[l, 0], {0, 1, 2, 4, 9}], 
 TapComment["The value assigned to l has changed:"], 
 TapTestSame[l, {0, 1, 2, 4, 9}], 
 TapComment["Prepend to an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[x = \[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
  \[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation]], 
 TapTestSame[AppendTo[x, 3 -> c], \[LeftAssociation] 1 -> a, 2 -> b, 
   3 -> c \[RightAssociation]], TapTestSame[PrependTo[x, 4 -> d], 
  \[LeftAssociation] 4 -> d, 1 -> a, 2 -> b, 3 -> c \[RightAssociation]], 
 TapComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 TapTestSame[e = f[a, b, c]; PrependTo[e, x + y], f[x + y, a, b, c]], 
 TapComment["This assigns s to a sparse matrix:"], 
 TapTestSameBROKEN[HoldComplete[s = SparseArray[{{i_, i_} -> i}, 3]], 
  $Failed], TapComment["Add a row to the top of the matrix:"], 
 TapTestSameBROKEN[HoldComplete[PrependTo[s, {1, 2, 3}]], $Failed], 
 TapComment["Prepending an element with inconsistent dimensions requires \
converting to ordinary lists:"], TapTestSame[PrependTo[s, {4, 5}], 
  {{4, 5}, {1, 2, 3}, {1, 0, 0}, {0, 2, 0}, {0, 0, 3}}], 
 TapComment["Prepend a row to m:"], TapTestSameBROKEN[PrependTo[m, {1, 2}], 
  {{1, 2}, {a, b}, {c, d}}], TapComment["Prepend a column to m:"], 
 TapTestSameBROKEN[col = {3, 4, 5}; Table[PrependTo[m[[i]], col[[i]]], 
    {i, 3}], {{3, 1, 2}, {4, a, b}, {5, c, d}}], 
 TapComment["m is now a 3*3 matrix:"], TapTestSameBROKEN[m, 
  {{3, 1, 2}, {4, a, b}, {5, c, d}}], 
 TapComment["The first argument must be a variable:"], 
 TapTestSame[PrependTo[{1, 2}, 3], PrependTo[{1, 2}, 3]], 
 TapComment["The first argument must be a variable with a value:"], 
 TapTestSame[PrependTo[k, 2], PrependTo[k, 2]], 
 TapComment["The first argument must be assigned to something which can be \
prepended to:"], TapTestSame[k = 1; PrependTo[k, 2], PrependTo[k, 2]], 
 TapComment["Something for which RefLink[AtomQ,paclet:ref/AtomQ] is \
RefLink[True,paclet:ref/True] cannot be prepended to:"], 
 TapTestSame[AtomQ[k], True], TapComment["Using \
RefLink[PrependTo,paclet:ref/PrependTo] to accumulate values in large loops \
can be slow:"], TapTestSameBROKEN[
  BlockRandom[Timing[a = {}; sum = 0; While[sum < 10^4, 
      r = RandomReal[]; sum += r; PrependTo[a, r]]; Length[a]]], 
  {18.227, 20069}], TapComment["There are many alternatives, such as using \
RefLink[Reap,paclet:ref/Reap] and RefLink[Sow,paclet:ref/Sow]:"], 
 TapTestSameBROKEN[BlockRandom[
   Timing[sum = 0; {r, {a}} = Reap[While[sum < 10^4, r = RandomReal[]; 
         sum += r; Sow[r]]]; a = Reverse[a]; Length[a]]], {0.27, 20069}]]
