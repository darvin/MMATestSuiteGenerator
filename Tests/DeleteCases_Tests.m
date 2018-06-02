(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Delete cases that match integers:"], 
 TapTestSame[DeleteCases[{1, 1, x, 2, 3, y, 9, y}, _Integer], {x, y, y}], 
 TapComment["Use the operator form:"], 
 TapTestSame[DeleteCases[_Integer][{1, 1, x, 2, 3, y, 9, y}], {x, y, y}], 
 TapComment[
  "Delete elements from RefLink[Association,paclet:ref/Association]:"], 
 TapTestSameBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, "b" -> 2, 
    c -> "3", d -> 4 \[RightAssociation], _Integer], 
  \[LeftAssociation] c -> 3 \[RightAssociation]], 
 TapComment["RefLink[DeleteCases,paclet:ref/DeleteCases] can access parts of \
the elements of an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSameBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, "b" -> 2, 
    c -> {"3", 4}, d -> 4 \[RightAssociation], _Integer, {2}], 
  \[LeftAssociation] a -> 1, b -> 2, c -> {3}, d -> 4 \[RightAssociation]], 
 TapComment["Deleting elements from a nested \
RefLink[Association,paclet:ref/Association]:"], 
 TapTestSameBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, 
    "b" -> \[LeftAssociation] "3" -> 3, "4" -> "4", 
      "5" -> \[LeftAssociation] 
        f -> 1 \[RightAssociation] \[RightAssociation], 
    "c" -> 4 \[RightAssociation], _Integer, {2, 3}], 
  \[LeftAssociation] a -> 1, b -> \[LeftAssociation] 4 -> 4, 
     5 -> \[LeftAssociation]  \[RightAssociation] \[RightAssociation], 
   c -> 4 \[RightAssociation]], 
 TapComment["Deleting the head f effectively flattens:"], 
 TapTestSame[DeleteCases[{1, f[2, 3], 4}, f, {2}, Heads -> True], 
  {1, 2, 3, 4}], TapComment[
  "Deleting the head effectively flattens the expression:"], 
 TapTestSame[DeleteCases[{1, f[2, 3], 4}, f, {2}, Heads -> True], 
  {1, 2, 3, 4}], TapComment["Deleting the head in \
RefLink[Association,paclet:ref/Association] removes the entry:"], 
 TapTestSameBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, "b" -> f["2", 3], 
    "c" -> 4 \[RightAssociation], f, {2}, Heads -> True], 
  \[LeftAssociation] a -> 1, c -> 4 \[RightAssociation]]]
