(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find cases of any expression that satisfies the \
RefLink[NumberQ,paclet:ref/NumberQ] test:"], 
 TapTestSame[Cases[{1, 2, 3.5, x, y, 4}, _?NumberQ], {1, 2, 3.5, 4}], 
 TapComment["Test whether a list has only positive elements:"], 
 TapTestSame[MatchQ[{1, E, Pi}, {__?Positive}], True], 
 TapTestSame[MatchQ[{1, I, 0}, {__?Positive}], False], 
 TapComment["Create a definition that only applies to numeric arguments:"], 
 TapTestSame[f[(x_)?NumericQ] := NIntegrate[Sin[t^3], {t, 0, x}]; f[2], 
  0.451948], TapTestSame[f[(1 + Sqrt[2])/5], 0.0135768], 
 TapTestSame[f[a], f[a]], TapComment["Replace negative numbers with zero:"], 
 TapTestSame[{3, -5, 2, 7, -6, 3} /. _?Negative :> 0, {3, 0, 2, 7, 0, 3}], 
 TapComment["Find elements in a list that are divisible by 7:"], 
 TapTestSame[Cases[Range[0, 70], _?(Divisible[#1, 7] & )], 
  {0, 7, 14, 21, 28, 35, 42, 49, 56, 63, 70}], 
 TapComment["Elements that are divisible by both 5 and 7:"], 
 TapTestSame[Cases[Range[0, 350], 
   _?(Divisible[#1, 7] && Divisible[#1, 5] & )], 
  {0, 35, 70, 105, 140, 175, 210, 245, 280, 315, 350}], 
 TapComment["Elements that are divisible by either 5 or 7:"], 
 TapTestSame[Cases[Range[0, 35], 
   _?(Divisible[#1, 7] || Divisible[#1, 5] & )], 
  {0, 5, 7, 10, 14, 15, 20, 21, 25, 28, 30, 35}], 
 TapComment["Create a function that only evaluates when given a non-negative \
number and a prime:"], TapTestSame[f[(n_)?NonNegative, (p_)?PrimeQ] := n^p; 
   f[0, 3], 0], TapTestSame[f[2, 4], f[2, 4]], 
 TapTestSame[f[-1, 3], f[-1, 3]], 
 TapComment["Create a function that only evaluates for negative primes:"], 
 TapTestSameBROKEN[f[(p_)?(Negative[#1] && PrimeQ[#1] & )] := p^p; f[-2], 
  1/4], TapTestSame[f[2], f[2]], TapTestSame[f[-4], f[-4]], 
 TapComment[
  "Use RefLink[PatternTest,paclet:ref/PatternTest] on a complex pattern:"], 
 TapTestSame[MatchQ[{{a, b}, {c, d}}, ({_, _})?MatrixQ], True], 
 TapTestSame[MatchQ[{a, b}, ({_, _})?MatrixQ], False], 
 TapComment["Search for numbers without allowing expressions to evaluate:"], 
 TapTestSame[Cases[Hold[Print[5], Sin, 2 + 2, 7, Sqrt[2]], 
   _?(Function[{n}, NumberQ[Unevaluated[n]], HoldAll])], {7}], 
 TapComment["Just using RefLink[NumberQ,paclet:ref/NumberQ] would allow each \
element to evaluate:"], TapTestSame[
  Cases[Hold[Print[5], Sin, 2 + 2, 7, Sqrt[2]], _?NumberQ], {4, 7}], 
 TapComment["RefLink[PatternTest,paclet:ref/PatternTest] applies test \
functions to patterns, which need not have names:"], 
 TapTestSame[Cases[{{a, b}, {1, 2, 3}, {{d, 6}, {d, 10}}}, ({_, _})?VectorQ], 
  {{a, b}}], TapComment["RefLink[Condition,paclet:ref/Condition] evaluates a \
Boolean expression on named parts of a pattern:"], 
 TapTestSame[Cases[{{a, b}, {1, 2, 3}, {{d, 6}, {d, 10}}}, 
   {x_, y_} /;  !ListQ[x] &&  !ListQ[y]], {{a, b}}], 
 TapComment["Use RefLink[Except,paclet:ref/Except] to effectively negate \
RefLink[PatternTest,paclet:ref/PatternTest]:"], 
 TapTestSame[Replace[{1, 7, "Hi", 3, Indeterminate}, Except[_?NumericQ] :> 0, 
   1], {1, 7, 0, 3, 0}], TapComment["RefLink[PatternTest,paclet:ref/PatternTe\
st] evaluates potential matches that are a part of a held expression:"], 
 TapTestSame[MatchQ[Hold[2 + 3], Hold[_?IntegerQ]], True], 
 TapComment["Due to normal evaluation rules, expressions may evaluate before \
being examined by the test function:"], 
 TapTestSame[MatchQ[Hold[2 + 3], Hold[_?(IntegerQ[Unevaluated[#1]] & )]], 
  True], TapComment["Use the three-argument form of \
RefLink[Function,paclet:ref/Function] or write the pattern using \
RefLink[Condition,paclet:ref/Condition] to prevent this:"], 
 TapTestSame[MatchQ[Hold[2 + 3], 
   Hold[_?(Function[{n}, IntegerQ[Unevaluated[n]], HoldAll])]], False], 
 TapTestSame[MatchQ[Hold[2 + 3], Hold[n_] /; IntegerQ[Unevaluated[n]]], 
  False]]
