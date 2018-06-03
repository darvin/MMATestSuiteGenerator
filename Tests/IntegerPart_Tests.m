(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the integer part of a real number:"], 
 TapTestSame[IntegerPart[2.4], 2], TapTestSameBROKEN[
  HoldComplete[Plot[IntegerPart[x], {x, -3, 3}, Filling -> Axis]], $Failed], 
 TapComment["Use exact numeric quantities:"], 
 TapTestSame[IntegerPart[Pi^100], 
  51878483143196131920862615246303013562686760680405], 
 TapComment["RefLink[IntegerPart,paclet:ref/IntegerPart] threads element-wise \
over lists:"], TapTestSame[IntegerPart[{2.4, 2.5, 3.}], {2, 2, 3}], 
 TapComment[
  "Manipulate RefLink[IntegerPart,paclet:ref/IntegerPart] symbolically:"], 
 TapTestSame[FullSimplify[IntegerPart[x] + IntegerPart[x + 1/2], 
   1/3 < x < 1/2], 0], TapTestSame[
  Reduce[IntegerPart[x] + IntegerPart[2*x - 1] == 2 && 0 < x < 4, x, Reals], 
  Inequality[1, LessEqual, x, Less, 3/2]], 
 TapComment["Evaluate an integral:"], 
 TapTestSame[Integrate[IntegerPart[x^3], {x, 0, 2}], 
  13 - 2^(1/3) - 2^(2/3) - 3^(1/3) - 5^(1/3) - 6^(1/3) - 7^(1/3)], 
 TapComment["Use with negative arguments:"], 
 TapTestSame[IntegerPart[{-2.4, -2.5, -3.}], {-2, -2, -3}], 
 TapComment["Use with complex-number arguments:"], 
 TapTestSame[IntegerPart[3 + (11/5)*I], 3 + 2*I], 
 TapComment["RefLink[IntegerPart,paclet:ref/IntegerPart] can deal with \
real-valued intervals:"], TapTestSame[IntegerPart[Interval[{-1, 3/2}]], 
  Interval[{-1, 1}]], TapComment[
  "Infinite arguments give symbolic results:"], 
 TapTestSame[IntegerPart[Infinity], Infinity], 
 TapComment["Series expansion:"], TapTestSameBROKEN[
  Series[IntegerPart[x^2], {x, 1, 2}, Assumptions -> Element[x, Reals]], 
  Piecewise[0]*x < 1*1*True], TapTestSameBROKEN[
  HoldComplete[Plot[IntegerPart[x + x^2], {x, -3, 3}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Abs[IntegerPart[x + I*y]], 
    {x, -2.5, 2.5}, {y, -2.5, 2.5}, ExclusionsStyle -> 
     {None, Directive[Thick, White]}]], $Failed], 
 TapComment["Iso-curves become full-dimensional regions for piecewise \
constant functions:"], TapTestSameBROKEN[
  HoldComplete[RegionPlot[IntegerPart[x^2 + y^2] == 1, {x, -2, 2}, 
    {y, -2, 2}]], $Failed], TapComment["Fibonacci numbers:"], 
 TapTestSame[Table[IntegerPart[GoldenRatio^k/Sqrt[5]] + Mod[k, 2], {k, 15}], 
  {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610}], 
 TapTestSame[Table[Fibonacci[k], {k, 15}], {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 
   89, 144, 233, 377, 610}], TapTestSameBROKEN[f[10], 130/27], 
 TapComment[
  "Find the 1000000\\[Null]^th digit of the fraction 1/99^2 in base 10:"], 
 TapTestSame[With[{p = 1, q = 99^2, n = 10^6, base = 10}, 
   IntegerPart[base*(Mod[p*PowerMod[base, n - 1, q], q]/q)]], 9], 
 TapComment[
  "Compare with RefLink[RealDigits,paclet:ref/RealDigits] functionality:"], 
 TapTestSame[RealDigits[1/99^2, 10, 1, -10^6], {{9}, -999999}], 
 TapComment["Birthday of Leonard Euler:"], 
 TapTestSameBROKEN[dow[1707, 4, 15], Friday], 
 TapComment["Compare with RefLink[DateString,paclet:ref/DateString]:"], 
 TapTestSameBROKEN[DateString[{1707, 4, 15}, "DayName"], Friday], 
 TapTestSameBROKEN[HoldComplete[ListLinePlot[({#1, f[#1, 100]} & ) /@ 
     Union[Flatten[Table[i/j, {j, 50}, {i, 0, j}]]]]], $Failed], 
 TapComment["Simplify expressions containing \
RefLink[IntegerPart,paclet:ref/IntegerPart]:"], 
 TapTestSame[Simplify[IntegerPart[x + 1] - IntegerPart[x], x >= 0], 1], 
 TapTestSame[FullSimplify[IntegerPart[z - IntegerPart[z]] - 
    2*IntegerPart[Round[z]]], -2*Round[z]], 
 TapComment["Symbolically expand for complex arguments:"], 
 TapTestSame[ComplexExpand[IntegerPart[x + I*y]], 
  IntegerPart[x] + I*IntegerPart[y]], 
 TapComment["RefLink[IntegerPart,paclet:ref/IntegerPart] is idempotent:"], 
 TapTestSame[IntegerPart[IntegerPart[x]], IntegerPart[x]], 
 TapComment[
  "Use RefLink[PiecewiseExpand,paclet:ref/PiecewiseExpand] to canonicalize:"]\
, TapTestSameBROKEN[PiecewiseExpand[IntegerPart[x^2 + Sqrt[x]], 0 < x < 2], 
  Inequality[Piecewise[1]*1, LessEqual, Sqrt[x] + x^2, Less, 2*2*2, 
   LessEqual, Sqrt[x] + x^2, Less, 3*3*3, LessEqual, Sqrt[x] + x^2, Less, 
   4*4*4, LessEqual, Sqrt[x] + x^2, Less, 5*5*Sqrt[x] + x^2, GreaterEqual, 
   5*0*True]], TapTestSameBROKEN[PiecewiseExpand[
   IntegerPart[x + 1/3 + IntegerPart[1 - x/2]^3], 
   Element[x, Reals] && -2 < x < 3], 
  Inequality[Piecewise[1]*(2/3), LessEqual, x, Less, 5/3] || 
   Inequality[-(1/3), LessEqual, x, LessEqual, 0*2*(5/3), LessEqual, x, Less, 
    (8/3)*3*x, GreaterEqual, (8/3)*0*True]], TapComment["Reduce equations \
containing RefLink[IntegerPart,paclet:ref/IntegerPart]:"], 
 TapTestSameBROKEN[Reduce[IntegerPart[x + 1/2] == 2*IntegerPart[x] && 
    -1 < x < 1, x, Reals], -1 < x < 1/2], TapComment["Numerical decision \
procedures with default settings cannot simplify this expression:"], 
 TapTestSame[IntegerPart[Pi^2 + 2*Pi + 1 - (Pi + 1)^2], 
  IntegerPart[1 + 2*Pi + Pi^2 - (1 + Pi)^2]], 
 TapComment["Use RefLink[Simplify,paclet:ref/Simplify] to resolve:"], 
 TapTestSameBROKEN[Simplify[%], 0], TapComment["Machine-precision \
numericalization of RefLink[IntegerPart,paclet:ref/IntegerPart] can give \
wrong results:"], TapTestSame[IntegerPart[1 + (E + 1)^2 - E^2 - 2*E - 1 + 
    Exp[-Exp[E]^2]], IntegerPart[-2*E - E^2 + E^(-E^(2*E)) + (1 + E)^2]], 
 TapTestSameBROKEN[N[%], 0], 
 TapComment["Use arbitrary-precision evaluation instead:"], 
 TapTestSameBROKEN[N[%%, 20], 1], TapComment["Because the answer is exact, \
raising the internal precision does not remove the message:"], 
 TapTestSameBROKEN[Block[{$MaxExtraPrecision = 10000}, N[%%%, 100]], 1], 
 TapComment["Symbolic preprocessing of functions containing \
RefLink[IntegerPart,paclet:ref/IntegerPart] can be time consuming:"], 
 TapTestSameBROKEN[Timing[NIntegrate[IntegerPart[x + x^2], {x, 0, 5}]], 
  {0.547, 51.7354}], TapComment["As a discontinuous function, \
RefLink[IntegerPart,paclet:ref/IntegerPart] can cause numerical algorithms to \
converge slowly:"], TapTestSameBROKEN[
  Timing[NIntegrate[IntegerPart[x + x^2], {x, 0, 5}, 
    Method -> {Automatic, "SymbolicProcessing" -> 0}]], {0.047, 51.7293}], 
 TapComment["Generate the sequence up to 5:"], 
 TapTestSameBROKEN[s[5], {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5}], 
 TapComment["Group the same numbers:"], TapTestSameBROKEN[Split[%], 
  {{1}, {2, 2}, {3, 3, 3}, {4, 4, 4, 4}, {5, 5, 5, 5, 5}}]]
