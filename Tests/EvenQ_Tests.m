(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether 8 is even:"], TapTestSame[EvenQ[8], True], 
 TapComment["RefLink[EvenQ,paclet:ref/EvenQ] gives \
RefLink[False,paclet:ref/False] for non-numeric expressions:"], 
 TapTestSame[EvenQ[x], False], 
 TapComment["Test whether an array consists of even integers:"], 
 TapTestSame[ArrayQ[{{2, 4}, {6, 10}}, _, EvenQ], True], 
 TapTestSame[ArrayQ[{{1, 4}, {6, 10}}, _, EvenQ], False], 
 TapComment["An integer is either odd or even. Use \
RefLink[OddQ,paclet:ref/OddQ] to check that an integer is odd:"], 
 TapTestSame[EvenQ[3], False], TapTestSame[OddQ[3], True], 
 TapComment["Even integers are divisible by 2:"], 
 TapTestSame[EvenQ[12], True], TapTestSame[Divisible[12, 2], True], 
 TapComment[
  "The generating function of the even integers is (2 x)/(x-1)^2:"], 
 TapTestSame[Series[2*(x/(x - 1)^2), {x, 0, 10}], 
  2*x + 4*x^2 + 6*x^3 + 8*x^4 + 10*x^5 + 12*x^6 + 14*x^7 + 16*x^8 + 18*x^9 + 
   20*x^10 + O[x]^11], TapTestSame[EvenQ[x], False], 
 TapComment["It is necessary to use symbolic simplification first:"], 
 TapTestSameBROKEN[FullSimplify[x], 2]]
