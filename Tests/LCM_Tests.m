(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[30]], 
 TapComment["Plot the RefLink[LCM,paclet:ref/LCM] for a number with 1000: "], 
 TapTestSame[HoldComplete[DiscretePlot[LCM[1000, n], {n, 100}]], $Failed], 
 TapTestSame[LCM[2, {3, 5, 7}], {6, 10, 14}], TapTestSame[LCM[1/3, 2/5, 3/7], 
  6], TapTestSame[%/{1/3, 2/5, 3/7}, {18, 15, 14}], 
 TapTestSame[LCM[3 - 4*I, 5 - 6*I], 9 + 38*I], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[HoldComplete[lcm(m, n)], $Failed], 
 TapComment["The LCM of the first 100 integers:"], 
 TapTestSame[LCM @@ Range[100], 69720375229712477164533808935312303556800], 
 TapTestSame[HoldComplete[ArrayPlot[Table[LCM[m, n], {m, 60}, {n, 60}]]], 
  $Failed], TapTestSame[Table[Max[Apply[LCM, IntegerPartitions[n], {1}]], 
   {n, 20}], {1, 2, 3, 4, 6, 6, 12, 15, 20, 30, 30, 60, 60, 84, 105, 140, 
   210, 210, 420, 420}], TapTestSame[FoldList[LCM, 1, Range[2, 10]], 
  {1, 2, 6, 12, 60, 60, 420, 840, 2520, 2520}], 
 TapTestSame[HoldComplete[ListPlot[Log[FoldList[LCM, 1, Range[2, 100]]]]], 
  $Failed], TapTestSame[HoldComplete[
   ArrayPlot[Mod[Table[LCM[Fibonacci[j], Fibonacci[k]], {j, 100}, {k, 100}], 
     Fibonacci[11]]]], $Failed], 
 TapTestSame[Table[LCM @@ Binomial[n, Range[0, n]], {n, 0, 12}], 
  {1, 1, 2, 3, 12, 10, 60, 105, 280, 252, 2520, 2310, 27720}], 
 TapTestSame[Table[(1/n)*LCM @@ Range[1, n], {n, 13}], 
  {1, 1, 2, 3, 12, 10, 60, 105, 280, 252, 2520, 2310, 27720}], 
 TapComment["RefLink[LCM,paclet:ref/LCM] for prime power representation \
gcd(\\!\\(\n\\*SubsuperscriptBox[\\(p\\), \\(1\\), \nSubscriptBox[\\(n\\), \
\\(1\\)]]\\ \n\\*SubsuperscriptBox[\\(p\\), \\(2\\), \nSubscriptBox[\\(n\\), \
\\(2\\)]] \\[CenterEllipsis]\\),\\!\\(\n\\*SubsuperscriptBox[\\(p\\), \
\\(1\\), \nSubscriptBox[\\(m\\), \\(1\\)]]\\ \n\\*SubsuperscriptBox[\\(p\\), \
\\(2\\), \nSubscriptBox[\\(m\\), \\(2\\)]] \
\\[CenterEllipsis]\\))=\\!\\(\n\\*SubsuperscriptBox[\\(p\\), \\(1\\), \
\\(max(\n\\*SubscriptBox[\\(n\\), \\(1\\)], \n\\*SubscriptBox[\\(m\\), \
\\(1\\)])\\)]\\ \n\\*SubsuperscriptBox[\\(p\\), \\(2\\), \
\\(max(\n\\*SubscriptBox[\\(n\\), \\(2\\)], \n\\*SubscriptBox[\\(m\\), \
\\(2\\)])\\)] \\[CenterEllipsis]\\):"], TapTestSameBROKEN[$Failed, 
  HoldComplete[True]], TapComment["RefLink[LCM,paclet:ref/LCM] is associative \
lcm(a,lcm(b,c))==lcm(lcm(a,b),c):"], TapTestSameBROKEN[
  {a, b, c} = RandomInteger[10^10, 3] ;; LCM[a, LCM[b, c]] == 
    LCM[LCM[a, b], c], True], TapComment["Commutative lcm(a,b)==lcm(b,a): "], 
 TapTestSameBROKEN[{a, b} = RandomInteger[10^10, 2] ;; LCM[a, b] == 
    LCM[b, a], True], TapComment[
  "The one argument form is identity lcm(a)=a: "], 
 TapTestSameBROKEN[a = RandomInteger[10^10] ;; LCM[a] == a, True], 
 TapTestSame[Sum[LCM[3, k], {k, 100}], 11784], 
 TapTestSame[FullSimplify[LCM[a, a*b], Element[{a, b}, Integers] && a > 0 && 
    b > 0], a*b], TapTestSame[FullSimplify[LCM[m, n]*GCD[m, n], 
   Element[{m, n}, Integers] && m > 0 && n > 0], m*n], 
 TapTestSameBROKEN[Reduce[LCM[a, 3] < 6 && -10 < a < 10, a, Integers], 
  a == -3 || a == -1 || a == 0 || a == 1 || a == 3], 
 TapComment["Signs are discarded:"], TapTestSame[LCM[-3, 7], 21], 
 TapTestSame[LCM[2., 3], LCM[2., 3]], TapTestSameBROKEN[
  HoldComplete[ArrayPlot[Arg[Fourier[Table[LCM[m, n], {m, 100}, 
       {n, 100}]]]]], $Failed], 
 TapTestSame[HoldComplete[ListPlot[({#1, LCM[1, #1]} & ) /@ 
     Union[Flatten[Table[i/j, {j, 40}, {i, 2*j}]]]]], $Failed]]
