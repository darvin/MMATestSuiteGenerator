(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Test whether two expressions are identically the same:"], 
 TapTestSame[x === y, False], TapTestSame[x === x, True], 
 TapComment["== remains symbolic unless literal values are given:"], 
 TapTestSame[x == y, x == y], TapComment["Full form:"], 
 TapTestSame[x === y, False], TapComment["Test equivalence of strings:"], 
 TapTestSame["abc" === "ABC", False], 
 TapComment["Numbers in different representations are not the same:"], 
 TapTestSame[0. === 0, False], 
 TapComment["== nevertheless treats them as equal:"], 
 TapTestSame[0. == 0, True], TapComment["Approximate numbers that differ in \
their last bit are still considered identical:"], 
 TapTestSame[1.`18.06179973983887 === 
   1.00000000000000000086736173799`18.06179973983887, True], 
 TapComment["Test whether multiple expressions are all the same:"], 
 TapTestSame[x === x === y, False], TapTestSame[x === x === x, True], 
 TapComment["Make a Kronecker delta (identity) tensor:"], 
 TapTestSame[Boole[Array[SameQ, {3, 3, 3}]], 
  {{{1, 0, 0}, {0, 0, 0}, {0, 0, 0}}, {{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}, 
   {{0, 0, 0}, {0, 0, 0}, {0, 0, 1}}}], TapTestSameBROKEN[Position[%, 1], 
  {{1, 1, 1}, {2, 2, 2}, {3, 3, 3}}]]
