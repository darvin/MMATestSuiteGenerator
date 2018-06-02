(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Extract the first element of a list:"], 
 TapTestSame[First[{a, b, c}], a], 
 TapComment["Extract the first row of a matrix:"], 
 TapTestSame[First[{{a, b}, {c, d}}], {a, b}], 
 TapComment["Extract the first element of an \
RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[First[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation]], 
  a], TapComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 TapTestSame[First[a^2 + b^2], a^2], TapComment["RefLink[First,paclet:ref/Fir\
st] works on RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSame[First[SparseArray[Range[100]]], 1], 
 TapComment["RefLink[First,paclet:ref/First] extracts the first value in an \
RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[First[\[LeftAssociation] a -> x, b -> y \[RightAssociation]], 
  x], TapComment[
  "RefLink[First,paclet:ref/First][expr] is equivalent to expr[[1]]:"], 
 TapTestSame[First[{a, b, c}], a], TapTestSame[{a, b, c}[[1]], a], 
 TapComment["The expression is evaluated before \
RefLink[First,paclet:ref/First] is applied:"], 
 TapTestSame[First[b^2 + a^2], a^2], TapComment["RefLink[First,paclet:ref/Fir\
st] always operates on the RefLink[FullForm,paclet:ref/FullForm] of \
expressions: "], TapTestSame[First[1/a^2], a], 
 TapTestSameBROKEN[FullForm[1/a^2], a^(-2)]]
