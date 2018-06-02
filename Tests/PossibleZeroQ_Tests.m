(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test whether a numeric expression is zero:"], 
 ESameTest[PossibleZeroQ[E^(I*(Pi/4)) - (-1)^(1/4)], True], 
 EComment[
  "Test whether a symbolic expression is likely to be identically zero:"], 
 ESameTest[PossibleZeroQ[(x + 1)*(x - 1) - x^2 + 1], True], 
 EComment["Show that a numeric expression is zero:"], 
 ESameTest[PossibleZeroQ[(E + Pi)^2 - E^2 - Pi^2 - 2*E*Pi], True], 
 EComment["Show that a numeric expression is nonzero: "], 
 ESameTest[PossibleZeroQ[E^Pi - Pi^E], False], 
 EComment["Decide that a numeric expression is zero based on approximate \
computations:"], ESameTest[PossibleZeroQ[2^(2*I) - 2^(-2*I) - 
    2*I*Sin[Log[4]]], True], 
 EComment[
  "Test whether symbolic expressions are likely to be identically zero:"], 
 ESameTest[PossibleZeroQ[1/x + 1/y - (x + y)/(x*y)], True], 
 ESameTest[PossibleZeroQ[Sqrt[x^2] - x], False], 
 ESameTest[PossibleZeroQ[f], False], 
 EComment["When RefLink[Re,paclet:ref/Re][x]>0, f is identically zero:"], 
 ESameTestBROKEN[PossibleZeroQ[f, Assumptions -> Re[x] > 0], True], 
 EComment["By default, numeric approximations may be used to decide that an \
algebraic number is zero:"], 
 ESameTest[zero = Sqrt[2] + Sqrt[3] - RootReduce[Sqrt[2] + Sqrt[3]], 
  Sqrt[2] + Sqrt[3] - Root[1 - 10*#1^2 + #1^4 & , 4]], 
 ESameTest[PossibleZeroQ[zero], True], 
 EComment["Approximate methods may give incorrect positive answers:"], 
 ESameTest[PossibleZeroQ[zero + 10^(-100)], True], 
 EComment["With RefLink[Method,paclet:ref/Method]->\"ExactAlgebraics\" exact \
methods are used for explicit algebraic numbers:"], 
 ESameTest[PossibleZeroQ[zero, Method -> "ExactAlgebraics"], True], 
 EComment["For explicit algebraic numbers the answer is provably correct:"], 
 ESameTest[PossibleZeroQ[zero + 10^(-100), Method -> "ExactAlgebraics"], 
  False], ESameTestBROKEN[QuadraticRoots[2*Log[2]*x^2 - Log[4]*x^2 + x - 1 == 
    0, x], x == 1], 
 EComment[
  "Wolfram Language equation solvers use zero testing automatically:"], 
 ESameTestBROKEN[Reduce[2*Log[2]*x^2 - Log[4]*x^2 + x - 1 == 0, x], x == 1], 
 ESameTest[e === 0, False], EComment["RefLink[Equal,paclet:ref/Equal][e,0] \
uses simple tests to decide whether e is zero:"], 
 ESameTestBROKEN[e == 0, True], ESameTestBROKEN[ee == 0, 
  Log[4] - Log[2 - Sqrt[2]] + 2*Log[Sin[Pi/8]] == 0], 
 EComment["RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] uses numeric \
methods to test whether ee is zero:"], ESameTestBROKEN[PossibleZeroQ[ee], 
  True], EComment["RefLink[FullSimplify,paclet:ref/FullSimplify] proves \
symbolically that ee is zero:"], ESameTestBROKEN[FullSimplify[ee], 0], 
 ESameTestBROKEN[PossibleZeroQ[e], True], ESameTestBROKEN[FullSimplify[e], 
  1/1000000000000000000000000000000000000000000000000000000000000000000000000\
0000000000000000000000000000]]
