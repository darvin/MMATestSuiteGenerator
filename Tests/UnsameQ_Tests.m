(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Test whether two expressions are not identically the same:"], 
 ESameTest[x =!= y, True], ESameTest[x =!= x, False], 
 EComment["!= remains symbolic unless literal values are given:"], 
 ESameTest[x != y, x != y], EComment["Full form:"], ESameTest[x =!= y, True], 
 EComment["Test equivalence of strings:"], ESameTest["abc" =!= "ABC", True], 
 EComment["Numbers in different representations are not the same:"], 
 ESameTest[0. =!= 0, True], 
 EComment["!= nevertheless treats them as equal:"], 
 ESameTest[0. != 0, False], 
 EComment["Test whether multiple expressions are all distinct:"], 
 ESameTestBROKEN[(x =!= x) =!= y, False], ESameTest[(x =!= y) =!= z, True], 
 EComment[
  "Construct the permanent analog of the totally antisymmetric tensor:"], 
 ESameTest[Boole[Array[UnsameQ, {3, 3, 3}]], 
  {{{0, 0, 0}, {0, 0, 1}, {0, 1, 0}}, {{0, 0, 1}, {0, 0, 0}, {1, 0, 0}}, 
   {{0, 1, 0}, {1, 0, 0}, {0, 0, 0}}}], 
 EComment["1 appears at positions corresponding to permutations:"], 
 ESameTestBROKEN[Position[%, 1], {{1, 2, 3}, {1, 3, 2}, {2, 1, 3}, {2, 3, 1}, 
   {3, 1, 2}, {3, 2, 1}}]]
