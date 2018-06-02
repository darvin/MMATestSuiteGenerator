(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Extract the last element of a list:"], 
 ESameTest[Last[{a, b, c}], c], 
 EComment["Extract the last row of a matrix:"], 
 ESameTest[Last[{{a, b}, {c, d}, {e, f}}], {e, f}], 
 EComment["Extract the last element of an Association:"], 
 ESameTest[Last[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation]], b], 
 EComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 ESameTest[Last[a^2 + b^2], b^2], EComment["RefLink[Last,paclet:ref/Last] \
works on RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 ESameTest[Last[SparseArray[Range[100]]], 100], 
 EComment[
  "RefLink[Last,paclet:ref/Last][expr] is equivalent to expr[[-1]]:"], 
 ESameTest[Last[{a, b, c}], c], ESameTest[{a, b, c}[[-1]], c], 
 EComment["The expression is evaluated before RefLink[Last,paclet:ref/Last] \
is applied:"], ESameTest[Last[b^2 + a^2], b^2], 
 EComment["RefLink[Last,paclet:ref/Last] always operates on the \
RefLink[FullForm,paclet:ref/FullForm] of expressions:"], 
 ESameTest[Last[1/b], -1], ESameTestBROKEN[FullForm[1/b], b^(-1)]]
