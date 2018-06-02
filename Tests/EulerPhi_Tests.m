(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Table of values:"], 
 TapTestSame[Table[EulerPhi[k], {k, 0, 20}], {0, 1, 1, 2, 2, 4, 2, 6, 4, 6, 
   4, 10, 4, 12, 6, 8, 8, 16, 6, 18, 8}], TapComment["Plot the sequence: "], 
 TapTestSameBROKEN[HoldComplete[DiscretePlot[EulerPhi[k], {k, 100}]], 
  $Failed], TapComment["Evaluate for large arguments:"], 
 TapTestSame[EulerPhi[50!], 
  4218559200885839042679312107816703841788854953574400000000000000], 
 TapTestSame[EulerPhi[{2, 4, 6}], {1, 2, 2}], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[FormBox[TemplateBox[{n}, EulerPhi], TraditionalForm], 
  \[Phi]*n], TapTestSame[Table[EulerPhi[-k], {k, 12}], 
  {1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4}], 
 TapComment["A surprising result for powers of 10:"], 
 TapTestSame[$Failed, HoldComplete[{1, 4, 40, 400, 4000, 40000, 400000, 
    4000000, 40000000, 400000000, 4000000000}]], 
 TapTestSame[Table[Length[Select[Range[n]/n, Denominator[#1] == n & ]], 
   {n, 15}], {1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8}], 
 TapTestSame[Table[EulerPhi[n], {n, 15}], {1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 
   4, 12, 6, 8}], TapTestSameBROKEN[HoldComplete[
   ListPlot[Accumulate[Table[EulerPhi[n], {n, 50}]]]], $Failed], 
 TapComment["Compare with an asymptotic approximation:"], 
 TapTestSameBROKEN[HoldComplete[Show[%, Plot[(3/Pi^2)*n^2, {n, 0, 50}, 
     PlotStyle -> Red]]], $Failed], TapComment["First several n-s where the \
difference \\!\\(\n\\*UnderoverscriptBox[\\(\\[Sum]\\), \\(k = 1\\), \
\\(n\\)]\\*\nTemplateBox[{\"k\"},\n\"EulerPhi\"]\\)-3 n^2/\\[Pi]^2 is \
negative:"], TapTestSame[
  Flatten[Position[NonPositive[Accumulate[EulerPhi[Range[10^4]]] - 
      3*(Range[10^4]/Pi)^2], True]], {820, 1276, 1926, 2080, 2640, 3160, 
   3186, 3250, 4446, 4720, 4930, 5370, 6006, 6546, 7386, 7450, 7476, 9066, 
   9276}], TapTestSameBROKEN[
  N[Table[Sum[EulerPhi[k], {k, 1, n}] - 3*(n^2/Pi^2), {n, %}]], 
  {-9.09164, -40.1585, -7.49704, -31.9067, -6.36454, -16.4341, -39.2042, 
   -45.0067, -99.9782, -17.573, -103.709, -16.5217, -44.1517, -157.417, 
   -86.3779, -80.9853, -239.944, -124.389, -443.274}], 
 TapTestSame[$Failed, $Failed], 
 TapComment["Compare with the asymptotic limit:"], 
 TapTestSameBROKEN[N[1/Zeta[2]], 0.607927], TapTestSameBROKEN[c[6, 2], 14], 
 TapTestSame[Series[Total[(EulerPhi[#1]*(x^#1/(1 - x^#1)) & ) /@ 
     Divisors[10]], {x, 0, 20}], x + 2*x^2 + x^3 + 2*x^4 + 5*x^5 + 2*x^6 + 
   x^7 + 2*x^8 + x^9 + 10*x^10 + x^11 + 2*x^12 + x^13 + 2*x^14 + 5*x^15 + 
   2*x^16 + x^17 + 2*x^18 + x^19 + 10*x^20 + O[x]^21], 
 TapTestSame[Sum[GCD[k, 10]*x^k, {k, 1, 20}], x + 2*x^2 + x^3 + 2*x^4 + 
   5*x^5 + 2*x^6 + x^7 + 2*x^8 + x^9 + 10*x^10 + x^11 + 2*x^12 + x^13 + 
   2*x^14 + 5*x^15 + 2*x^16 + x^17 + 2*x^18 + x^19 + 10*x^20], 
 TapComment[
  "Count the number of primes using RefLink[EulerPhi,paclet:ref/EulerPhi]:"], 
 TapTestSame[$Failed, $Failed], TapTestSameBROKEN[
  Table[FleckPhi[0, n], {n, 12}], {1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4}], 
 TapComment["k=0 reproduces the Euler totient function:"], 
 TapTestSame[Table[EulerPhi[n], {n, 12}], {1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 
   4}], TapComment["Generalizations and closed forms:"], 
 TapTestSameBROKEN[Table[FleckPhi[-1, n] - n, {n, 12}], 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}], TapTestSameBROKEN[
  Table[FleckPhi[-2, n] - DivisorSigma[1, n], {n, 12}], 
  {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}], 
 TapTestSame[FullSimplify[EulerPhi[n] >= Sqrt[n], 
   Element[n, Integers] && n > 6], True], 
 TapTestSame[Table[EulerPhi[m]*EulerPhi[n] == 
    EulerPhi[m*n]*(EulerPhi[GCD[n, m]]/GCD[n, m]), {m, 4}, {n, 4}], 
  {{True, True, True, True}, {True, True, True, True}, 
   {True, True, True, True}, {True, True, True, True}}], 
 TapTestSameBROKEN[Table[\[Phi][n], {n, 12}], {0, 1, 2, 2, 4, 2, 6, 4, 6, 4, 
   10, 4}], TapTestSame[Table[EulerPhi[n], {n, 12}], 
  {1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4}], TapTestSameBROKEN[$Failed, 
  HoldComplete[Zeta[-1 + s]/Zeta[s]]], TapTestSame[EulerPhi[0], 0], 
 TapTestSameBROKEN[Table[\[Alpha][k], {k, 5}], 
  {1, 1/2, 1/3, 5/16, 24414/78125}], TapTestSameBROKEN[
  TableForm[Table[BaseForm[N[\[Alpha][6], 50], b], {b, 2, 24}]], 
  Subscript[0.010011111111111111110010100101000000011010110010101000011010100\
00101101111010100001111000010110011010110111110001001111110111001011011100100\
1011001101110011010111111`165.00048228153975, 2]*Subscript[0.0221022102202122\
21212122200110010200201020220222102101111111202200100222111100102000121221210\
0010102022`103.34443570528902, 3]*Subscript[0.1033333333022110001223022201222\
0112331100330023031123320213323211232102303130311332`82.0142404389838, 4]*
   Subscript[0.1240124`71.0934651124391, 5]*
   Subscript[
    0.1512555435343240023554104123334025302351115125255054430055551531`63.179\
711300562516, 6]*Subscript[
    0.21212113462216565666136311603501034041516350565010624434105`58.32658394\
146571, 7]*Subscript[
    0.2377776245003262503241336503605465574237562671131563277`54.376170983952\
78, 8]*Subscript[
    0.2727267877786131206368283714446803284403605577011226`51.43572779732216, 
    9]*0.3124992`49.4948489098848*
   Subscript[0.348*a3343909667a4500333a15a785089a432393664974365, 11]*
   Subscript[0.38*bbb97402137843b797a9b12b6506a312488076505963, 12]*
   Subscript[0.4*a739c496032a339cb89b8c06172c7139072512b20c4, 13]*
   Subscript[0.4536*d7d9523c157a7086a7431b6672d20ac80a42077c, 14]*
   Subscript[0.4*a4a41300000000000000000000000000000000000, 15]*
   Subscript[0.4*ffff29406b2a1a85bd43c2cd6f89fb96e4b3735f, 16]*
   Subscript[0.555543*c0348gd7df576b1105767e9255fbaf957, 17]*
   Subscript[0.5*b48g8e40a3gf860adgg81ehb0eb53c4c344ha51, 18]*
   Subscript[0.5*hf83i368ef6129b73b2bhdb1da83037376h1cb, 19]*
   Subscript[0.64*jjh8g0000000000000000000000000000000, 20]*
   Subscript[0.6*bh136440b0d45cf10kcbdj7efe0d2a5bk0kdg, 21]*
   Subscript[0.6*j5ahj6b6dgj3bg7jab7e2dedi1j53il02a89, 22]*
   Subscript[0.74742*k7c17jg074911f4bjjha096bk24ibb2, 23]*
   Subscript[0.7*bnnhf2jhn5b3h32i1en85c5h9e2gifj1dcc, 24]], 
 TapTestSameBROKEN[HoldComplete[With[{a = 1.535, b = -0.5, m = 3}, 
    ArrayPlot[Mod[FixedPointList[EulerPhi[Floor[a*#1 + b]] & , Range[200], 
       120], m]]]], $Failed], 
 TapComment["The only 8 solutions of \\[Pi](x)==\\[Phi](x):"], 
 TapTestSame[Cases[Range[100], n_ /; PrimePi[n] == EulerPhi[n]], 
  {2, 3, 4, 8, 10, 14, 20, 90}], TapTestSameBROKEN[
  HoldComplete[DiscretePlot[{PrimePi[n], EulerPhi[n]}, {n, 1, 22}, 
    Epilog -> {Red, PointSize[0.03], Point[({#1, EulerPhi[#1]} & ) /@ %]}]], 
  $Failed]]
