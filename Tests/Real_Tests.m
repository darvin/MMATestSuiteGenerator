(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Enter a real number:"], TapTestSame[1.23, 1.23], 
 TapComment["RefLink[Real,paclet:ref/Real] is the \
RefLink[Head,paclet:ref/Head] for real numbers:"], 
 TapTestSameBROKEN[Head[%], Real], TapComment["Real numbers entered with just \
a few digits are generally represented as machine reals:"], 
 TapTestSame[1.23456789, 1.23457], TapTestSameBROKEN[MachineNumberQ[%], 
  True], TapComment["Enter a real number with many significant digits:"], 
 TapTestSame[
  x = 9.87654321123456789987654321123456789`35.994604968173014*^17, 
  9.87654321123456789987654321123456789`35.994604968173014*10^17], 
 TapComment["Arbitrary-precision reals are used when too many digits are \
given for a machine number:"], TapTestSame[MachineNumberQ[x], False], 
 TapComment["Its RefLink[Accuracy,paclet:ref/Accuracy] is based on the number \
of digits to the right of the decimal point:"], 
 TapTestSameBROKEN[Accuracy[%%], 18.], TapComment["Enter a real number with a \
specified RefLink[Precision,paclet:ref/Precision]:"], 
 TapTestSameBROKEN[x = 1.`23., 1.`22.], TapTestSame[Precision[x], 23.], 
 TapComment["Enter a real number with a specified \
RefLink[Accuracy,paclet:ref/Accuracy]:"], TapTestSameBROKEN[x = 0``12., 
  0./10^12], TapTestSame[Accuracy[x], 12.], 
 TapComment["Enter a real number with an exponent:"], 
 TapTestSame[1.23*^45, 1.23*10^45], 
 TapComment["Enter a real number with an exponent and specified precision:"], 
 TapTestSameBROKEN[1.23`45.*^67, 1.23`44.0899051114394*10^67], 
 TapComment["Enter a real number in binary:"], 
 TapTestSame[21025.358366012573, 21025.4], 
 TapComment[
  "Enter a real number in binary with precision specified in terms of bits:"]\
, TapTestSameBROKEN[21025.3583660125732421875`30.102999566398122, 
  21025.3583660125732421875`29.32274340685071], 
 TapTestSameBROKEN[Precision[%], 30.103], TapTestSame[%*Log[2, 10], 100.], 
 TapComment["Enter a real number in hexadecimal:"], 
 TapTestSame[4011.744827270508, 4011.74], 
 TapComment["Enter a real number in base 35:"], 
 TapTestSameBROKEN[
  2.74967454112402596165414538191822888`35.43928129260896*^35, 
  2.7496745411240259616541453819182289`34.43928129260896*10^35], 
 TapTestSame[MachineNumberQ[%], False], 
 TapComment["Format a real number using base 2:"], 
 TapTestSameBROKEN[BaseForm[1.2345, 2], 
  Subscript[1.001111000000100001`18.000482233338396, 2]], 
 TapComment["_RefLink[Real,paclet:ref/Real] can be used to represent a real \
number in a pattern:"], TapTestSame[MatchQ[1.23, _Real], True], 
 TapComment["A rule that replaces real numbers with nearby rationals:"], 
 TapTestSame[1.4142135623730951*E^(3.141592653589793*t) /. 
   x_Real :> Rationalize[x, 0], (77227930*E^(245850922*(t/78256779)))/
   54608393], TapComment[
  "Determine if a matrix consists entirely of approximate reals:"], 
 TapTestSameBROKEN[m = {{1.`20., 2.}, {3, 4.5}} ;; 
    MatrixQ[m, MatchQ[#1, _Real] & ], False], 
 TapTestSameBROKEN[MatrixQ[N[m], MatchQ[#1, _Real] & ], True], 
 TapComment["Divide a restaurant bill to the nearest penny:"], 
 TapTestSameBROKEN[123.5/7 /. rule, 17.64], 
 TapComment["Define a function that only works for reals:"], 
 TapTestSame[f[x_Real] := Total[First[RealDigits[x]]]; {f[1.2], f[4]}, 
  {3, f[4]}], TapTestSameBROKEN[HoldComplete[Plot[f[x], {x, 0, 1}]], 
  $Failed], TapComment[
  "Define a function that has a special case for reals:"], 
 TapTestSameBROKEN[sqrt[x_Real] := 
   s /. FindRoot[s^2 - x, {s, 1.}, WorkingPrecision -> Precision[x]] ;; 
     sqrt[2.`47.], 
  1.4142135623730950488016887242096980785696718754000000000001`46.150514997832\
], TapComment[
  "For integers and rationals use the corresponding approximate real:"], 
 TapTestSameBROKEN[sqrt[x_Integer] := sqrt[N[x]]*sqrt[x_Rational] := 
     sqrt[N[x]]; sqrt[2], 1.41421], TapComment["Reals are numbers:"], 
 TapTestSame[NumberQ[12.34], True], 
 TapComment["RefLink[Real,paclet:ref/Real] is used for approximate reals:"], 
 TapTestSame[ExactNumberQ[12.34], False], 
 TapComment["Reals are atomic objects with no subexpressions:"], 
 TapTestSame[AtomQ[12.34], True], 
 TapComment["Use different formats for displaying a real number: "], 
 TapTestSame[r = -Pi^10., -93648.], TapTestSameBROKEN[
  Table[f[r], {f, {ScientificForm, EngineeringForm, AccountingForm}}], 
  {-9.3648*10^4, -93.648*10^3, 93648.}], 
 TapComment["Use RefLink[Reals,paclet:ref/Reals] in assumptions and to \
indicate domain conditions: "], TapTestSameBROKEN[
  Reduce[x*Log[x] < 1, x, Reals], 0 < x < E^ProductLog[1]], 
 TapComment["RefLink[Real,paclet:ref/Real] is only the head for approximate \
real numbers:"], TapTestSame[MatchQ[3/4, Real], False], 
 TapComment[
  "You can use the following function to test for numbers on the real axis:"]\
, TapTestSame[realAxisQ[x_] := NumberQ[x] &&  !MatchQ[x, _Complex]; 
   realAxisQ[3/4], True]]
