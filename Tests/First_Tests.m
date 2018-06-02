(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Extract the first element of a list:"], 
 ESameTest[First[{a, b, c}], a], 
 EComment["Extract the first row of a matrix:"], 
 ESameTest[First[{{a, b}, {c, d}}], {a, b}], EComment["Extract the first \
element of an RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[First[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation]], a], 
 EComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 ESameTest[First[a^2 + b^2], a^2], EComment["RefLink[First,paclet:ref/First] \
works on RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 ESameTest[First[SparseArray[Range[100]]], 1], 
 EComment["RefLink[First,paclet:ref/First] extracts the first value in an \
RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[First[\[LeftAssociation] a -> x, b -> y \[RightAssociation]], x], 
 EComment[
  "RefLink[First,paclet:ref/First][expr] is equivalent to expr[[1]]:"], 
 ESameTest[First[{a, b, c}], a], ESameTest[{a, b, c}[[1]], a], 
 EComment["The expression is evaluated before RefLink[First,paclet:ref/First] \
is applied:"], ESameTest[First[b^2 + a^2], a^2], 
 EComment["RefLink[First,paclet:ref/First] always operates on the \
RefLink[FullForm,paclet:ref/FullForm] of expressions: "], 
 ESameTest[First[1/a^2], a], ESameTestBROKEN[FullForm[1/a^2], a^(-2)]]
