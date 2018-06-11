(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether a numeric expression is zero:"], 
 TapTestSame[PossibleZeroQ[E^(I*(Pi/4)) - (-1)^(1/4)], True], 
 TapComment[
  "Test whether a symbolic expression is likely to be identically zero:"], 
 TapTestSame[PossibleZeroQ[(x + 1)*(x - 1) - x^2 + 1], True], 
 TapComment["Show that a numeric expression is zero:"], 
 TapTestSame[PossibleZeroQ[(E + Pi)^2 - E^2 - Pi^2 - 2*E*Pi], True], 
 TapComment["Show that a numeric expression is nonzero: "], 
 TapTestSame[PossibleZeroQ[E^Pi - Pi^E], False], 
 TapComment["Decide that a numeric expression is zero based on approximate \
computations:"], TapTestSame[PossibleZeroQ[2^(2*I) - 2^(-2*I) - 
    2*I*Sin[Log[4]]], True], 
 TapComment[
  "Test whether symbolic expressions are likely to be identically zero:"], 
 TapTestSame[PossibleZeroQ[1/x + 1/y - (x + y)/(x*y)], True], 
 TapTestSame[PossibleZeroQ[Sqrt[x^2] - x], False], 
 TapComment["For arbitrary complex x, f is not identically zero:"], 
 TapTestSameBROKEN[f = Sqrt[x^2] - x ;; PossibleZeroQ[f], False], 
 TapComment["When RefLink[Re,paclet:ref/Re][x]>0, f is identically zero:"], 
 TapTestSameBROKEN[PossibleZeroQ[f, Assumptions -> Re[x] > 0], True], 
 TapComment["By default, numeric approximations may be used to decide that an \
algebraic number is zero:"], TapTestSame[
  zero = Sqrt[2] + Sqrt[3] - RootReduce[Sqrt[2] + Sqrt[3]], 
  Sqrt[2] + Sqrt[3] - Root[1 - 10*#1^2 + #1^4 & , 4]], 
 TapTestSame[PossibleZeroQ[zero], True], 
 TapComment["Approximate methods may give incorrect positive answers:"], 
 TapTestSame[PossibleZeroQ[zero + 10^(-100)], True], 
 TapComment["With RefLink[Method,paclet:ref/Method]->\"ExactAlgebraics\" \
exact methods are used for explicit algebraic numbers:"], 
 TapTestSame[PossibleZeroQ[zero, Method -> "ExactAlgebraics"], True], 
 TapComment[
  "For explicit algebraic numbers the answer is provably correct:"], 
 TapTestSame[PossibleZeroQ[zero + 10^(-100), Method -> "ExactAlgebraics"], 
  False], TapComment["Solving polynomial equations requires deciding whether \
coefficients are zero:"], TapTestSame[
  QuadraticRoots[eq_, x_] := Module[{a, b, c, \[CapitalDelta]}, 
     {c, b, a} = CoefficientList[Subtract @@ eq, x]; 
      If[ !PossibleZeroQ[a], \[CapitalDelta] = b^2 - 4*a*c; 
        x == (-b - Sqrt[\[CapitalDelta]])/(2*a) || 
         x == (-b + Sqrt[\[CapitalDelta]])/(2*a), If[ !PossibleZeroQ[b], 
        x == -c/b, PossibleZeroQ[c]]]]; QuadraticRoots[
    2*Log[2]*x^2 - Log[4]*x^2 + x - 1 == 0, x], x == 1], 
 TapComment[
  "Wolfram Language equation solvers use zero testing automatically:"], 
 TapTestSameBROKEN[Reduce[2*Log[2]*x^2 - Log[4]*x^2 + x - 1 == 0, x], 
  x == 1], TapComment["RefLink[SameQ,paclet:ref/SameQ][e,0] returns \
RefLink[True,paclet:ref/True] only if e is explicitly identical to zero:"], 
 TapTestSame[e = (E + Pi)^2 - E^2 - Pi^2 - 2*E*Pi ;; e === 0, False], 
 TapComment["RefLink[Equal,paclet:ref/Equal][e,0] uses simple tests to decide \
whether e is zero:"], TapTestSameBROKEN[e == 0, True], 
 TapComment["When RefLink[Equal,paclet:ref/Equal] cannot decide whether an \
expression is zero it returns unchanged:"], 
 TapTestSameBROKEN[ee = Log[4] + 2*Log[Sin[Pi/8]] - Log[2 - Sqrt[2]] ;; ee == 
    0, Log[4] - Log[2 - Sqrt[2]] + 2*Log[Sin[Pi/8]] == 0], 
 TapComment["RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] uses numeric \
methods to test whether ee is zero:"], TapTestSameBROKEN[PossibleZeroQ[ee], 
  True], TapComment["RefLink[FullSimplify,paclet:ref/FullSimplify] proves \
symbolically that ee is zero:"], TapTestSameBROKEN[FullSimplify[ee], 0], 
 TapComment["RefLink[PossibleZeroQ,paclet:ref/PossibleZeroQ] may return \
RefLink[True,paclet:ref/True] for nonzero numeric expressions that are close \
to zero:"], TapTestSameBROKEN[
  e = Sqrt[2] + Sqrt[3] - RootReduce[Sqrt[2] + Sqrt[3]] + 10^(-100) ;; 
    PossibleZeroQ[e], True], TapTestSameBROKEN[FullSimplify[e], 
  1/1000000000000000000000000000000000000000000000000000000000000000000000000\
0000000000000000000000000000]]
