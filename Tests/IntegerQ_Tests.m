(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[IntegerQ,paclet:ref/IntegerQ] tests whether an \
expression is explicitly an integer:"], TapTestSame[IntegerQ[4], True], 
 TapTestSame[IntegerQ[4 + x], False], 
 TapComment["Test whether an array consists of all integers:"], 
 TapTestSame[ArrayQ[{{1, 4}, {9, 16}}, _, IntegerQ], True], 
 TapTestSame[ArrayQ[{{1., 4.}, {9., 16.}}, _, IntegerQ], False], 
 TapComment["Make a test for Gaussian integers:"], 
 TapTestSame[gaussIntegerQ[x_] := IntegerQ[Re[x]] && IntegerQ[Im[x]]; 
   gaussIntegerQ[1 + 2*I], True], 
 TapComment["Integers have head RefLink[Integer,paclet:ref/Integer]:"], 
 TapTestSameBROKEN[x = 8529050985092184098210948213048204809218402184 ;; 
    {IntegerQ[x], Head[x]}, {True, Integer}], TapComment["An expression may \
have head RefLink[Integer,paclet:ref/Integer], but \
RefLink[IntegerQ,paclet:ref/IntegerQ] gives RefLink[False,paclet:ref/False]: \
"], TapTestSame[IntegerQ[Integer[x]], False], 
 TapTestSame[IntegerQ[Integer[1.2]], False], TapComment["Expressions that do \
not evaluate to integers explicitly will still give \
RefLink[False,paclet:ref/False]:"], TapTestSameBROKEN[
  x = GoldenRatio - 1/GoldenRatio ;; IntegerQ[x], False], 
 TapComment["It is necessary to use symbolic simplification first:"], 
 TapTestSameBROKEN[FullSimplify[x], 1]]
