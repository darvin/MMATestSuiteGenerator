(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Returns RefLink[True,paclet:ref/True] if elements are \
guaranteed unequal, and otherwise stays unevaluated:"], 
 TapTestSame[a != b, a != b], TapComment["Enter as !=\\[ThinSpace] or as \
Esc\\[ThinSpace]\\[ThinSpace]!=\\[ThinSpace]\\[ThinSpace]Esc:"], 
 TapTestSame[1 != 2, True], TapComment["Test unequality of numbers:"], 
 TapTestSame[3/2 != 5/3, True], TapComment["Approximate numbers that differ \
in at most their last eight binary digits are considered equal:"], 
 TapTestSame[1. != 1. + 2^7/10^16, False], TapTestSame[1. != 1. + 2^8/10^16, 
  True], TapComment[
  "Compare an exact numeric expression and an approximate number:"], 
 TapTestSame[N[Pi, 20] != Pi, False], 
 TapTestSame[N[Pi, 20] != Pi*(1 + 2^8/10^20), True], 
 TapComment["Compare two exact numeric expressions; a numeric test may \
suffice to prove unequality:"], TapTestSame[Pi^E != E^Pi, True], 
 TapComment["Proving equality requires symbolic methods:"], 
 TapTestSame[Sqrt[2] + Sqrt[3] != Sqrt[5 + 2*Sqrt[6]], False], 
 TapComment["Symbolic methods used by RefLink[Unequal,paclet:ref/Unequal] are \
insufficient to prove this RefLink[False,paclet:ref/False]:"], 
 TapTestSame[Sqrt[2] + Sqrt[3] != Root[#1^4 - 10*#1^2 + 1 & , 4], 
  Sqrt[2] + Sqrt[3] != Root[1 - 10*#1^2 + #1^4 & , 4]], 
 TapComment["Use RefLink[RootReduce,paclet:ref/RootReduce] to decide whether \
two algebraic numbers are unequal:"], TapTestSameBROKEN[RootReduce[%], 
  False], TapComment["Numeric methods used by \
RefLink[Unequal,paclet:ref/Unequal] do not use sufficient precision to prove \
this unequality:"], TapTestSame[Sqrt[2] + Sqrt[3] != 
   Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100), 
  Sqrt[2] + Sqrt[3] != 1/1000000000000000000000000000000000000000000000000000\
0000000000000000000000000000000000000000000000000 + 
    Root[1 - 10*#1^2 + #1^4 & , 4]], TapComment["RefLink[RootReduce,paclet:re\
f/RootReduce] proves that the two algebraic numbers are not equal:"], 
 TapTestSameBROKEN[RootReduce[%], True], TapComment["Increasing \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] may also prove \
unequality:"], TapTestSame[Block[{$MaxExtraPrecision = 100}, 
   Sqrt[2] + Sqrt[3] != Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100)], True], 
 TapComment[
  "This symbolic unequality is always RefLink[False,paclet:ref/False]:"], 
 TapTestSame[x != x, False], TapComment["RefLink[Unequal,paclet:ref/Unequal] \
does not automatically prove this unequality:"], 
 TapTestSame[(x + 1)^2 - x^2 - 2*x != 0, -2*x - x^2 + (1 + x)^2 != 0], 
 TapComment["Use RefLink[Expand,paclet:ref/Expand] to prove it:"], 
 TapTestSameBROKEN[Expand[%], True], 
 TapComment["Compare more than two expressions:"], 
 TapTestSame[3 != 4 != 5, True], TapTestSame[x != y != z != t, 
  x != y != z != t], TapComment["Compare lists:"], 
 TapTestSame[{1, 2} != {1, 2}, False], TapTestSame[{a, b, c} != {d, e}, 
  True], TapComment["Compare strings:"], TapTestSame["abc" != "ABC", True], 
 TapComment["The negation of two-argument RefLink[Unequal,paclet:ref/Unequal] \
is RefLink[Equal,paclet:ref/Equal]:"], TapTestSame[ !x != y, x == y], 
 TapComment["The negation of three-argument \
RefLink[Unequal,paclet:ref/Unequal] does not simplify automatically:"], 
 TapTestSame[ !x != y != z,  !x != y != z], 
 TapComment["Use RefLink[LogicalExpand,paclet:ref/LogicalExpand] to express \
it in terms of two-argument RefLink[Equal,paclet:ref/Equal]:"], 
 TapTestSameBROKEN[LogicalExpand[%], y == x || z == x || z == y], 
 TapComment["The negation of three-argument \
RefLink[Unequal,paclet:ref/Unequal] is not equivalent to three-argument \
RefLink[Equal,paclet:ref/Equal]:"], TapTestSame[LogicalExpand[x == y == z], 
  y == x && z == x], TapComment["RefLink[Unequal,paclet:ref/Unequal] tests \
mathematical unequality of objects represented by expressions:"], 
 TapTestSame[{x != x, x != y, Sqrt[2] + Sqrt[3] != Sqrt[5 + 2*Sqrt[6]], 
   Pi != N[Pi]}, {False, x != y, False, False}], 
 TapComment["RefLink[UnsameQ,paclet:ref/UnsameQ] tests syntactic unequality \
of expressions:"], TapTestSame[{x =!= x, x =!= y, 
   Sqrt[2] + Sqrt[3] =!= Sqrt[5 + 2*Sqrt[6]], Pi =!= N[Pi]}, 
  {False, True, True, True}], TapComment["When \
RefLink[Unequal,paclet:ref/Unequal] cannot decide whether two numeric \
expressions are equal it returns unchanged:"], 
 TapTestSame[a = Log[Sqrt[2] + Sqrt[3]]; b = Log[5 + 2*Sqrt[6]]/2; a != b, 
  Log[Sqrt[2] + Sqrt[3]] != (1/2)*Log[5 + 2*Sqrt[6]]], 
 TapComment["RefLink[FullSimplify,paclet:ref/FullSimplify] uses exact \
symbolic transformations to disprove the unequality:"], 
 TapTestSame[FullSimplify[a != b], False], TapComment["RefLink[PossibleZeroQ,\
paclet:ref/PossibleZeroQ] uses numeric and symbolic heuristics to decide \
whether an expression is zero:"], TapTestSame[PossibleZeroQ[a - b], True], 
 TapComment["Numeric methods used by \
RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] may incorrectly decide that a \
number is zero:"], TapTestSame[PossibleZeroQ[a - b + 10^(-100)], True], 
 TapComment[
  "Unequality for machine-precision approximate numbers can be subtle: "], 
 TapTestSame[2.00006 - 2.00005 != 0.00001, True], 
 TapComment["The extra digits disrupt equality:"], 
 TapTestSameBROKEN[InputForm[2.00006 - 2.00005], 0.000010000000000065512], 
 TapComment[
  "Arbitrary-precision approximate numbers do not have this problem:"], 
 TapTestSame[2.00006`16. - 2.00005000000000000000000000001`16. != 1.`16.*^-5, 
  False], TapComment["Thanks to automatic-precision tracking, \
RefLink[Unequal,paclet:ref/Unequal] knows to look only at the first 10 \
digits:"], TapTestSame[Precision[2.00006`16. - 
    2.00005000000000000000000000001`16.], 10.3979], 
 TapComment["In this case, the unequality test for machine numbers gives the \
expected result:"], TapTestSame[2.6 - 2.5 != 0.1, False], 
 TapComment["The extra digits in this case are ignored by \
RefLink[Unequal,paclet:ref/Unequal]:"], TapTestSameBROKEN[
  InputForm[2.6 - 2.5], 0.10000000000000009]]
