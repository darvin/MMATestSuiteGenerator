(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Count how many times b occurs:"], 
 TapTestSame[Count[{a, b, a, a, b, c, b}, b], 3], 
 TapComment[
  "Count powers of x in an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Count[\[LeftAssociation] 1 -> 1 + x^2, 2 -> x^4, 
    3 -> a + (1 + x^2)^2 \[RightAssociation], x^_], 1], 
 TapComment["Count powers of x on all levels:"], 
 TapTestSame[Count[\[LeftAssociation] 1 -> 1 + x^2, 2 -> x^4, 
    3 -> a + (1 + x^2)^2 \[RightAssociation], x^_, Infinity], 3], 
 TapComment["Count symbols:"], 
 TapTestSame[Count[\[LeftAssociation] 1 -> 1 + x^2, 2 -> x^4, 
    3 -> a + (1 + x^2)^2 \[RightAssociation], _Symbol, Infinity], 4], 
 TapComment["RefLink[Count,paclet:ref/Count] works with patterns:"], 
 TapTestSame[Count[{a, 2, a, a, 1, c, b, 3, 3}, _Integer], 4], 
 TapComment["Count the number of elements not matching b:"], 
 TapTestSame[Count[{a, b, a, a, b, c, b, a, a}, Except[b]], 6], 
 TapComment["Count occurrences of b down to level 2:"], 
 TapTestSame[Count[{{a, a, b}, b, {a, b, a}}, b, 2], 3], 
 TapComment["Count occurrences at level 2 only:"], 
 TapTestSame[Count[{{a, a, b}, b, {a, b, a}}, b, {2}], 2], 
 TapComment[
  "Count all numeric expressions appearing as part of a larger expression:"], 
 TapTestSame[Count[x^3 + 1.5*x^2 + Pi*x + 7, _?NumericQ, -1], 5], 
 TapComment["A numeric level specification does not include level zero:"], 
 TapTestSame[Count[5, _?NumericQ, -1], 0], 
 TapComment["Use a two-element list to explicitly include level zero:"], 
 TapTestSame[Count[5, _?NumericQ, {0, -1}], 1], 
 TapComment["RefLink[Count,paclet:ref/Count] works with any head, not just \
RefLink[List,paclet:ref/List]:"], TapTestSame[Count[f[a, b, b, a], b], 2], 
 TapComment["By default, expressions appearing as heads are not counted:"], 
 TapTestSame[Count[Sin[x] + Cos[x] + Sin[x]^2, Sin, -1], 0], 
 TapComment["Use the option \
RefLink[Heads,paclet:ref/Heads]->RefLink[True,paclet:ref/True] to include \
them:"], TapTestSame[Count[Sin[x] + Cos[x] + Sin[x]^2, Sin, -1, 
   Heads -> True], 2], TapComment[
  "Count the total number of symbols in an expression:"], 
 TapTestSame[Count[a + b^2/(a + b), _Symbol, Infinity], 4], 
 TapComment["Count the total number of elements greater than 0.5:"], 
 TapTestSameBROKEN[Count[RandomReal[1, {100}], u_ /; u > 0.5], 40], 
 TapComment["Count the number of rows whose first element is 1:"], 
 TapTestSame[Count[{{1, 2}, {2, 3}, {1, 5}}, {u_, _} /; u == 1], 2], 
 TapComment["RefLink[Count,paclet:ref/Count] returns the length of the result \
given by RefLink[Cases,paclet:ref/Cases]:"], 
 TapTestSame[Count[{1, "f", g, "h", "7"}, _?StringQ], 3], 
 TapTestSame[Length[Cases[{1, "f", g, "h", "7"}, _?StringQ]], 3], 
 TapComment["RefLink[Count,paclet:ref/Count] returns the length of the result \
given by RefLink[Position,paclet:ref/Position]:"], 
 TapTestSame[Count[{1, "f", g, "h", "7"}, _?StringQ], 3], 
 TapTestSame[Length[Position[{1, "f", g, "h", "7"}, _?StringQ]], 3], 
 TapComment["A count at level {0} is effectively a numericized version of \
RefLink[MatchQ,paclet:ref/MatchQ]:"], TapTestSame[MatchQ[5, _Integer], True], 
 TapTestSame[Count[5, _Integer, {0}] == 1, True], 
 TapComment["For most expressions, RefLink[LeafCount,paclet:ref/LeafCount] \
equals the count matching RefLink[Blank,paclet:ref/Blank][] at level {-1}:"], 
 TapTestSame[LeafCount[1 + a + b^2], 6], 
 TapTestSame[Count[1 + a + b^2, _, {-1}, Heads -> True], 6], 
 TapComment["RefLink[Count,paclet:ref/Count] treats \
RefLink[Rational,paclet:ref/Rational] and RefLink[Complex,paclet:ref/Complex] \
as atoms:"], TapTestSame[AtomQ /@ {1/2, 1 + I}, {True, True}], 
 TapTestSame[Count[{1/2, 1 + I}, _, {-1}, Heads -> True], 3], 
 TapComment["RefLink[LeafCount,paclet:ref/LeafCount] counts \
RefLink[Rational,paclet:ref/Rational] and RefLink[Complex,paclet:ref/Complex] \
numbers using their RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSameBROKEN[FullForm[{1/2, 1 + I}], {Rational[1, 2], Complex[1, 1]}], 
 TapTestSame[LeafCount[{1/2, 1 + I}], 7], TapComment["RefLink[Count,paclet:re\
f/Count] looks for matches based on patterns, which may not be the same as \
numerical equality:"], TapTestSame[Count[{0.9, 0.15*6, 1.8/2}, 0.9], 2], 
 TapComment["Write a pattern using RefLink[Condition,paclet:ref/Condition] to \
force searching based on numerical equality:"], 
 TapTestSame[Count[{0.9, 0.15*6, 1.8/2}, n_ /; n == 0.9], 3]]
