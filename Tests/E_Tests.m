(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[E,paclet:ref/E] can be entered as \
Esc\\[ThinSpace]ee\\[ThinSpace]Esc (for \"exponential e\"):"], 
 TapTestSame[E, E], TapComment["Evaluate to any precision:"], 
 TapTestSameBROKEN[N[E, 50], 
  2.7182818284590452353602874713526624977572470937`49.43429448190326], 
 TapComment["Do an exact numerical computation:"], 
 TapTestSame[Round[E^100], 26881171418161354484126255515800135873611119], 
 TapComment["The first 20 digits of E in base 10:"], 
 TapTestSame[RealDigits[E, 10, 20], {{2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4, 5, 9, 
    0, 4, 5, 2, 3, 5, 3}, 1}], 
 TapComment["E has a very regular continued fraction:"], 
 TapTestSame[ContinuedFraction[E, 20], {2, 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 
   1, 1, 10, 1, 1, 12, 1, 1}], 
 TapComment["Evaluate symbolic relations involving E:"], 
 TapTestSame[E^Pi > Pi^E, True], 
 TapComment[
  "Mathematical functions and operations often give results involving E:"], 
 TapTestSame[Limit[(1 + z)^(1/z), z -> 0], E], 
 TapComment["Solve the Steiner problem:"], 
 TapTestSame[Maximize[{x^(1/x), x > 0}, x], {E^(1/E), {x -> E}}], 
 TapComment[
  "RefLink[Exp,paclet:ref/Exp][z] is automatically converted to E^z:"], 
 TapTestSame[Exp[z], E^z], TapComment["E is not an algebraic number:"], 
 TapTestSame[Element[E, Algebraics], False], 
 TapComment["Use RefLink[TrigToExp,paclet:ref/TrigToExp] to obtain \
RefLink[E,paclet:ref/E] from hyperbolic and trigonometric functions: "], 
 TapTestSame[TrigToExp[Sinh[1]], -(1/(2*E)) + E/2], 
 TapComment["Find twenty base-10 digits after the millionth one:"], 
 TapTestSame[RealDigits[E, 10, 20, -1000000], 
  {{8, 8, 3, 7, 4, 7, 1, 1, 5, 1, 5, 6, 2, 3, 9, 6, 8, 2, 7, 1}, -999999}], 
 TapComment["E arises in many limiting results:"], 
 TapTestSame[Limit[z^z/(z - 1)^(z - 1) - (z - 1)^(z - 1)/(z - 2)^(z - 2), 
   z -> Infinity], E], TapTestSame[Sum[1/k!, {k, 0, Infinity}], E], 
 TapTestSame[FullSimplify[Sum[(2*k + 1)/(2*k)!, {k, 0, Infinity}]], E], 
 TapComment["Weyl-type sum involving RefLink[E,paclet:ref/E]:"], 
 TapTestSameBROKEN[HoldComplete[ListLinePlot[({Re[#1], Im[#1]} & ) /@ 
     Accumulate[Exp[I*10.^3*E*Sqrt[Range[2000]]]]]], $Failed]]
