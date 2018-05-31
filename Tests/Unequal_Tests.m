(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Returns RefLink[True,paclet:ref/True] if elements \
are guaranteed unequal, and otherwise stays unevaluated:"], 
 ESameTest[a != b, a != b], EComment["Enter as !=\\[ThinSpace] or as \
Esc\\[ThinSpace]\\[ThinSpace]!=\\[ThinSpace]\\[ThinSpace]Esc:"], 
 ESameTest[1 != 2, True], EComment["Test unequality of numbers:"], 
 ESameTest[3/2 != 5/3, True], EComment["Approximate numbers that differ in at \
most their last eight binary digits are considered equal:"], 
 ESameTest[1. != 1. + 2^7/10^16, False], ESameTest[1. != 1. + 2^8/10^16, 
  True], EComment[
  "Compare an exact numeric expression and an approximate number:"], 
 ESameTest[N[Pi, 20] != Pi, False], 
 ESameTest[N[Pi, 20] != Pi*(1 + 2^8/10^20), True], 
 EComment["Compare two exact numeric expressions; a numeric test may suffice \
to prove unequality:"], ESameTest[Pi^E != E^Pi, True], 
 EComment["Proving equality requires symbolic methods:"], 
 ESameTest[Sqrt[2] + Sqrt[3] != Sqrt[5 + 2*Sqrt[6]], False], 
 EComment["Symbolic methods used by RefLink[Unequal,paclet:ref/Unequal] are \
insufficient to prove this RefLink[False,paclet:ref/False]:"], 
 ESameTest[Sqrt[2] + Sqrt[3] != Root[#1^4 - 10*#1^2 + 1 & , 4], 
  Sqrt[2] + Sqrt[3] != Root[1 - 10*#1^2 + #1^4 & , 4]], 
 EComment["Use RefLink[RootReduce,paclet:ref/RootReduce] to decide whether \
two algebraic numbers are unequal:"], ESameTestBROKEN[RootReduce[%], False], 
 EComment["Numeric methods used by RefLink[Unequal,paclet:ref/Unequal] do not \
use sufficient precision to prove this unequality:"], 
 ESameTest[Sqrt[2] + Sqrt[3] != Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100), 
  Sqrt[2] + Sqrt[3] != 1/1000000000000000000000000000000000000000000000000000\
0000000000000000000000000000000000000000000000000 + 
    Root[1 - 10*#1^2 + #1^4 & , 4]], EComment["RefLink[RootReduce,paclet:ref/\
RootReduce] proves that the two algebraic numbers are not equal:"], 
 ESameTestBROKEN[RootReduce[%], True], EComment["Increasing \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] may also prove \
unequality:"], ESameTest[Block[{$MaxExtraPrecision = 100}, 
   Sqrt[2] + Sqrt[3] != Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100)], True], 
 EComment[
  "This symbolic unequality is always RefLink[False,paclet:ref/False]:"], 
 ESameTest[x != x, False], EComment["RefLink[Unequal,paclet:ref/Unequal] does \
not automatically prove this unequality:"], 
 ESameTest[(x + 1)^2 - x^2 - 2*x != 0, -2*x - x^2 + (1 + x)^2 != 0], 
 EComment["Use RefLink[Expand,paclet:ref/Expand] to prove it:"], 
 ESameTestBROKEN[Expand[%], True], 
 EComment["Compare more than two expressions:"], 
 ESameTest[3 != 4 != 5, True], ESameTest[x != y != z != t, x != y != z != t], 
 EComment["Compare lists:"], ESameTest[{1, 2} != {1, 2}, False], 
 ESameTest[{a, b, c} != {d, e}, True], EComment["Compare strings:"], 
 ESameTest["abc" != "ABC", True], EComment["The negation of two-argument \
RefLink[Unequal,paclet:ref/Unequal] is RefLink[Equal,paclet:ref/Equal]:"], 
 ESameTest[ !x != y, x == y], EComment["The negation of three-argument \
RefLink[Unequal,paclet:ref/Unequal] does not simplify automatically:"], 
 ESameTest[ !x != y != z,  !x != y != z], 
 EComment["Use RefLink[LogicalExpand,paclet:ref/LogicalExpand] to express it \
in terms of two-argument RefLink[Equal,paclet:ref/Equal]:"], 
 ESameTestBROKEN[LogicalExpand[%], y == x || z == x || z == y], 
 EComment["The negation of three-argument RefLink[Unequal,paclet:ref/Unequal] \
is not equivalent to three-argument RefLink[Equal,paclet:ref/Equal]:"], 
 ESameTest[LogicalExpand[x == y == z], y == x && z == x], 
 EComment["RefLink[Unequal,paclet:ref/Unequal] tests mathematical unequality \
of objects represented by expressions:"], 
 ESameTest[{x != x, x != y, Sqrt[2] + Sqrt[3] != Sqrt[5 + 2*Sqrt[6]], 
   Pi != N[Pi]}, {False, x != y, False, False}], 
 EComment["RefLink[UnsameQ,paclet:ref/UnsameQ] tests syntactic unequality of \
expressions:"], ESameTest[{x =!= x, x =!= y, Sqrt[2] + Sqrt[3] =!= 
    Sqrt[5 + 2*Sqrt[6]], Pi =!= N[Pi]}, {False, True, True, True}], 
 EComment["When RefLink[Unequal,paclet:ref/Unequal] cannot decide whether two \
numeric expressions are equal it returns unchanged:"], 
 ESameTest[a = Log[Sqrt[2] + Sqrt[3]]; b = Log[5 + 2*Sqrt[6]]/2; a != b, 
  Log[Sqrt[2] + Sqrt[3]] != (1/2)*Log[5 + 2*Sqrt[6]]], 
 EComment["RefLink[FullSimplify,paclet:ref/FullSimplify] uses exact symbolic \
transformations to disprove the unequality:"], 
 ESameTest[FullSimplify[a != b], False], EComment["RefLink[PossibleZeroQ,pacl\
et:ref/PossibleZeroQ] uses numeric and symbolic heuristics to decide whether \
an expression is zero:"], ESameTest[PossibleZeroQ[a - b], True], 
 EComment["Numeric methods used by \
RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] may incorrectly decide that a \
number is zero:"], ESameTest[PossibleZeroQ[a - b + 10^(-100)], True], 
 EComment[
  "Unequality for machine-precision approximate numbers can be subtle: "], 
 ESameTest[2.00006 - 2.00005 != 0.00001, True], 
 EComment["The extra digits disrupt equality:"], 
 ESameTestBROKEN[InputForm[2.00006 - 2.00005], 0.000010000000000065512], 
 EComment[
  "Arbitrary-precision approximate numbers do not have this problem:"], 
 ESameTest[2.00006`16. - 2.00005000000000000000000000001`16. != 1.`16.*^-5, 
  False], EComment["Thanks to automatic-precision tracking, \
RefLink[Unequal,paclet:ref/Unequal] knows to look only at the first 10 \
digits:"], ESameTestBROKEN[Precision[2.00006`16. - 
    2.00005000000000000000000000001`16.], 10.3979], 
 EComment["In this case, the unequality test for machine numbers gives the \
expected result:"], ESameTest[2.6 - 2.5 != 0.1, False], 
 EComment["The extra digits in this case are ignored by \
RefLink[Unequal,paclet:ref/Unequal]:"], ESameTestBROKEN[InputForm[2.6 - 2.5], 
  0.10000000000000009]]
