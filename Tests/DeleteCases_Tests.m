(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Delete cases that match integers:"], 
 ESameTest[DeleteCases[{1, 1, x, 2, 3, y, 9, y}, _Integer], {x, y, y}], 
 EComment["Use the operator form:"], 
 ESameTest[DeleteCases[_Integer][{1, 1, x, 2, 3, y, 9, y}], {x, y, y}], 
 EComment[
  "Delete elements from RefLink[Association,paclet:ref/Association]:"], 
 ESameTestBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, "b" -> 2, c -> "3", 
    d -> 4 \[RightAssociation], _Integer], \[LeftAssociation] 
   c -> 3 \[RightAssociation]], EComment["RefLink[DeleteCases,paclet:ref/Dele\
teCases] can access parts of the elements of an \
RefLink[Association,paclet:ref/Association]:"], 
 ESameTestBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, "b" -> 2, 
    c -> {"3", 4}, d -> 4 \[RightAssociation], _Integer, {2}], 
  \[LeftAssociation] a -> 1, b -> 2, c -> {3}, d -> 4 \[RightAssociation]], 
 EComment["Deleting elements from a nested \
RefLink[Association,paclet:ref/Association]:"], 
 ESameTestBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, 
    "b" -> \[LeftAssociation] "3" -> 3, "4" -> "4", 
      "5" -> \[LeftAssociation] 
        f -> 1 \[RightAssociation] \[RightAssociation], 
    "c" -> 4 \[RightAssociation], _Integer, {2, 3}], 
  \[LeftAssociation] a -> 1, b -> \[LeftAssociation] 4 -> 4, 
     5 -> \[LeftAssociation]  \[RightAssociation] \[RightAssociation], 
   c -> 4 \[RightAssociation]], 
 EComment["Deleting the head f effectively flattens:"], 
 ESameTest[DeleteCases[{1, f[2, 3], 4}, f, {2}, Heads -> True], 
  {1, 2, 3, 4}], EComment[
  "Deleting the head effectively flattens the expression:"], 
 ESameTest[DeleteCases[{1, f[2, 3], 4}, f, {2}, Heads -> True], 
  {1, 2, 3, 4}], EComment["Deleting the head in \
RefLink[Association,paclet:ref/Association] removes the entry:"], 
 ESameTestBROKEN[DeleteCases[\[LeftAssociation] "a" -> 1, "b" -> f["2", 3], 
    "c" -> 4 \[RightAssociation], f, {2}, Heads -> True], 
  \[LeftAssociation] a -> 1, c -> 4 \[RightAssociation]]]
