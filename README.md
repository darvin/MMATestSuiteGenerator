[![Build Status](https://travis-ci.org/darvin/MMATestSuiteGenerator.svg?branch=master)](https://travis-ci.org/darvin/MMATestSuiteGenerator)

   -  Add file from `/Applications/Mathematica.app/Contents/Documentation/English/System/ReferencePages/Symbols/` to `./WHITELIST`
   - Run: `make generate-tests-local`
   - Find generated from docstrings tests in `./output/`.

## [Website with automated build results](https://darvin.github.io/MMATestSuiteGenerator/)
   
### Example output:



```Mathematica
ESimpleExamples[EComment["Test if an expression is an integer:"], 
 ESameTest[MatchQ[12345, _Integer], True], 
 EComment["Test if an expression is a sum of two or more terms:"], 
 ESameTest[MatchQ[(x - 1)*(1 + 2*x + 3*x^2), _ + __], False], 
 ESameTestBROKEN[MatchQ[Expand[x*(1 + 2*x + 3*x^2)], _ + __], True], 
 EComment["Test if an expression is explicitly zero:"], 
 ESameTest[MatchQ[1 + 1/GoldenRatio - GoldenRatio, 0], False], 
 ESameTest[MatchQ[Simplify[1 + 1/GoldenRatio - GoldenRatio], 0], True], 
 EComment["Match an association:"], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2], _Association], True], 
 EComment["Match a rule in an association, using an association as a \
pattern:"], ESameTest[MatchQ[Association[a -> 1], Association[a -> _]], 
  True], ESameTest[MatchQ[Association[a -> 1], Association[_ -> 1]], True], 
 EComment["KeyValuePattern lets you match any element in an association:"], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2, c -> 3], 
   KeyValuePattern[b -> 2]], True], 
 EComment["It also works on lists of rules:"], 
 ESameTest[MatchQ[{a -> 1, b -> 2, c -> 3}, KeyValuePattern[b -> 2]], True], 
 EComment["Match a rule in an association with a condition:"], 
 ESameTest[MatchQ[Association[a -> 1], Association[a -> _?OddQ]], True], 
 ESameTest[MatchQ[Association[a -> "foo"], 
   Association[a -> x_ /; StringQ[x]]], True], 
 EComment["Match a Rule in an association using Alternatives:"], 
 ESameTest[MatchQ[Association[a -> 1], Association[_ -> 1 | 2]], True], 
 EComment["Use Verbatim to match a literal blank:"], 
 ESameTest[MatchQ[Association[a -> _], Association[a -> Verbatim[_]]], True], 
 EComment[
  "_ or Blank has special meaning in an association used as a pattern:"], 
 ESameTest[MatchQ[Association[a -> 1], Association[a -> _]], True], 
 EComment[
  "Use __ or BlankSequence to match more than one rule in an association:"], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2], Association[_]], False], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2], Association[__]], True], 
 EComment["Match an association containing a given rule and possibly more:"], 
 ESameTestBROKEN[MatchQ[Association[a -> 1], Association[a -> 1, ___]], 
  True], ESameTestBROKEN[MatchQ[Association[a -> 1, b -> 2], 
   Association[a -> 1, ___]], True], 
 EComment["Match an association containing three elements:"], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2, c -> 3], Association[_, _, _]], 
  True], ESameTest[MatchQ[Association[a -> 1, b -> 2, c -> 3], 
   a_ /; Length[a] == 3], True], EComment["Match nested associations:"], 
 ESameTest[MatchQ[Association[1 -> Association[2 -> x]], 
   Association[_ -> Association[_]]], True]]

```
