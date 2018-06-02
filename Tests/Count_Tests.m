(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Count how many times b occurs:"], 
 ESameTest[Count[{a, b, a, a, b, c, b}, b], 3], 
 EComment[
  "Count powers of x in an RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[Count[\[LeftAssociation] 1 -> 1 + x^2, 2 -> x^4, 
    3 -> a + (1 + x^2)^2 \[RightAssociation], x^_], 1], 
 EComment["Count powers of x on all levels:"], 
 ESameTest[Count[\[LeftAssociation] 1 -> 1 + x^2, 2 -> x^4, 
    3 -> a + (1 + x^2)^2 \[RightAssociation], x^_, Infinity], 3], 
 EComment["Count symbols:"], 
 ESameTest[Count[\[LeftAssociation] 1 -> 1 + x^2, 2 -> x^4, 
    3 -> a + (1 + x^2)^2 \[RightAssociation], _Symbol, Infinity], 4], 
 EComment["RefLink[Count,paclet:ref/Count] works with patterns:"], 
 ESameTest[Count[{a, 2, a, a, 1, c, b, 3, 3}, _Integer], 4], 
 EComment["Count the number of elements not matching b:"], 
 ESameTest[Count[{a, b, a, a, b, c, b, a, a}, Except[b]], 6], 
 EComment["Count occurrences of b down to level 2:"], 
 ESameTest[Count[{{a, a, b}, b, {a, b, a}}, b, 2], 3], 
 EComment["Count occurrences at level 2 only:"], 
 ESameTest[Count[{{a, a, b}, b, {a, b, a}}, b, {2}], 2], 
 EComment[
  "Count all numeric expressions appearing as part of a larger expression:"], 
 ESameTest[Count[x^3 + 1.5*x^2 + Pi*x + 7, _?NumericQ, -1], 5], 
 EComment["A numeric level specification does not include level zero:"], 
 ESameTest[Count[5, _?NumericQ, -1], 0], 
 EComment["Use a two-element list to explicitly include level zero:"], 
 ESameTest[Count[5, _?NumericQ, {0, -1}], 1], EComment["RefLink[Count,paclet:\
ref/Count] works with any head, not just RefLink[List,paclet:ref/List]:"], 
 ESameTest[Count[f[a, b, b, a], b], 2], 
 EComment["By default, expressions appearing as heads are not counted:"], 
 ESameTest[Count[Sin[x] + Cos[x] + Sin[x]^2, Sin, -1], 0], 
 EComment["Use the option \
RefLink[Heads,paclet:ref/Heads]->RefLink[True,paclet:ref/True] to include \
them:"], ESameTest[Count[Sin[x] + Cos[x] + Sin[x]^2, Sin, -1, Heads -> True], 
  2], EComment["Count the total number of symbols in an expression:"], 
 ESameTest[Count[a + b^2/(a + b), _Symbol, Infinity], 4], 
 EComment["Count the total number of elements greater than 0.5:"], 
 ESameTestBROKEN[Count[RandomReal[1, {100}], u_ /; u > 0.5], 40], 
 EComment["Count the number of rows whose first element is 1:"], 
 ESameTest[Count[{{1, 2}, {2, 3}, {1, 5}}, {u_, _} /; u == 1], 2], 
 EComment["RefLink[Count,paclet:ref/Count] returns the length of the result \
given by RefLink[Cases,paclet:ref/Cases]:"], 
 ESameTest[Count[{1, "f", g, "h", "7"}, _?StringQ], 3], 
 ESameTest[Length[Cases[{1, "f", g, "h", "7"}, _?StringQ]], 3], 
 EComment["RefLink[Count,paclet:ref/Count] returns the length of the result \
given by RefLink[Position,paclet:ref/Position]:"], 
 ESameTest[Count[{1, "f", g, "h", "7"}, _?StringQ], 3], 
 ESameTest[Length[Position[{1, "f", g, "h", "7"}, _?StringQ]], 3], 
 EComment["A count at level {0} is effectively a numericized version of \
RefLink[MatchQ,paclet:ref/MatchQ]:"], ESameTest[MatchQ[5, _Integer], True], 
 ESameTest[Count[5, _Integer, {0}] == 1, True], 
 EComment["For most expressions, RefLink[LeafCount,paclet:ref/LeafCount] \
equals the count matching RefLink[Blank,paclet:ref/Blank][] at level {-1}:"], 
 ESameTest[LeafCount[1 + a + b^2], 6], 
 ESameTest[Count[1 + a + b^2, _, {-1}, Heads -> True], 6], 
 EComment["RefLink[Count,paclet:ref/Count] treats \
RefLink[Rational,paclet:ref/Rational] and RefLink[Complex,paclet:ref/Complex] \
as atoms:"], ESameTest[AtomQ /@ {1/2, 1 + I}, {True, True}], 
 ESameTest[Count[{1/2, 1 + I}, _, {-1}, Heads -> True], 3], 
 EComment["RefLink[LeafCount,paclet:ref/LeafCount] counts \
RefLink[Rational,paclet:ref/Rational] and RefLink[Complex,paclet:ref/Complex] \
numbers using their RefLink[FullForm,paclet:ref/FullForm]:"], 
 ESameTestBROKEN[FullForm[{1/2, 1 + I}], {Rational[1, 2], Complex[1, 1]}], 
 ESameTest[LeafCount[{1/2, 1 + I}], 7], EComment["RefLink[Count,paclet:ref/Co\
unt] looks for matches based on patterns, which may not be the same as \
numerical equality:"], ESameTest[Count[{0.9, 0.15*6, 1.8/2}, 0.9], 2], 
 EComment["Write a pattern using RefLink[Condition,paclet:ref/Condition] to \
force searching based on numerical equality:"], 
 ESameTest[Count[{0.9, 0.15*6, 1.8/2}, n_ /; n == 0.9], 3]]
