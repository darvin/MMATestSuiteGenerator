(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether 2 is a member of a list:"], 
 TapTestSame[MemberQ[{1, 3, 4, 1, 2}, 2], True], 
 TapComment["RefLink[MemberQ,paclet:ref/MemberQ] works with patterns:"], 
 TapTestSame[MemberQ[{x^2, y^2, x^3}, x^_], True], 
 TapComment["Test down to level 2:"], 
 TapTestSame[MemberQ[{{1, 1, 3, 0}, {2, 1, 2, 2}}, 0, 2], True], 
 TapComment["RefLink[MemberQ,paclet:ref/MemberQ] normally only tests level \
1:"], TapTestSame[MemberQ[{{1, 1, 3, 0}, {2, 1, 2, 2}}, 0], False], 
 TapComment["Test whether 2^i is ever equal to 1 modulo 7:"], 
 TapTestSame[Table[Mod[2^i, 7], {i, 10}], {2, 4, 1, 2, 4, 1, 2, 4, 1, 2}], 
 TapTestSame[MemberQ[Table[Mod[2^i, 7], {i, 10}], 1], True], 
 TapComment["RefLink[MemberQ,paclet:ref/MemberQ] tests for structural \
matches, not numerical equality:"], TapTestSame[MemberQ[{1, 2, 1, 3}, 1.], 
  False], TapComment[
  "RefLink[MemberQ,paclet:ref/MemberQ] does not test for subsequences:"], 
 TapTestSame[MemberQ[a + b + c, a + c], False], 
 TapComment["RefLink[FreeQ,paclet:ref/FreeQ] does:"], 
 TapTestSame[FreeQ[a + b + c, a + c], False], 
 TapComment[
  "RefLink[MemberQ,paclet:ref/MemberQ] by default only operates at level 1:"]\
, TapTestSame[MemberQ[{{x^2, y^2}}, x^_], False], 
 TapComment["Include level 2:"], TapTestSame[MemberQ[{{x^2, y^2}}, x^_, 2], 
  True]]
