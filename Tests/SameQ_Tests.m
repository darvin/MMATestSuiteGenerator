(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Test whether two expressions are identically the same:"], 
 ESameTest[x === y, False], ESameTest[x === x, True], 
 EComment["== remains symbolic unless literal values are given:"], 
 ESameTest[x == y, x == y], EComment["Full form:"], 
 ESameTest[x === y, False], EComment["Test equivalence of strings:"], 
 ESameTest["abc" === "ABC", False], 
 EComment["Numbers in different representations are not the same:"], 
 ESameTest[0. === 0, False], 
 EComment["== nevertheless treats them as equal:"], ESameTest[0. == 0, True], 
 EComment["Approximate numbers that differ in their last bit are still \
considered identical:"], ESameTest[1.`18.06179973983887 === 
   1.00000000000000000086736173799`18.06179973983887, True], 
 EComment["Test whether multiple expressions are all the same:"], 
 ESameTest[x === x === y, False], ESameTest[x === x === x, True], 
 EComment["Make a Kronecker delta (identity) tensor:"], 
 ESameTest[Boole[Array[SameQ, {3, 3, 3}]], 
  {{{1, 0, 0}, {0, 0, 0}, {0, 0, 0}}, {{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}, 
   {{0, 0, 0}, {0, 0, 0}, {0, 0, 1}}}], ESameTestBROKEN[Position[%, 1], 
  {{1, 1, 1}, {2, 2, 2}, {3, 3, 3}}]]
