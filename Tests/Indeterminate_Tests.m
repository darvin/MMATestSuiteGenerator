(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["RefLink[Indeterminate,paclet:ref/Indeterminate] is \
returned when a value cannot be unambiguously defined:"], 
 ESameTest[0/0, Indeterminate], EComment["Any numeric function of \
RefLink[Indeterminate,paclet:ref/Indeterminate] also gives \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 ESameTest[Sin[Indeterminate], Indeterminate], 
 ESameTestBROKEN[f[Indeterminate], Indeterminate], 
 EComment["Negative precision/accuracy can yield \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 ESameTest[SetAccuracy[2, -1], 0.], ESameTestBROKEN[%/%, Indeterminate], 
 EComment["Infinity in an unknown direction:"], 
 ESameTest[DirectedInfinity[Indeterminate], ComplexInfinity], 
 EComment["Mathematical operations with \
RefLink[Indeterminate,paclet:ref/Indeterminate] produce \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 ESameTest[Interval[{0, 1}] + Indeterminate, Indeterminate], 
 ESameTest[f[x] + Indeterminate, Indeterminate], 
 ESameTest[Integrate[Indeterminate, x], Indeterminate], 
 ESameTest[D[Indeterminate, z], Indeterminate], 
 EComment[
  "RefLink[Indeterminate,paclet:ref/Indeterminate] threads over lists:"], 
 ESameTest[{1, 2, 3} + Indeterminate, {Indeterminate, Indeterminate, 
   Indeterminate}], ESameTest[{1, 2, 3}*Indeterminate, 
  {Indeterminate, Indeterminate, Indeterminate}], 
 EComment["Digits beyond the limit of precision are \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 ESameTest[RealDigits[6.7, 10, 20], {{6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, Indeterminate, Indeterminate, Indeterminate, Indeterminate}, 
   1}], EComment["Create a number of lower precision:"], 
 ESameTest[FromDigits[{{6, 7, 0, 0, 0, Indeterminate}, 1}], 6.7], 
 EComment[
  "RefLink[Indeterminate,paclet:ref/Indeterminate] is not a number:"], 
 ESameTest[NumberQ[Indeterminate], False], 
 EComment["It is neither real nor complex:"], 
 ESameTest[{Re[Indeterminate], Im[Indeterminate]}, 
  {Indeterminate, Indeterminate}], 
 EComment["The value cannot be unambiguously defined: "], 
 ESameTest[t^t /. t -> 0, Indeterminate], 
 EComment["Use RefLink[Limit,paclet:ref/Limit] to resolve the value: "], 
 ESameTest[Limit[t^t, t -> 0], 1], 
 EComment["The answer is valid for generic parameter values:"], 
 ESameTest[s = Sum[Exp[k*x], {k, n}], (E^x*(-1 + E^(n*x)))/(-1 + E^x)], 
 EComment["This particular parameter value gives an \
RefLink[Indeterminate,paclet:ref/Indeterminate] result:"], 
 ESameTest[s /. x -> 0, Indeterminate], 
 EComment["Use RefLink[Limit,paclet:ref/Limit] to resolve the value:"], 
 ESameTest[Limit[s, x -> 0], n], 
 EComment["Each iteration will result in lower precision:"], 
 ESameTestBROKEN[NestList[Function[x, (x^2 - 1)/(x - 1) - 1], 3.`10., 16], 
  {3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 0., 0., 
   Indeterminate}], 
 EComment["In this case an equivalent function does not lower precision: "], 
 ESameTest[Simplify[(x^2 - 1)/(x - 1) - 1], x], 
 ESameTest[NestList[Function[x, x], 3.`10., 16], 
  {3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3.}], 
 EComment["Sometimes a higher precision is needed: "], 
 ESameTest[NestList[Function[x, (x^2 - 1)/(x - 1) - 1], 3.`20., 16], 
  {3.`19.477121254719663, 3.`18.477121254719663, 3.`18.477121254719663, 
   3.`17.477121254719663, 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 3., 
   3.}], EComment[
  "RefLink[Indeterminate,paclet:ref/Indeterminate] does not equal itself:"], 
 ESameTest[Indeterminate == Indeterminate, Indeterminate == Indeterminate], 
 EComment["Use RefLink[SameQ,paclet:ref/SameQ] for testing against \
RefLink[Indeterminate,paclet:ref/Indeterminate]:"], 
 ESameTest[Indeterminate === Indeterminate, True], 
 EComment["RefLink[Indeterminate,paclet:ref/Indeterminate] in functions with \
special evaluation semantics might go undetected:"], 
 ESameTest[{True && Indeterminate, False && Indeterminate}, 
  {Indeterminate, False}]]
