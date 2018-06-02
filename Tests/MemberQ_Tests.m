(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test whether 2 is a member of a list:"], 
 ESameTest[MemberQ[{1, 3, 4, 1, 2}, 2], True], 
 EComment["RefLink[MemberQ,paclet:ref/MemberQ] works with patterns:"], 
 ESameTest[MemberQ[{x^2, y^2, x^3}, x^_], True], 
 EComment["Test down to level 2:"], 
 ESameTest[MemberQ[{{1, 1, 3, 0}, {2, 1, 2, 2}}, 0, 2], True], 
 EComment[
  "RefLink[MemberQ,paclet:ref/MemberQ] normally only tests level 1:"], 
 ESameTest[MemberQ[{{1, 1, 3, 0}, {2, 1, 2, 2}}, 0], False], 
 EComment["Test whether 2^i is ever equal to 1 modulo 7:"], 
 ESameTest[Table[Mod[2^i, 7], {i, 10}], {2, 4, 1, 2, 4, 1, 2, 4, 1, 2}], 
 ESameTest[MemberQ[Table[Mod[2^i, 7], {i, 10}], 1], True], 
 EComment["RefLink[MemberQ,paclet:ref/MemberQ] tests for structural matches, \
not numerical equality:"], ESameTest[MemberQ[{1, 2, 1, 3}, 1.], False], 
 EComment[
  "RefLink[MemberQ,paclet:ref/MemberQ] does not test for subsequences:"], 
 ESameTest[MemberQ[a + b + c, a + c], False], 
 EComment["RefLink[FreeQ,paclet:ref/FreeQ] does:"], 
 ESameTest[FreeQ[a + b + c, a + c], False], 
 EComment[
  "RefLink[MemberQ,paclet:ref/MemberQ] by default only operates at level 1:"]\
, ESameTest[MemberQ[{{x^2, y^2}}, x^_], False], EComment["Include level 2:"], 
 ESameTest[MemberQ[{{x^2, y^2}}, x^_, 2], True]]
