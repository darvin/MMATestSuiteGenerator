(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the sequence of values leading to a fixed point:"], 
 TapTestSame[FixedPointList[1 + Floor[#1/2] & , 1000], 
  {1000, 501, 251, 126, 64, 33, 17, 9, 5, 3, 2, 2}], 
 TapTestSameBROKEN[1 + Floor[Last[%]/2], 2], 
 TapComment[
  "Repeated application of a rule until the result no longer changes:"], 
 TapTestSame[FixedPointList[#1 /. {a_, b_} /; b != 0 -> {b, Mod[a, b]} & , 
   {28, 21}], {{28, 21}, {21, 7}, {7, 0}, {7, 0}}], 
 TapTestSame[GCD[28, 21], 7], TapComment["Stop after at most 5 steps:"], 
 TapTestSame[FixedPointList[1 + Floor[#1/2] & , 1000, 5], 
  {1000, 501, 251, 126, 64, 33}], 
 TapTestSame[FixedPointList[1 + Floor[#1/2] & , 1000], 
  {1000, 501, 251, 126, 64, 33, 17, 9, 5, 3, 2, 2}], 
 TapComment[
  "Stop as soon as successive iterations differ by less than 10^-10:"], 
 TapTestSameBROKEN[FixedPointList[(#1 + 2/#1)/2 & , 1.`20., 
   SameTest -> (Abs[#1 - #2] < 1/10000000000 & )], 
  {1.`19., 1.5`19.17609125905568, 1.4166666666666666667`19.15126767533065, 
   1.4142156862745098039`19.150515650065852, 
   1.4142135623746899106`19.15051499783248, 
   1.4142135623730950488`19.15051499783199}], 
 TapTestSameBROKEN[TableForm[FixedPointList[(#1 + 2/#1)/2 & , 1, 
    SameTest -> (Abs[#1 - #2] < 1/10000000000 & )]], 
  1*(3/2)*(17/12)*(577/408)*(665857/470832)*(886731088897/627013566048)], 
 TapComment["Show convergence to Sqrt[2] in Newton's method:"], 
 TapTestSame[FixedPointList[(#1 + 2/#1)/2 & , 1.], 
  {1., 1.5, 1.41667, 1.41422, 1.41421, 1.41421, 1.41421}], 
 TapComment["Number of steps needed to converge to a fixed point of \
RefLink[Cos,paclet:ref/Cos]:"], TapTestSame[Length[FixedPointList[Cos, 1.]] - 
   1, 92], TapComment["Matrix convergence:"], 
 TapTestSameBROKEN[HoldComplete[MatrixForm /@ 
    FixedPointList[{{0.51, 0.49}, {0.49, 0.51}} . #1 & , {{1, 0}, {0, 1}}]], 
  $Failed], TapComment["Evaluate combinators:"], 
 TapTestSame[FixedPointList[#1 /. {s[x_][y_][z_] -> x[z][y[z]], 
      k[x_][y_] -> x} & , s[s[s]][s][k][k]], 
  {s[s[s]][s][k][k], s[s][k][s[k]][k], s[s[k]][k[s[k]]][k], 
   s[k][k][k[s[k]][k]], k[k[s[k]][k]][k[k[s[k]][k]]], k[s[k]][k], s[k], 
   s[k]}], TapComment["Go up a directory tree to its root (the result will \
depend on computer system):"], TapTestSameBROKEN[
  HoldComplete[FixedPointList[ParentDirectory, $UserBaseDirectory]], 
  $Failed], TapComment["Repeated differentiation:"], 
 TapTestSame[FixedPointList[D[#1, x] & , x^10], 
  {x^10, 10*x^9, 90*x^8, 720*x^7, 5040*x^6, 30240*x^5, 151200*x^4, 
   604800*x^3, 1814400*x^2, 3628800*x, 3628800, 0, 0}], 
 TapComment["RefLink[FixedPoint,paclet:ref/FixedPoint] gives the last element \
of RefLink[FixedPointList,paclet:ref/FixedPointList]:"], 
 TapTestSame[FixedPointList[Function[x, (x + 2/x)/2], 1.], 
  {1., 1.5, 1.41667, 1.41422, 1.41421, 1.41421, 1.41421}], 
 TapTestSame[FixedPoint[Function[x, (x + 2/x)/2], 1.], 1.41421], 
 TapComment[
  "RefLink[NestList,paclet:ref/NestList] goes for a fixed number of steps:"], 
 TapTestSame[NestList[(#1 + 2/#1)/2 & , 1., 8], 
  {1., 1.5, 1.41667, 1.41422, 1.41421, 1.41421, 1.41421, 1.41421, 1.41421}], 
 TapTestSame[FixedPointList[(#1 + 2/#1)/2 & , 1.], 
  {1., 1.5, 1.41667, 1.41422, 1.41421, 1.41421, 1.41421}], 
 TapComment["Apply rules repeatedly until the result no longer changes:"], 
 TapTestSame[FixedPointList[#1 /. {a -> b, b -> c, c -> d} & , a^2 + c^3], 
  {a^2 + c^3, b^2 + d^3, c^2 + d^3, d^2 + d^3, d^2 + d^3}], 
 TapTestSame[a^2 + c^3 //. {a -> b, b -> c, c -> d}, d^2 + d^3], 
 TapComment["RefLink[FixedPointList,paclet:ref/FixedPointList] is equivalent \
to a particular choice of arguments of \
RefLink[NestWhileList,paclet:ref/NestWhileList]:"], 
 TapTestSame[NestWhileList[Function[x, (x + 2/x)/2], 1., UnsameQ, 2], 
  {1., 1.5, 1.41667, 1.41422, 1.41421, 1.41421, 1.41421}], 
 TapComment["When finding a fixed point, numerical precision may increase:"], 
 TapTestSameBROKEN[TableForm[FixedPointList[InverseErf, 0.5`10., 10]], 
  0.5*0.4769362762*0.451579534663*0.42435507490618*0.395808252592498*
   0.3665514512748453*0.33720411442247996`17.527892865063258*
   0.3083383633992037845`18.48902756292326*
   0.28043933170777735913`19.447838923509135*
   0.2538838699797014057785`21.404635109690837*
   0.228936264535361716431397`23.359714592325638], 
 TapComment["The depth of intermediate expressions in a combinator evaluation \
[WebLink[more info,http://www.wolframscience.com/nksonline/page-1122a-text \
]]:"], TapTestSame[Depth /@ FixedPointList[
    #1 /. {s[x_][y_][z_] -> x[z][y[z]], k[x_][y_] -> x} & , 
    s[s[s[s][s]]][s][s][k]], {2, 2, 2, 2, 2, 2, 3, 4, 5, 6, 3, 3, 4, 4, 5, 3, 
   4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
   5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
   5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 8, 
   8, 9, 9, 5, 6, 7, 4, 4}]]
