(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test equality:"], TapTestSame[2 + 2 == 4, True], 
 TapComment["Represent an equation:"], TapTestSame[x^2 == 1 + x, 
  x^2 == 1 + x], TapTestSame[Solve[%, x], {{x -> (1/2)*(1 - Sqrt[5])}, 
   {x -> (1/2)*(1 + Sqrt[5])}}], TapComment["Test equality of numbers:"], 
 TapTestSame[3/2 == 5/3, False], TapComment["Approximate numbers that differ \
in their last seven binary digits are considered equal:"], 
 TapTestSame[1.`18.06179973983887 == 
   1.00000000000000011015494072453`18.06179973983887, True], 
 TapComment[
  "Compare an exact numeric expression and an approximate number:"], 
 TapTestSame[N[Pi, 20] == Pi, True], 
 TapTestSame[N[Pi, 20] == Pi*(1 + 2^8/10^20), False], 
 TapComment["Compare two exact numeric expressions; a numeric test may \
suffice to disprove equality:"], TapTestSame[Pi^E == E^Pi, False], 
 TapComment["Proving equality requires symbolic methods:"], 
 TapTestSame[Sqrt[2] + Sqrt[3] == Sqrt[5 + 2*Sqrt[6]], True], 
 TapComment["Symbolic methods used by RefLink[Equal,paclet:ref/Equal] are \
insufficient to prove this equality:"], 
 TapTestSame[Sqrt[2] + Sqrt[3] == Root[#1^4 - 10*#1^2 + 1 & , 4], 
  Sqrt[2] + Sqrt[3] == Root[1 - 10*#1^2 + #1^4 & , 4]], 
 TapComment["Use RefLink[RootReduce,paclet:ref/RootReduce] to decide whether \
two algebraic numbers are equal:"], TapTestSameBROKEN[RootReduce[%], True], 
 TapComment["Numeric methods used by RefLink[Equal,paclet:ref/Equal] do not \
use sufficient precision to disprove this equality:"], 
 TapTestSame[Sqrt[2] + Sqrt[3] == Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100), 
  Sqrt[2] + Sqrt[3] == 1/1000000000000000000000000000000000000000000000000000\
0000000000000000000000000000000000000000000000000 + 
    Root[1 - 10*#1^2 + #1^4 & , 4]], TapComment["RefLink[RootReduce,paclet:re\
f/RootReduce] proves that the two algebraic numbers are not equal:"], 
 TapTestSameBROKEN[RootReduce[%], False], TapComment["Increasing \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] may also allow you \
to disprove equality:"], TapTestSame[Block[{$MaxExtraPrecision = 100}, 
   Sqrt[2] + Sqrt[3] == Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100)], False], 
 TapComment["A symbolic identity:"], TapTestSame[x == x, True], 
 TapComment["RefLink[Equal,paclet:ref/Equal] does not automatically prove \
this identity:"], TapTestSame[(x + 1)^2 == x^2 + 2*x + 1, 
  (1 + x)^2 == 1 + 2*x + x^2], 
 TapComment["Use RefLink[Expand,paclet:ref/Expand] to prove it:"], 
 TapTestSameBROKEN[Expand[%], True], TapComment["A symbolic equation:"], 
 TapTestSame[a*x == b, a*x == b], 
 TapComment["Use RefLink[Solve,paclet:ref/Solve] to solve the equation:"], 
 TapTestSame[Solve[%, x], {{x -> b/a}}], TapComment["RefLink[Reduce,paclet:re\
f/Reduce] gives all solutions, including the ones that require nongeneric \
values of parameters:"], TapTestSameBROKEN[Reduce[%%, x], 
  (b == 0 && a == 0) || (a != 0 && x == b/a)], 
 TapComment["Compare more than two expressions:"], 
 TapTestSame[3 == 3. == 3., True], 
 TapTestSame[x + y + z == x^2 - y^2 - z^2 == x*y*z == 3, 
  x + y + z == x^2 - y^2 - z^2 == x*y*z == 3], 
 TapTestSame[Reduce[%, {x, y, z}], x == 1 && (y == (1/2)*(2 - 2*I*Sqrt[2]) || 
    y == (1/2)*(2 + 2*I*Sqrt[2])) && z == 2 - y], 
 TapComment["Compare lists:"], TapTestSame[{1, 2} == {1, 2}, True], 
 TapTestSame[{a, b, c} == {d, e}, False], TapComment["Compare strings:"], 
 TapTestSame["abc" == "ABC", False], TapComment["The negation of two-argument \
RefLink[Equal,paclet:ref/Equal] is RefLink[Unequal,paclet:ref/Unequal]:"], 
 TapTestSame[ !x == y, x != y], TapComment["The negation of three-argument \
RefLink[Equal,paclet:ref/Equal] does not simplify automatically:"], 
 TapTestSame[ !x == y == z,  !x == y == z], 
 TapComment["Use RefLink[LogicalExpand,paclet:ref/LogicalExpand] to express \
it in terms of two-argument RefLink[Unequal,paclet:ref/Unequal]:"], 
 TapTestSameBROKEN[LogicalExpand[%], y != x || z != x], 
 TapComment["The negation of three-argument RefLink[Equal,paclet:ref/Equal] \
is not equivalent to three-argument RefLink[Unequal,paclet:ref/Unequal]:"], 
 TapTestSame[LogicalExpand[x != y != z], y != x && z != x && z != y], 
 TapComment["RefLink[Equal,paclet:ref/Equal] tests mathematical equality of \
objects represented by expressions:"], 
 TapTestSame[{x == x, x == y, Sqrt[2] + Sqrt[3] == Sqrt[5 + 2*Sqrt[6]], 
   Pi == N[Pi]}, {True, x == y, True, True}], 
 TapComment[
  "RefLink[SameQ,paclet:ref/SameQ] tests syntactic equality of expressions:"]\
, TapTestSame[{x === x, x === y, Sqrt[2] + Sqrt[3] === Sqrt[5 + 2*Sqrt[6]], 
   Pi === N[Pi]}, {True, False, False, False}], 
 TapComment["When RefLink[Equal,paclet:ref/Equal] cannot decide whether two \
numeric expressions are equal it returns unchanged:"], 
 TapTestSame[a = Log[Sqrt[2] + Sqrt[3]]; b = Log[5 + 2*Sqrt[6]]/2; a == b, 
  Log[Sqrt[2] + Sqrt[3]] == (1/2)*Log[5 + 2*Sqrt[6]]], 
 TapComment["RefLink[FullSimplify,paclet:ref/FullSimplify] uses exact \
symbolic transformations to prove the equality:"], 
 TapTestSame[FullSimplify[a == b], True], TapComment["RefLink[PossibleZeroQ,p\
aclet:ref/PossibleZeroQ] uses numeric and symbolic heuristics to decide \
whether an expression is zero:"], TapTestSame[PossibleZeroQ[a - b], True], 
 TapComment["Numeric methods used by \
RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] may incorrectly decide that a \
number is zero:"], TapTestSame[PossibleZeroQ[a - b + 10^(-100)], True], 
 TapComment["Use RefLink[Solve,paclet:ref/Solve] to solve equations for \
generic values of parameters:"], TapTestSameBROKEN[
  Solve[a*x^2 + b*x + c == 0, x], {{x -> (-b - Sqrt[b^2 - 4*a*c])/(2*a)}, 
   {x -> (-b + Sqrt[b^2 - 4*a*c])/(2*a)}}], TapComment["RefLink[Reduce,paclet\
:ref/Reduce] gives all solutions, including those with nongeneric parameter \
values:"], TapTestSameBROKEN[Reduce[a*x^2 + b*x + c == 0, x], 
  (a != 0 && (x == (-b - Sqrt[b^2 - 4*a*c])/(2*a) || 
     x == (-b + Sqrt[b^2 - 4*a*c])/(2*a))) || (a == 0 && b != 0 && 
    x == -(c/b)) || (c == 0 && b == 0 && a == 0)], 
 TapComment["Use RefLink[Reduce,paclet:ref/Reduce] to solve equations over \
specified domains:"], TapTestSame[Reduce[x^2 + y^2 == 5, {x, y}, Reals], 
  -Sqrt[5] <= x <= Sqrt[5] && (y == -Sqrt[5 - x^2] || y == Sqrt[5 - x^2])], 
 TapTestSame[Reduce[x^2 + y^2 == 5, {x, y}, Integers], 
  (x == -2 && y == -1) || (x == -2 && y == 1) || (x == -1 && y == -2) || 
   (x == -1 && y == 2) || (x == 1 && y == -2) || (x == 1 && y == 2) || 
   (x == 2 && y == -1) || (x == 2 && y == 1)], 
 TapComment[
  "Equality for machine-precision approximate numbers can be subtle: "], 
 TapTestSame[2.00006 - 2.00005 == 0.00001, False], 
 TapComment["The extra digits disrupt equality:"], 
 TapTestSameBROKEN[InputForm[2.00006 - 2.00005], 0.000010000000000065512], 
 TapComment[
  "Arbitrary-precision approximate numbers do not have this problem:"], 
 TapTestSame[2.00006`16. - 2.00005000000000000000000000001`16. == 1.`16.*^-5, 
  True], TapComment["Thanks to automatic precision tracking \
RefLink[Equal,paclet:ref/Equal] knows to look only at the first ten digits:"]\
, TapTestSame[Precision[2.00006`16. - 2.00005000000000000000000000001`16.], 
  10.3979], TapComment[
  "In this case, the equality test for machine numbers succeeds:"], 
 TapTestSame[2.6 - 2.5 == 0.1, True], TapComment["The extra digits in this \
case are ignored by RefLink[Equal,paclet:ref/Equal]:"], 
 TapTestSameBROKEN[InputForm[2.6 - 2.5], 0.10000000000000009], 
 TapComment["Equality may not be transitive for approximate numbers:"], 
 TapTestSameBROKEN[{x, y, z} = {1. - 1.*^-14, 1., 1. + 1.*^-14} ;; x == y, 
  True], TapTestSameBROKEN[y == z, True], TapTestSameBROKEN[x == z, False], 
 TapComment["RefLink[Equal,paclet:ref/Equal] is not treated as the Boolean \
equivalence operator:"], TapTestSame[FullSimplify[(p || q) == (q || p)], 
  (p || q) == (q || p)], TapComment[
  "Use RefLink[Equivalent,paclet:ref/Equivalent] instead:"], 
 TapTestSame[FullSimplify[Equivalent[p || q, q || p]], True]]
