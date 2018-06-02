(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Find cases of any expression that satisfies the \
RefLink[NumberQ,paclet:ref/NumberQ] test:"], 
 ESameTest[Cases[{1, 2, 3.5, x, y, 4}, _?NumberQ], {1, 2, 3.5, 4}], 
 EComment["Test whether a list has only positive elements:"], 
 ESameTest[MatchQ[{1, E, Pi}, {__?Positive}], True], 
 ESameTest[MatchQ[{1, I, 0}, {__?Positive}], False], 
 ESameTestBROKEN[f[2], 0.451948], ESameTestBROKEN[f[(1 + Sqrt[2])/5], 
  0.0135768], ESameTest[f[a], f[a]], 
 EComment["Replace negative numbers with zero:"], 
 ESameTest[{3, -5, 2, 7, -6, 3} /. _?Negative :> 0, {3, 0, 2, 7, 0, 3}], 
 EComment["Find elements in a list that are divisible by 7:"], 
 ESameTest[Cases[Range[0, 70], _?(Divisible[#1, 7] & )], 
  {0, 7, 14, 21, 28, 35, 42, 49, 56, 63, 70}], 
 EComment["Elements that are divisible by both 5 and 7:"], 
 ESameTest[Cases[Range[0, 350], _?(Divisible[#1, 7] && Divisible[#1, 5] & )], 
  {0, 35, 70, 105, 140, 175, 210, 245, 280, 315, 350}], 
 EComment["Elements that are divisible by either 5 or 7:"], 
 ESameTest[Cases[Range[0, 35], _?(Divisible[#1, 7] || Divisible[#1, 5] & )], 
  {0, 5, 7, 10, 14, 15, 20, 21, 25, 28, 30, 35}], 
 ESameTestBROKEN[f[0, 3], 0], ESameTest[f[2, 4], f[2, 4]], 
 ESameTest[f[-1, 3], f[-1, 3]], ESameTestBROKEN[f[-2], 1/4], 
 ESameTest[f[2], f[2]], ESameTest[f[-4], f[-4]], 
 EComment[
  "Use RefLink[PatternTest,paclet:ref/PatternTest] on a complex pattern:"], 
 ESameTest[MatchQ[{{a, b}, {c, d}}, ({_, _})?MatrixQ], True], 
 ESameTest[MatchQ[{a, b}, ({_, _})?MatrixQ], False], 
 EComment["Search for numbers without allowing expressions to evaluate:"], 
 ESameTest[Cases[Hold[Print[5], Sin, 2 + 2, 7, Sqrt[2]], 
   _?(Function[{n}, NumberQ[Unevaluated[n]], HoldAll])], {7}], 
 EComment["Just using RefLink[NumberQ,paclet:ref/NumberQ] would allow each \
element to evaluate:"], ESameTest[Cases[Hold[Print[5], Sin, 2 + 2, 7, 
    Sqrt[2]], _?NumberQ], {4, 7}], EComment["RefLink[PatternTest,paclet:ref/P\
atternTest] applies test functions to patterns, which need not have names:"], 
 ESameTest[Cases[{{a, b}, {1, 2, 3}, {{d, 6}, {d, 10}}}, ({_, _})?VectorQ], 
  {{a, b}}], EComment["RefLink[Condition,paclet:ref/Condition] evaluates a \
Boolean expression on named parts of a pattern:"], 
 ESameTest[Cases[{{a, b}, {1, 2, 3}, {{d, 6}, {d, 10}}}, 
   {x_, y_} /;  !ListQ[x] &&  !ListQ[y]], {{a, b}}], 
 EComment["Use RefLink[Except,paclet:ref/Except] to effectively negate \
RefLink[PatternTest,paclet:ref/PatternTest]:"], 
 ESameTest[Replace[{1, 7, "Hi", 3, Indeterminate}, Except[_?NumericQ] :> 0, 
   1], {1, 7, 0, 3, 0}], EComment["RefLink[PatternTest,paclet:ref/PatternTest\
] evaluates potential matches that are a part of a held expression:"], 
 ESameTest[MatchQ[Hold[2 + 3], Hold[_?IntegerQ]], True], 
 EComment["Due to normal evaluation rules, expressions may evaluate before \
being examined by the test function:"], 
 ESameTest[MatchQ[Hold[2 + 3], Hold[_?(IntegerQ[Unevaluated[#1]] & )]], 
  True], EComment["Use the three-argument form of \
RefLink[Function,paclet:ref/Function] or write the pattern using \
RefLink[Condition,paclet:ref/Condition] to prevent this:"], 
 ESameTest[MatchQ[Hold[2 + 3], 
   Hold[_?(Function[{n}, IntegerQ[Unevaluated[n]], HoldAll])]], False], 
 ESameTest[MatchQ[Hold[2 + 3], Hold[n_] /; IntegerQ[Unevaluated[n]]], False]]
