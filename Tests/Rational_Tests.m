(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Enter a rational number:"], TapTestSame[22/7, 22/7], 
 TapComment["RefLink[Rational,paclet:ref/Rational] is the \
RefLink[Head,paclet:ref/Head] for rational numbers:"], 
 TapTestSameBROKEN[Head[%], Rational], TapComment["Enter a rational number \
with very big integers in the numerator and denominator:"], 
 TapTestSame[1237918739182739817238917127398123/12809812308120812038038101, 
  1237918739182739817238917127398123/12809812308120812038038101], 
 TapComment[
  "Rational numbers are represented with the smallest possible denominator:"]\
, TapTestSame[7/49, 1/7], TapComment["The \
RefLink[FullForm,paclet:ref/FullForm] of a rational number is \
RefLink[Rational,paclet:ref/Rational][numerator,denominator]:"], 
 TapTestSameBROKEN[FullForm[22/7], Rational[22, 7]], 
 TapComment[
  "Enter a rational using the RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSame[Rational[22, 7], 22/7], TapComment["You have to use \
RefLink[Numerator,paclet:ref/Numerator] and \
RefLink[Denominator,paclet:ref/Denominator] to extract parts of \
RefLink[Rational,paclet:ref/Rational] numbers: "], 
 TapTestSameBROKEN[r = 22/7 ;; {Numerator[r], Denominator[r]}, {22, 7}], 
 TapComment["RefLink[Part,paclet:ref/Part] does not work:"], 
 TapTestSameBROKEN[r[[1]], (22/7)[[1]]], 
 TapComment[
  "The pattern object _Rational can be used to stand for a rational number:"]\
, TapTestSame[MatchQ[22/7, _Rational], True], 
 TapComment["It cannot stand for a single integer:"], 
 TapTestSame[MatchQ[6/3, _Rational], False], 
 TapComment["A rule that replaces all rationals with their reciprocals:"], 
 TapTestSameBROKEN[rule = x_Rational :> Denominator[x]/Numerator[x] ;; 
      f[22/7, 201/64, x/y] /. rule, f[7/22, 64/201, x/y]], 
 TapComment["An alternate way to write the rule:"], 
 TapTestSame[f[22/7, 201/64, x/y] /. Rational[n_, d_] :> d/n, 
  f[7/22, 64/201, x/y]], TapComment[
  "Define a function that only applies to rational numbers:"], 
 TapTestSame[f[r_Rational] := Module[{x = Numerator[r], y = Denominator[r]}, 
     (x^2 + 2*y^2)/(2*x*y)]; Nest[f, 3/2, 6], 
  4946041176255201878775086487573351061418968498177/
   3497379255757941172020851852070562919437964212608], 
 TapComment["This is a close approximation to Sqrt[2]:"], 
 TapTestSameBROKEN[Block[{$MaxExtraPrecision = Infinity}, 
   N[% - Sqrt[2], 20]], 2.8904771932153645533`19.460969547003025/10^98], 
 TapComment["An alternative definition of the function:"], 
 TapTestSame[g[Rational[x_, y_]] := (x^2 + 2*y^2)/(2*x*y); Nest[g, 3/2, 6], 
  4946041176255201878775086487573351061418968498177/
   3497379255757941172020851852070562919437964212608], 
 TapComment["Rationals are numbers:"], TapTestSame[NumberQ[22/7], True], 
 TapComment["Rationals are atomic objects with no subexpressions:"], 
 TapTestSame[AtomQ[22/7], True], TapComment["Rationals are exact numbers:"], 
 TapTestSame[ExactNumberQ[22/7], True], 
 TapComment["Use RefLink[Rationals,paclet:ref/Rationals] to indicate \
assumptions and domain conditions: "], 
 TapTestSame[Reduce[1/2 - 6*x + 10*x^2 - x^99/2 + x^100 == 0, x, Rationals], 
  x == 1/2], TapComment["Numbers entered in the form n/m only become \
RefLink[Rational,paclet:ref/Rational] numbers on evaluation:"], 
 TapTestSame[SetAttributes[f, HoldAll]; f[x_Rational] := 
    Numerator[x] - Denominator[x]; f[22/7], f[22/7]], 
 TapTestSame[f[Evaluate[22/7]], 15], TapComment["The unevaluated form is \
expressed in terms of RefLink[Times,paclet:ref/Times] and \
RefLink[Power,paclet:ref/Power]:"], TapTestSameBROKEN[
  FullForm[HoldForm[22/7]], HoldForm[22/7]]]
