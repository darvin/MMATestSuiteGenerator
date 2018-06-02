(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Extract the last element of a list:"], 
 TapTestSame[Last[{a, b, c}], c], 
 TapComment["Extract the last row of a matrix:"], 
 TapTestSame[Last[{{a, b}, {c, d}, {e, f}}], {e, f}], 
 TapComment["Extract the last element of an Association:"], 
 TapTestSame[Last[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation]], b], 
 TapComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Last[a^2 + b^2], b^2], TapComment["RefLink[Last,paclet:ref/Last] \
works on RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSame[Last[SparseArray[Range[100]]], 100], 
 TapComment["RefLink[Last,paclet:ref/Last][expr] is equivalent to \
expr[[-1]]:"], TapTestSame[Last[{a, b, c}], c], 
 TapTestSame[{a, b, c}[[-1]], c], TapComment["The expression is evaluated \
before RefLink[Last,paclet:ref/Last] is applied:"], 
 TapTestSame[Last[b^2 + a^2], b^2], TapComment["RefLink[Last,paclet:ref/Last] \
always operates on the RefLink[FullForm,paclet:ref/FullForm] of expressions:"]\
, TapTestSame[Last[1/b], -1], TapTestSameBROKEN[FullForm[1/b], b^(-1)]]
