(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Head[f[a, b]], f], ESameTest[Head[a + b + c], 
  Plus], ESameTest[Head[{a, b, c}], List], ESameTest[Head[45], Integer], 
 ESameTest[Head[x], Symbol], EComment["Heads need not be symbols:"], 
 ESameTest[Head[f[x][y][z]], f[x][y]], 
 EComment["Find the cases with a head of \
RefLink[Integer,paclet:ref/Integer]:"], 
 ESameTest[Cases[{2, 1, x, 3, y}, _Integer], {2, 1, 3}], 
 EComment["The head is the part with index 0:"], 
 ESameTest[(a + b + c)[[0]], Plus], 
 EComment["The head is based on RefLink[FullForm,paclet:ref/FullForm]:"], 
 ESameTest[Head[a/b], Times], ESameTestBROKEN[FullForm[a/b], a/b], 
 EComment[
  "RefLink[Head,paclet:ref/Head] always eventually burrows to a symbol:"], 
 ESameTest[FixedPoint[Head, f[x][y][z]], Symbol], 
 ESameTest[FixedPoint[Head, {3, 4, 5}], Symbol]]
