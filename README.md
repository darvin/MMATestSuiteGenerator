

   -  Add file from `/Applications/Mathematica.app/Contents/Documentation/English/System/ReferencePages/Symbols/` to `./WHITELIST`
   - Run: `make generate-tests-local`
   - Find generated from docstrings tests in `./output/`.
   - *Note*: There is bunch of stuff in `Dockerfile` and `Makefile`, it would be possible to generate and run tests on CI, but MMA 10 provided with raspberri doesnt have `NotebookImport`, `export_tests_from_docs.m` should be adapted to use `Notebook` and `Import` separately :(
   
   
### Example output:



```Mathematica
ESimpleExamples[ESameTest[-(1 - x + x^2), -1 + x - x^2], 
 ESameTest[-{1, 2, 3}, {-1, -2, -3}], ESameTest[-x, -x], 
 ESameTestBROKEN[FullForm[%], -x], ESameTestBROKEN[Cases[{x, -x}, (a_.)*x], 
  {x, -x}]]


ESimpleExamples[ESameTest[MatchQ[12345, _Integer], True], 
 ESameTest[MatchQ[(x - 1)*(1 + 2*x + 3*x^2), _ + __], False], 
 ESameTestBROKEN[MatchQ[Expand[x*(1 + 2*x + 3*x^2)], _ + __], True], 
 ESameTest[MatchQ[1 + 1/GoldenRatio - GoldenRatio, 0], False], 
 ESameTest[MatchQ[Simplify[1 + 1/GoldenRatio - GoldenRatio], 0], True], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2], _Association], True], 
 ESameTest[MatchQ[Association[a -> 1], Association[a -> _]], True], 
 ESameTest[MatchQ[Association[a -> 1], Association[_ -> 1]], True], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2, c -> 3], 
   KeyValuePattern[b -> 2]], True], 
 ESameTest[MatchQ[{a -> 1, b -> 2, c -> 3}, KeyValuePattern[b -> 2]], True], 
 ESameTest[MatchQ[Association[a -> 1], Association[a -> _?OddQ]], True], 
 ESameTest[MatchQ[Association[a -> "foo"], 
   Association[a -> x_ /; StringQ[x]]], True], 
 ESameTest[MatchQ[Association[a -> 1], Association[_ -> 1 | 2]], True], 
 ESameTest[MatchQ[Association[a -> _], Association[a -> Verbatim[_]]], True], 
 ESameTest[MatchQ[Association[a -> 1], Association[a -> _]], True], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2], Association[_]], False], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2], Association[__]], True], 
 ESameTestBROKEN[MatchQ[Association[a -> 1], Association[a -> 1, ___]], 
  True], ESameTestBROKEN[MatchQ[Association[a -> 1, b -> 2], 
   Association[a -> 1, ___]], True], 
 ESameTest[MatchQ[Association[a -> 1, b -> 2, c -> 3], Association[_, _, _]], 
  True], ESameTest[MatchQ[Association[a -> 1, b -> 2, c -> 3], 
   a_ /; Length[a] == 3], True], 
 ESameTest[MatchQ[Association[1 -> Association[2 -> x]], 
   Association[_ -> Association[_]]], True]]
```

(it actually could parse out comments too, but it needs frontend that is unavailable in command line

```
FrontEndObject::notavail: 
   A front end is not available; certain operations require a front end.
```
