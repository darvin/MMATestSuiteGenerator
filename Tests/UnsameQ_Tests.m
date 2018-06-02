(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Test whether two expressions are not identically the same:"], 
 TapTestSame[x =!= y, True], TapTestSame[x =!= x, False], 
 TapComment["!= remains symbolic unless literal values are given:"], 
 TapTestSame[x != y, x != y], TapComment["Full form:"], 
 TapTestSame[x =!= y, True], TapComment["Test equivalence of strings:"], 
 TapTestSame["abc" =!= "ABC", True], 
 TapComment["Numbers in different representations are not the same:"], 
 TapTestSame[0. =!= 0, True], 
 TapComment["!= nevertheless treats them as equal:"], 
 TapTestSame[0. != 0, False], 
 TapComment["Test whether multiple expressions are all distinct:"], 
 TapTestSameBROKEN[(x =!= x) =!= y, False], TapTestSame[(x =!= y) =!= z, 
  True], TapComment[
  "Construct the permanent analog of the totally antisymmetric tensor:"], 
 TapTestSame[Boole[Array[UnsameQ, {3, 3, 3}]], 
  {{{0, 0, 0}, {0, 0, 1}, {0, 1, 0}}, {{0, 0, 1}, {0, 0, 0}, {1, 0, 0}}, 
   {{0, 1, 0}, {1, 0, 0}, {0, 0, 0}}}], 
 TapComment["1 appears at positions corresponding to permutations:"], 
 TapTestSameBROKEN[Position[%, 1], {{1, 2, 3}, {1, 3, 2}, {2, 1, 3}, 
   {2, 3, 1}, {3, 1, 2}, {3, 2, 1}}]]
