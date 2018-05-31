(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test equality:"], ESameTest[2 + 2 == 4, True], 
 EComment["Represent an equation:"], ESameTest[x^2 == 1 + x, x^2 == 1 + x], 
 ESameTestBROKEN[Solve[%, x], {{x -> (1/2)*(1 - Sqrt[5])}, 
   {x -> (1/2)*(1 + Sqrt[5])}}], EComment["Test equality of numbers:"], 
 ESameTest[3/2 == 5/3, False], EComment["Approximate numbers that differ in \
their last seven binary digits are considered equal:"], 
 ESameTest[1.`18.06179973983887 == 
   1.00000000000000011015494072453`18.06179973983887, True], 
 EComment["Compare an exact numeric expression and an approximate number:"], 
 ESameTest[N[Pi, 20] == Pi, True], ESameTest[N[Pi, 20] == Pi*(1 + 2^8/10^20), 
  False], EComment["Compare two exact numeric expressions; a numeric test may \
suffice to disprove equality:"], ESameTest[Pi^E == E^Pi, False], 
 EComment["Proving equality requires symbolic methods:"], 
 ESameTest[Sqrt[2] + Sqrt[3] == Sqrt[5 + 2*Sqrt[6]], True], 
 EComment["Symbolic methods used by RefLink[Equal,paclet:ref/Equal] are \
insufficient to prove this equality:"], 
 ESameTest[Sqrt[2] + Sqrt[3] == Root[#1^4 - 10*#1^2 + 1 & , 4], 
  Sqrt[2] + Sqrt[3] == Root[1 - 10*#1^2 + #1^4 & , 4]], 
 EComment["Use RefLink[RootReduce,paclet:ref/RootReduce] to decide whether \
two algebraic numbers are equal:"], ESameTestBROKEN[RootReduce[%], True], 
 EComment["Numeric methods used by RefLink[Equal,paclet:ref/Equal] do not use \
sufficient precision to disprove this equality:"], 
 ESameTest[Sqrt[2] + Sqrt[3] == Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100), 
  Sqrt[2] + Sqrt[3] == 1/1000000000000000000000000000000000000000000000000000\
0000000000000000000000000000000000000000000000000 + 
    Root[1 - 10*#1^2 + #1^4 & , 4]], EComment["RefLink[RootReduce,paclet:ref/\
RootReduce] proves that the two algebraic numbers are not equal:"], 
 ESameTestBROKEN[RootReduce[%], False], EComment["Increasing \
RefLink[$MaxExtraPrecision,paclet:ref/$MaxExtraPrecision] may also allow you \
to disprove equality:"], ESameTest[Block[{$MaxExtraPrecision = 100}, 
   Sqrt[2] + Sqrt[3] == Root[#1^4 - 10*#1^2 + 1 & , 4] + 10^(-100)], False], 
 EComment["A symbolic identity:"], ESameTest[x == x, True], 
 EComment["RefLink[Equal,paclet:ref/Equal] does not automatically prove this \
identity:"], ESameTest[(x + 1)^2 == x^2 + 2*x + 1, 
  (1 + x)^2 == 1 + 2*x + x^2], 
 EComment["Use RefLink[Expand,paclet:ref/Expand] to prove it:"], 
 ESameTestBROKEN[Expand[%], True], EComment["A symbolic equation:"], 
 ESameTest[a*x == b, a*x == b], 
 EComment["Use RefLink[Solve,paclet:ref/Solve] to solve the equation:"], 
 ESameTestBROKEN[Solve[%, x], {{x -> b/a}}], EComment["RefLink[Reduce,paclet:\
ref/Reduce] gives all solutions, including the ones that require nongeneric \
values of parameters:"], ESameTestBROKEN[Reduce[%%, x], 
  (b == 0 && a == 0) || (a != 0 && x == b/a)], 
 EComment["Compare more than two expressions:"], 
 ESameTest[3 == 3. == 3., True], ESameTest[x + y + z == x^2 - y^2 - z^2 == 
   x*y*z == 3, x + y + z == x^2 - y^2 - z^2 == x*y*z == 3], 
 ESameTestBROKEN[Reduce[%, {x, y, z}], 
  x == 1 && (y == (1/2)*(2 - 2*I*Sqrt[2]) || y == (1/2)*(2 + 2*I*Sqrt[2])) && 
   z == 2 - y], EComment["Compare lists:"], ESameTest[{1, 2} == {1, 2}, 
  True], ESameTest[{a, b, c} == {d, e}, False], EComment["Compare strings:"], 
 ESameTest["abc" == "ABC", False], EComment["The negation of two-argument \
RefLink[Equal,paclet:ref/Equal] is RefLink[Unequal,paclet:ref/Unequal]:"], 
 ESameTest[ !x == y, x != y], EComment["The negation of three-argument \
RefLink[Equal,paclet:ref/Equal] does not simplify automatically:"], 
 ESameTest[ !x == y == z,  !x == y == z], 
 EComment["Use RefLink[LogicalExpand,paclet:ref/LogicalExpand] to express it \
in terms of two-argument RefLink[Unequal,paclet:ref/Unequal]:"], 
 ESameTestBROKEN[LogicalExpand[%], y != x || z != x], 
 EComment["The negation of three-argument RefLink[Equal,paclet:ref/Equal] is \
not equivalent to three-argument RefLink[Unequal,paclet:ref/Unequal]:"], 
 ESameTest[LogicalExpand[x != y != z], y != x && z != x && z != y], 
 EComment["RefLink[Equal,paclet:ref/Equal] tests mathematical equality of \
objects represented by expressions:"], 
 ESameTest[{x == x, x == y, Sqrt[2] + Sqrt[3] == Sqrt[5 + 2*Sqrt[6]], 
   Pi == N[Pi]}, {True, x == y, True, True}], 
 EComment[
  "RefLink[SameQ,paclet:ref/SameQ] tests syntactic equality of expressions:"]\
, ESameTest[{x === x, x === y, Sqrt[2] + Sqrt[3] === Sqrt[5 + 2*Sqrt[6]], 
   Pi === N[Pi]}, {True, False, False, False}], 
 EComment["When RefLink[Equal,paclet:ref/Equal] cannot decide whether two \
numeric expressions are equal it returns unchanged:"], 
 ESameTest[a = Log[Sqrt[2] + Sqrt[3]]; b = Log[5 + 2*Sqrt[6]]/2; a == b, 
  Log[Sqrt[2] + Sqrt[3]] == (1/2)*Log[5 + 2*Sqrt[6]]], 
 EComment["RefLink[FullSimplify,paclet:ref/FullSimplify] uses exact symbolic \
transformations to prove the equality:"], ESameTest[FullSimplify[a == b], 
  True], EComment["RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] uses \
numeric and symbolic heuristics to decide whether an expression is zero:"], 
 ESameTest[PossibleZeroQ[a - b], True], EComment["Numeric methods used by \
RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] may incorrectly decide that a \
number is zero:"], ESameTest[PossibleZeroQ[a - b + 10^(-100)], True], 
 EComment["Use RefLink[Solve,paclet:ref/Solve] to solve equations for generic \
values of parameters:"], ESameTestBROKEN[Solve[a*x^2 + b*x + c == 0, x], 
  {{x -> (-b - Sqrt[b^2 - 4*a*c])/(2*a)}, 
   {x -> (-b + Sqrt[b^2 - 4*a*c])/(2*a)}}], EComment["RefLink[Reduce,paclet:r\
ef/Reduce] gives all solutions, including those with nongeneric parameter \
values:"], ESameTestBROKEN[Reduce[a*x^2 + b*x + c == 0, x], 
  (a != 0 && (x == (-b - Sqrt[b^2 - 4*a*c])/(2*a) || 
     x == (-b + Sqrt[b^2 - 4*a*c])/(2*a))) || (a == 0 && b != 0 && 
    x == -(c/b)) || (c == 0 && b == 0 && a == 0)], 
 EComment["Use RefLink[Reduce,paclet:ref/Reduce] to solve equations over \
specified domains:"], ESameTestBROKEN[Reduce[x^2 + y^2 == 5, {x, y}, Reals], 
  -Sqrt[5] <= x <= Sqrt[5] && (y == -Sqrt[5 - x^2] || y == Sqrt[5 - x^2])], 
 ESameTest[Reduce[x^2 + y^2 == 5, {x, y}, Integers], 
  (x == -2 && y == -1) || (x == -2 && y == 1) || (x == -1 && y == -2) || 
   (x == -1 && y == 2) || (x == 1 && y == -2) || (x == 1 && y == 2) || 
   (x == 2 && y == -1) || (x == 2 && y == 1)], 
 EComment["Equality for machine-precision approximate numbers can be subtle: \
"], ESameTest[2.00006 - 2.00005 == 0.00001, False], 
 EComment["The extra digits disrupt equality:"], 
 ESameTestBROKEN[InputForm[2.00006 - 2.00005], 0.000010000000000065512], 
 EComment[
  "Arbitrary-precision approximate numbers do not have this problem:"], 
 ESameTest[2.00006`16. - 2.00005000000000000000000000001`16. == 1.`16.*^-5, 
  True], EComment["Thanks to automatic precision tracking \
RefLink[Equal,paclet:ref/Equal] knows to look only at the first ten digits:"]\
, ESameTestBROKEN[Precision[2.00006`16. - 
    2.00005000000000000000000000001`16.], 10.3979], 
 EComment["In this case, the equality test for machine numbers succeeds:"], 
 ESameTest[2.6 - 2.5 == 0.1, True], EComment["The extra digits in this case \
are ignored by RefLink[Equal,paclet:ref/Equal]:"], 
 ESameTestBROKEN[InputForm[2.6 - 2.5], 0.10000000000000009], 
 ESameTestBROKEN[x == y, True], ESameTestBROKEN[y == z, True], 
 ESameTestBROKEN[x == z, False], EComment["RefLink[Equal,paclet:ref/Equal] is \
not treated as the Boolean equivalence operator:"], 
 ESameTest[FullSimplify[(p || q) == (q || p)], (p || q) == (q || p)], 
 EComment["Use RefLink[Equivalent,paclet:ref/Equivalent] instead:"], 
 ESameTest[FullSimplify[Equivalent[p || q, q || p]], True]]
