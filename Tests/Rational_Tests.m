(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Enter a rational number:"], ESameTest[22/7, 22/7], 
 EComment["RefLink[Rational,paclet:ref/Rational] is the \
RefLink[Head,paclet:ref/Head] for rational numbers:"], 
 ESameTestBROKEN[Head[%], Rational], EComment["Enter a rational number with \
very big integers in the numerator and denominator:"], 
 ESameTest[1237918739182739817238917127398123/12809812308120812038038101, 
  1237918739182739817238917127398123/12809812308120812038038101], 
 EComment[
  "Rational numbers are represented with the smallest possible denominator:"]\
, ESameTest[7/49, 1/7], EComment["The RefLink[FullForm,paclet:ref/FullForm] \
of a rational number is \
RefLink[Rational,paclet:ref/Rational][numerator,denominator]:"], 
 ESameTestBROKEN[FullForm[22/7], Rational[22, 7]], 
 EComment[
  "Enter a rational using the RefLink[FullForm,paclet:ref/FullForm]:"], 
 ESameTest[Rational[22, 7], 22/7], ESameTestBROKEN[
  {Numerator[r], Denominator[r]}, {22, 7}], 
 EComment["RefLink[Part,paclet:ref/Part] does not work:"], 
 ESameTestBROKEN[r[[1]], (22/7)[[1]]], 
 EComment[
  "The pattern object _Rational can be used to stand for a rational number:"]\
, ESameTest[MatchQ[22/7, _Rational], True], 
 EComment["It cannot stand for a single integer:"], 
 ESameTest[MatchQ[6/3, _Rational], False], 
 ESameTestBROKEN[f[22/7, 201/64, x/y] /. rule, f[7/22, 64/201, x/y]], 
 EComment["An alternate way to write the rule:"], 
 ESameTest[f[22/7, 201/64, x/y] /. Rational[n_, d_] :> d/n, 
  f[7/22, 64/201, x/y]], ESameTestBROKEN[Nest[f, 3/2, 6], 
  4946041176255201878775086487573351061418968498177/
   3497379255757941172020851852070562919437964212608], 
 EComment["This is a close approximation to Sqrt[2]:"], 
 ESameTestBROKEN[Block[{$MaxExtraPrecision = Infinity}, N[% - Sqrt[2], 20]], 
  2.8904771932153645533`19.460969547003025/10^98], 
 ESameTestBROKEN[Nest[g, 3/2, 6], 
  4946041176255201878775086487573351061418968498177/
   3497379255757941172020851852070562919437964212608], 
 EComment["Rationals are numbers:"], ESameTest[NumberQ[22/7], True], 
 EComment["Rationals are atomic objects with no subexpressions:"], 
 ESameTest[AtomQ[22/7], True], EComment["Rationals are exact numbers:"], 
 ESameTest[ExactNumberQ[22/7], True], 
 EComment["Use RefLink[Rationals,paclet:ref/Rationals] to indicate \
assumptions and domain conditions: "], 
 ESameTest[Reduce[1/2 - 6*x + 10*x^2 - x^99/2 + x^100 == 0, x, Rationals], 
  x == 1/2], ESameTest[f[22/7], f[22/7]], ESameTestBROKEN[f[Evaluate[22/7]], 
  15], EComment["The unevaluated form is expressed in terms of \
RefLink[Times,paclet:ref/Times] and RefLink[Power,paclet:ref/Power]:"], 
 ESameTestBROKEN[FullForm[HoldForm[22/7]], HoldForm[22/7]]]
