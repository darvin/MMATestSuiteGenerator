(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether a number is prime:"], 
 TapTestSame[PrimeQ[13], True], TapTestSame[PrimeQ[10^100 + 1], False], 
 TapComment[
  "RefLink[PrimeQ,paclet:ref/PrimeQ] threads itself element-wise over lists:"]\
, TapTestSame[PrimeQ[{1, 2, 3, 4, 5, 6}], {False, True, True, False, True, 
   False}], TapComment["Test for primality over the Gaussian integers:"], 
 TapTestSame[PrimeQ[13, GaussianIntegers -> True], False], 
 TapTestSame[FactorInteger[13, GaussianIntegers -> True], 
  {{-I, 1}, {2 + 3*I, 1}, {3 + 2*I, 1}}], 
 TapComment["Only some numbers of the form 2^2^n+1 are prime:"], 
 TapTestSame[Table[PrimeQ[2^2^n + 1], {n, 10}], 
  {True, True, True, True, False, False, False, False, False, False}], 
 TapComment["Highlight numbers that are prime:"], 
 TapTestSameBROKEN[(If[PrimeQ[#1], Framed[#1], #1] & ) /@ Range[20], 
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}], 
 TapComment["The distribution of Gaussian primes:"], 
 TapTestSameBROKEN[HoldComplete[
   ArrayPlot[Boole[Table[PrimeQ[a + b*I], {a, 100}, {b, 100}]]]], $Failed], 
 TapTestSameBROKEN[HoldComplete[
   ArrayPlot[Boole[Table[PrimeQ[a^2 + b^2], {a, 100}, {b, 100}]]]], $Failed], 
 TapTestSameBROKEN[HoldComplete[
   ArrayPlot[Boole[Table[PrimeQ[a^b + 3], {a, 100}, {b, 100}]]]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Graphics3D[
    Cuboid /@ Position[Array[PrimeQ[#1 + #2^#3] & , {30, 30, 30}], True]]], 
  $Failed]]
