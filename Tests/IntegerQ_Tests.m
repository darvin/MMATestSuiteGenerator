(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["RefLink[IntegerQ,paclet:ref/IntegerQ] tests whether \
an expression is explicitly an integer:"], ESameTest[IntegerQ[4], True], 
 ESameTest[IntegerQ[4 + x], False], 
 EComment["Test whether an array consists of all integers:"], 
 ESameTest[ArrayQ[{{1, 4}, {9, 16}}, _, IntegerQ], True], 
 ESameTest[ArrayQ[{{1., 4.}, {9., 16.}}, _, IntegerQ], False], 
 ESameTestBROKEN[gaussIntegerQ[1 + 2*I], True], 
 ESameTestBROKEN[{IntegerQ[x], Head[x]}, {True, Integer}], 
 EComment["An expression may have head RefLink[Integer,paclet:ref/Integer], \
but RefLink[IntegerQ,paclet:ref/IntegerQ] gives \
RefLink[False,paclet:ref/False]: "], ESameTest[IntegerQ[Integer[x]], False], 
 ESameTest[IntegerQ[Integer[1.2]], False], ESameTest[IntegerQ[x], False], 
 EComment["It is necessary to use symbolic simplification first:"], 
 ESameTestBROKEN[FullSimplify[x], 1]]
