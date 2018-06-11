(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find a value x such that x^2=2:"], 
 TapTestSame[FixedPoint[(#1 + 2/#1)/2 & , 1.], 1.41421], 
 TapTestSame[Sqrt[2.], 1.41421], 
 TapComment["Fixed point of an integer-valued function:"], 
 TapTestSame[NestList[1 + Floor[#1/2] & , 1000, 20], 
  {1000, 501, 251, 126, 64, 33, 17, 9, 5, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
   2}], TapTestSame[FixedPoint[1 + Floor[#1/2] & , 1000], 2], 
 TapComment[
  "Repeated application of a rule until the result no longer changes:"], 
 TapTestSame[FixedPoint[#1 /. {a_, b_} /; b != 0 -> {b, Mod[a, b]} & , 
   {28, 21}], {7, 0}], TapTestSame[GCD[28, 21], 7], 
 TapComment["Numerical fixed point of a function:"], 
 TapTestSame[FixedPoint[Erf, 1.], 0.617447], 
 TapComment["Fixed point of a repeated transformation:"], 
 TapTestSame[FixedPoint[#1 /. {fact[0] -> 1, fact[n_] :> n*fact[n - 1]} & , 
   fact[17]], 355687428096000], TapComment["Stop after at most 10 steps:"], 
 TapTestSame[FixedPoint[1 + Floor[#1/2] & , 10^6, 10], 978], 
 TapTestSame[FixedPoint[1 + Floor[#1/2] & , 10^6], 2], 
 TapComment[
  "Stop as soon as successive iterations differ by less than 10^-10:"], 
 TapTestSameBROKEN[FixedPoint[(#1 + 2/#1)/2 & , 1.`20., 
   SameTest -> (Abs[#1 - #2] < 1/10000000000 & )], 
  1.4142135623730950488`19.15051499783199], 
 TapTestSame[FixedPoint[(#1 + 2/#1)/2 & , 1, 
   SameTest -> (Abs[#1 - #2] < 1/10000000000 & )], 
  886731088897/627013566048], 
 TapComment[
  "Perform exact arithmetic, but use a numerical comparison function:"], 
 TapTestSame[FixedPoint[(#1 + 2/#1)/2 & , 1, 
   SameTest -> (N[#1] == N[#2] & )], 1572584048032918633353217/
   1111984844349868137938112], 
 TapComment["Find Sqrt[2] using Newton's method:"], 
 TapTestSame[FixedPoint[(#1 + 2/#1)/2 & , 1.], 1.41421], 
 TapComment["Fixed point of a complex iteration:"], 
 TapTestSame[FixedPoint[Log, 1. + I], 0.318132 + 1.33724*I], 
 TapComment["Matrix-multiplication convergence:"], 
 TapTestSameBROKEN[MatrixForm[FixedPoint[
    {{0.51, 0.49}, {0.49, 0.51}} . #1 & , {{1, 0}, {0, 1}}]], 
  0.5*0.5*0.5*0.5], TapComment["Root of the current directory tree (the \
result will depend on computer system):"], 
 TapTestSameBROKEN[HoldComplete[FixedPoint[ParentDirectory, Directory[]]], 
  $Failed], TapComment["Repeated differentiation:"], 
 TapTestSame[FixedPoint[D[#1, x] & , x^10], 0], 
 TapComment["Find the minimum of (x-1)^2+y^2 with the steepest-descent method \
(vector notation):"], TapTestSame[With[{\[Epsilon] = 0.1}, 
   FixedPoint[Function[xy, {2*\[Epsilon], 0} + 
      {{1 - 2*\[Epsilon], 0}, {0, 1 - 2*\[Epsilon]}} . xy], {1., 1.}]], 
  {1., 0.}], TapComment["Component notation:"], 
 TapTestSameBROKEN[With[{\[Epsilon] = 0.1}, 
   FixedPoint[Function[{x, y}, {x + 2*\[Epsilon] - 2*x*\[Epsilon], 
        y - 2*y*\[Epsilon]}] @@ #1 & , {1., 1.}]], {1., 3./10^323}], 
 TapComment["Evaluate combinators [WebLink[more \
info,http://www.wolframscience.com/nksonline/page-1122]]:"], 
 TapTestSame[FixedPoint[#1 /. {s[x_][y_][z_] -> x[z][y[z]], 
      k[x_][y_] -> x} & , s[s[s[s][s]]][s][s][k]], 
  s[k[s[s[s]][k]]][s[k[k[s[s[s]][k]]]][s[s[s]][k]]]], 
 TapComment["Connected components in a graph:"], 
 TapTestSame[ConnectedNodes[list_, i_] := 
    FixedPoint[Union[Flatten[{#1, list[[#1]]}]] & , {i}]; 
   ConnectedNodes[{{3, 2}, {4, 3}, {5, 4}, {1, 5}, {2, 1}}, 1], 
  {1, 2, 3, 4, 5}], TapComment["RefLink[FixedPoint,paclet:ref/FixedPoint] \
gives the last element of RefLink[FixedPointList,paclet:ref/FixedPointList]:"]\
, TapTestSame[FixedPointList[Function[x, (x + 2/x)/2], 1.], 
  {1., 1.5, 1.41667, 1.41422, 1.41421, 1.41421, 1.41421}], 
 TapTestSame[FixedPoint[Function[x, (x + 2/x)/2], 1.], 1.41421], 
 TapComment["Apply rules repeatedly until the result no longer changes using \
RefLink[ReplaceRepeated,paclet:ref/ReplaceRepeated] (//.):"], 
 TapTestSame[FixedPoint[#1 /. {a -> b, b -> c, c -> d} & , a^2 + c^3], 
  d^2 + d^3], TapTestSame[a^2 + c^3 /. {a -> b, b -> c, c -> d}, b^2 + d^3], 
 TapTestSame[a^2 + c^3 //. {a -> b, b -> c, c -> d}, d^2 + d^3], 
 TapComment["RefLink[FixedPoint,paclet:ref/FixedPoint] is equivalent to a \
particular choice of arguments of RefLink[NestWhile,paclet:ref/NestWhile]:"], 
 TapTestSame[NestWhile[Function[x, (x + 2/x)/2], 1., UnsameQ, 2], 1.41421], 
 TapComment["Calculations may not converge in a finite number of steps:"], 
 TapTestSame[TimeConstrained[FixedPoint[#1/3 + 1/4 & , Interval[{0, 1}]], 1], 
  $Aborted], TapComment[
  "Providing a maximum number of iterations will guarantee termination:"], 
 TapTestSame[FixedPoint[#1/3 + 1/4 & , Interval[{0, 1}], 50], 
  Interval[{89737248461481573596281/239299329230617529590083, 
    269211745384444720788844/717897987691852588770249}]], 
 TapComment[
  "Using a numerical test for convergence works in this case as well:"], 
 TapTestSame[FixedPoint[#1/3 + 1/4 & , Interval[{0, 1}], 
   SameTest -> (N[#1] === N[#2] & )], 
  Interval[{2084647712458321/5559060566555523, 6253943137374964/
     16677181699666569}]], TapComment["Sometimes convergence may fail on \
certain platforms due to insufficient accuracy of a machine arithmetic \
library function. This can be addressed by using a comparison function with a \
larger tolerance:"], TapTestSame[FixedPoint[Cos, 0.5, SameTest -> Equal], 
  0.739085]]
