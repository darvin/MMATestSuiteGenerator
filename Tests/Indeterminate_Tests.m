(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[Indeterminate,paclet:ref/Indeterminate] is \
returned when a value cannot be unambiguously defined:"], 
 TapTestSame[0/0, Indeterminate], TapComment["Any numeric function of \
RefLink[Indeterminate,paclet:ref/Indeterminate] also gives \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 TapTestSame[Sin[Indeterminate], Indeterminate], 
 TapTestSameBROKEN[f[Indeterminate], Indeterminate], 
 TapComment["Negative precision/accuracy can yield \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 TapTestSame[SetAccuracy[2, -1], 0.], TapTestSameBROKEN[%/%, Indeterminate], 
 TapComment["Infinity in an unknown direction:"], 
 TapTestSame[DirectedInfinity[Indeterminate], ComplexInfinity], 
 TapComment["Mathematical operations with \
RefLink[Indeterminate,paclet:ref/Indeterminate] produce \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 TapTestSame[Interval[{0, 1}] + Indeterminate, Indeterminate], 
 TapTestSame[f[x] + Indeterminate, Indeterminate], 
 TapTestSame[Integrate[Indeterminate, x], Indeterminate], 
 TapTestSame[D[Indeterminate, z], Indeterminate], 
 TapComment[
  "RefLink[Indeterminate,paclet:ref/Indeterminate] threads over lists:"], 
 TapTestSame[{1, 2, 3} + Indeterminate, {Indeterminate, Indeterminate, 
   Indeterminate}], TapTestSame[{1, 2, 3}*Indeterminate, 
  {Indeterminate, Indeterminate, Indeterminate}], 
 TapComment["Digits beyond the limit of precision are \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 TapTestSame[RealDigits[6.7, 10, 20], 
  {{6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, Indeterminate, 
    Indeterminate, Indeterminate, Indeterminate}, 1}], 
 TapComment["Create a number of lower precision:"], 
 TapTestSame[FromDigits[{{6, 7, 0, 0, 0, Indeterminate}, 1}], 6.7], 
 TapComment[
  "RefLink[Indeterminate,paclet:ref/Indeterminate] is not a number:"], 
 TapTestSame[NumberQ[Indeterminate], False], 
 TapComment["It is neither real nor complex:"], 
 TapTestSame[{Re[Indeterminate], Im[Indeterminate]}, 
  {Indeterminate, Indeterminate}], 
 TapComment["The value cannot be unambiguously defined: "], 
 TapTestSame[t^t /. t -> 0, Indeterminate], 
 TapComment["Use RefLink[Limit,paclet:ref/Limit] to resolve the value: "], 
 TapTestSame[Limit[t^t, t -> 0], 1], 
 TapComment["The answer is valid for generic parameter values:"], 
 TapTestSame[s = Sum[Exp[k*x], {k, n}], (E^x*(-1 + E^(n*x)))/(-1 + E^x)], 
 TapComment["This particular parameter value gives an \
RefLink[Indeterminate,paclet:ref/Indeterminate] result:"], 
 TapTestSame[s /. x -> 0, Indeterminate], 
 TapComment["Use RefLink[Limit,paclet:ref/Limit] to resolve the value:"], 
 TapTestSame[Limit[s, x -> 0], n], 
 TapComment["Each iteration will result in lower precision:"], 
 TapTestSameBROKEN[NestList[Function[x, (x^2 - 1)/(x - 1) - 1], 3.`10., 16], 
  {3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 0., 0., 
   Indeterminate}], TapComment[
  "In this case an equivalent function does not lower precision: "], 
 TapTestSame[Simplify[(x^2 - 1)/(x - 1) - 1], x], 
 TapTestSame[NestList[Function[x, x], 3.`10., 16], 
  {3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3.}], 
 TapComment["Sometimes a higher precision is needed: "], 
 TapTestSame[NestList[Function[x, (x^2 - 1)/(x - 1) - 1], 3.`20., 16], 
  {3.`19.477121254719663, 3.`18.477121254719663, 3.`18.477121254719663, 
   3.`17.477121254719663, 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 
   3.}], TapComment[
  "RefLink[Indeterminate,paclet:ref/Indeterminate] does not equal itself:"], 
 TapTestSame[Indeterminate == Indeterminate, Indeterminate == Indeterminate], 
 TapComment["Use RefLink[SameQ,paclet:ref/SameQ] for testing against \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 TapTestSame[Indeterminate === Indeterminate, True], 
 TapComment["RefLink[Indeterminate,paclet:ref/Indeterminate] in functions \
with special evaluation semantics might go undetected:"], 
 TapTestSame[{True && Indeterminate, False && Indeterminate}, 
  {Indeterminate, False}]]
