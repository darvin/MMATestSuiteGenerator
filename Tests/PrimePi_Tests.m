(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The number of primes up to a billion:"], 
 TapTestSame[PrimePi[10^9], 50847534], 
 TapComment[
  "RefLink[PrimePi,paclet:ref/PrimePi] increases every time there is a \
prime:"], TapTestSame[Table[PrimePi[n], {n, 20}], 
  {0, 1, 2, 2, 3, 3, 4, 4, 4, 4, 5, 5, 6, 6, 6, 6, 7, 7, 8, 8}], 
 TapComment["RefLink[PrimePi,paclet:ref/PrimePi] takes continuous arguments, \
but gives integer values:"], TapTestSame[PrimePi[10.1], 4], 
 TapTestSameBROKEN[HoldComplete[Plot[PrimePi[n], {n, 0, 20}]], $Failed], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[FormBox[TemplateBox[{n}, PrimePi], TraditionalForm], 
  Pi*n], TapTestSameBROKEN[HoldComplete[Plot[PrimePi[n], {n, 0, 100}]], 
  $Failed], TapComment[
  "Plot RefLink[PrimePi,paclet:ref/PrimePi] compared with estimates:"], 
 TapTestSameBROKEN[HoldComplete[Plot[{PrimePi[n], n/Log[n], LogIntegral[n], 
     RiemannR[n]}, {n, 1.5, 100}]], $Failed], 
 TapComment["Compute RefLink[PrimePi,paclet:ref/PrimePi] based on the \
Hardy\\[Dash]Wright formula:"], TapTestSame[Sum[Mod[(j - 2)!, j], 
   {j, 4, 1000}], 168], TapTestSame[PrimePi[1000], 168], 
 TapComment["For primes, RefLink[Prime,paclet:ref/Prime] is effectively the \
inverse of RefLink[PrimePi,paclet:ref/PrimePi]:"], 
 TapTestSame[PrimePi[997], 168], TapTestSameBROKEN[Prime[%], 997], 
 TapComment["Integrate \\[Pi](n):"], 
 TapTestSame[Integrate[PrimePi[n], {n, 0, 10}], 23]]
