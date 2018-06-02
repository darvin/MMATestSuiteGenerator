(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Pi can be entered as Esc\\[ThinSpace]p\\[ThinSpace]Esc:"], 
 TapTestSame[Pi, Pi], TapComment["Evaluate to any precision:"], 
 TapTestSame[N[Pi, 50], 
  3.1415926535897932384626433832795028841971693993751`49.49714987269414], 
 TapComment["Do an exact numerical computation:"], 
 TapTestSame[Round[Pi^100], 5187848314319613192086261524630301356268676068040\
6], TapComment["Find the millionth digit of \\[Pi] in base 10:"], 
 TapTestSame[First[RealDigits[Pi, 10, 1, -10^6]], {1}], 
 TapComment["Find an area of a circle:"], 
 TapTestSame[Integrate[Boole[x^2 + y^2 <= r^2], {x, -Infinity, Infinity}, 
   {y, -Infinity, Infinity}, Assumptions -> r > 0], Pi*r^2], 
 TapComment["The first 20 digits of \\[Pi] in base 10:"], 
 TapTestSame[RealDigits[Pi, 10, 20], 
  {{3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9, 3, 2, 3, 8, 4}, 1}], 
 TapTestSame[ContinuedFraction[Pi, 20], {3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 
   1, 14, 2, 1, 1, 2, 2, 2, 2}], 
 TapComment["Trigonometric functions have arguments in radians:"], 
 TapTestSame[Sin[Pi/4], 1/Sqrt[2]], 
 TapComment[
  "Many mathematical functions and operations give results involving \\[Pi]:"]\
, TapTestSame[Zeta[2], Pi^2/6], TapTestSame[Integrate[Exp[-x^2], 
   {x, -Infinity, Infinity}], Sqrt[Pi]], 
 TapComment["Various symbolic relations are automatically used:"], 
 TapTestSame[Pi > 3, True], TapTestSame[Element[Pi, Algebraics], False], 
 TapComment[
  "RefLink[Pi,paclet:ref/Pi] is treated as a constant in differentiation:"], 
 TapTestSame[Dt[Pi, x], 0], 
 TapComment["Walk corresponding to the binary digits of \\[Pi]:"], 
 TapTestSameBROKEN[HoldComplete[ListLinePlot[
    Accumulate[(-1)^First[RealDigits[Pi, 2, 200]]]]], $Failed], 
 TapComment["Terms in the continued fraction:"], 
 TapTestSameBROKEN[HoldComplete[ListLinePlot[ContinuedFraction[Pi, 400], 
    PlotRange -> All]], $Failed]]
