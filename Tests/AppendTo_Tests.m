(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Assign l to a list:"], TapTestSame[l = {1, 2, 4, 9}, 
  {1, 2, 4, 9}], TapComment["Include a new value at the end of the list:"], 
 TapTestSame[AppendTo[l, 16], {1, 2, 4, 9, 16}], 
 TapComment["The value assigned to l has changed:"], 
 TapTestSame[l, {1, 2, 4, 9, 16}], 
 TapComment["Append to an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[x = \[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
  \[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation]], 
 TapTestSame[AppendTo[x, 3 -> c], \[LeftAssociation] 1 -> a, 2 -> b, 
   3 -> c \[RightAssociation]], TapTestSame[PrependTo[x, 4 -> d], 
  \[LeftAssociation] 4 -> d, 1 -> a, 2 -> b, 3 -> c \[RightAssociation]], 
 TapComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 TapTestSame[e = f[a, b, c]; AppendTo[e, x + y], f[a, b, c, x + y]], 
 TapComment["This assigns s to a sparse matrix:"], 
 TapTestSameBROKEN[HoldComplete[s = SparseArray[{{i_, i_} -> i}, 3]], 
  $Failed], TapComment["Add a row to the matrix:"], 
 TapTestSameBROKEN[HoldComplete[AppendTo[s, {1, 2, 3}]], $Failed], 
 TapComment["Appending an element with inconsistent dimensions requires \
converting to ordinary lists:"], TapTestSame[AppendTo[s, {4, 5}], 
  {{1, 0, 0}, {0, 2, 0}, {0, 0, 3}, {1, 2, 3}, {4, 5}}], 
 TapComment["Append a row to m:"], TapTestSameBROKEN[AppendTo[m, {e, f}], 
  {{a, b}, {c, d}, {e, f}}], TapComment["Append a column to m:"], 
 TapTestSameBROKEN[col = {x, y, z}; Table[AppendTo[m[[i]], col[[i]]], 
    {i, 3}], {{a, b, x}, {c, d, y}, {e, f, z}}], 
 TapComment["m is now a 3*3 matrix:"], TapTestSameBROKEN[m, 
  {{a, b, x}, {c, d, y}, {e, f, z}}], 
 TapComment["The first argument must be a variable:"], 
 TapTestSame[AppendTo[{1, 2}, 3], AppendTo[{1, 2}, 3]], 
 TapComment["The first argument must be a variable with a value:"], 
 TapTestSame[AppendTo[k, 2], AppendTo[k, 2]], 
 TapComment[
  "The first argument must be assigned to something which can be appended \
to:"], TapTestSame[k = 1; AppendTo[k, 2], AppendTo[k, 2]], 
 TapComment["Something for which  RefLink[AtomQ,paclet:ref/AtomQ] is \
RefLink[True,paclet:ref/True] cannot be appended to:"], 
 TapTestSame[AtomQ[k], True], TapComment["Using \
RefLink[AppendTo,paclet:ref/AppendTo] to accumulate values in large loops can \
be slow:"], TapTestSameBROKEN[BlockRandom[
   Timing[a = {}; sum = 0; While[sum < 10^5, r = RandomInteger[9]; sum += r; 
       AppendTo[a, r]]; Length[a]]], {3.425, 22250}], 
 TapComment["There are many alternatives, such as using \
RefLink[Reap,paclet:ref/Reap] and RefLink[Sow,paclet:ref/Sow]:"], 
 TapTestSameBROKEN[BlockRandom[
   Timing[sum = 0; {r, {a}} = Reap[While[sum < 10^5, r = RandomInteger[9]; 
         sum += r; Sow[r]]]; Length[a]]], {0.27, 22250}]]
