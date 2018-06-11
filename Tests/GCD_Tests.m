(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[1]], 
 TapComment["Plot the RefLink[GCD,paclet:ref/GCD] for a number with 1000: "], 
 TapTestSame[HoldComplete[DiscretePlot[GCD[1000, n], {n, 100}]], $Failed], 
 TapTestSame[GCD[2, {3, 5, 8}], {1, 1, 2}], TapTestSame[GCD[1/3, 2/5, 3/7], 
  1/105], TapTestSame[{1/3, 2/5, 3/7}/%, {35, 42, 45}], 
 TapTestSame[GCD[-10 + 8*I, 5 - 4*I], 4 + 5*I], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[HoldComplete[gcd(x, y)], $Failed], 
 TapTestSame[HoldComplete[ArrayPlot[Table[GCD[m, n], {m, 60}, {n, 60}]]], 
  $Failed], TapComment["Find the fraction of pairs of the first 100 numbers \
that are relatively prime:"], TapTestSame[
  N[Total[Boole[Table[GCD[m, n] == 1, {m, 100}, {n, 100}]], 2]/10^4], 
  0.6087], TapComment["The result is close to 1/\\[Zeta](2):"], 
 TapTestSame[N[1/Zeta[2]], 0.607927], 
 TapComment[
  "Plot the means of the GCDs for successive \"balls\" of numbers:"], 
 TapTestSame[HoldComplete[ListLinePlot[
    Table[Mean[Flatten[Table[GCD[i, j], {i, n}, {j, i - 1}]]], 
     {n, 2, 100}]]], $Failed], TapTestSame[Reduce[6*x == 11, x, 
   Modulus -> 3], False], TapTestSame[Mod[GCD[6, 3], 3] == 0, True], 
 TapTestSame[HoldComplete[ArrayPlot[
    Mod[Table[GCD[Fibonacci[j], Fibonacci[k]], {j, 100}, {k, 100}], 
     Fibonacci[11]]]], $Failed], TapComment["The determinant of the matrix of \
pairwise GCDs is related to Euler's totient function:"], 
 TapTestSame[Table[Det[Outer[GCD, Range[n], Range[n]]], {n, 1, 12}], 
  {1, 1, 2, 4, 16, 32, 192, 768, 4608, 18432, 184320, 737280}], 
 TapTestSame[Table[Product[EulerPhi[m], {m, 1, n}], {n, 1, 12}], 
  {1, 1, 2, 4, 16, 32, 192, 768, 4608, 18432, 184320, 737280}], 
 TapComment["RefLink[GCD,paclet:ref/GCD] for prime power representation \
gcd(\\!\\(\n\\*SubsuperscriptBox[\\(p\\), \\(1\\), \nSubscriptBox[\\(n\\), \
\\(1\\)]]\\ \n\\*SubsuperscriptBox[\\(p\\), \\(2\\), \nSubscriptBox[\\(n\\), \
\\(2\\)]] \\[CenterEllipsis]\\),\\!\\(\n\\*SubsuperscriptBox[\\(p\\), \
\\(1\\), \nSubscriptBox[\\(m\\), \\(1\\)]]\\ \n\\*SubsuperscriptBox[\\(p\\), \
\\(2\\), \nSubscriptBox[\\(m\\), \\(2\\)]] \
\\[CenterEllipsis]\\))=\\!\\(\n\\*SubsuperscriptBox[\\(p\\), \\(1\\), \
\\(min(\n\\*SubscriptBox[\\(n\\), \\(1\\)], \n\\*SubscriptBox[\\(m\\), \
\\(1\\)])\\)]\\ \n\\*SubsuperscriptBox[\\(p\\), \\(2\\), \
\\(min(\n\\*SubscriptBox[\\(n\\), \\(2\\)], \n\\*SubscriptBox[\\(m\\), \
\\(2\\)])\\)] \\[CenterEllipsis]\\):"], TapTestSameBROKEN[$Failed, 
  HoldComplete[True]], TapComment["RefLink[GCD,paclet:ref/GCD] is associative \
gcd(a,gcd(b,c))==gcd(gcd(a,b),c):"], TapTestSameBROKEN[
  {a, b, c} = RandomInteger[10^10, 3] ;; GCD[a, GCD[b, c]] == 
    GCD[GCD[a, b], c], True], TapComment["Commutative gcd(a,b)==gcd(b,a): "], 
 TapTestSameBROKEN[{a, b} = RandomInteger[10^10, 2] ;; GCD[a, b] == 
    GCD[b, a], True], TapComment[
  "The one argument form is identity gcd(a)=a: "], 
 TapTestSameBROKEN[a = RandomInteger[10^10] ;; GCD[a] == a, True], 
 TapComment["The zero argument form is zero: "], TapTestSame[GCD[], 0], 
 TapComment[
  "Use RefLink[CoprimeQ,paclet:ref/CoprimeQ] to check for trivial GCDs: "], 
 TapTestSame[CoprimeQ[5, 6], True], TapTestSame[GCD[5, 6] == 1, True], 
 TapTestSame[With[{m = 6, n = 21}, 2*Sum[Floor[k*(n/m)], {k, 1, m - 1}] + m + 
    n - m*n], 3], TapTestSame[GCD[6, 21], 3], 
 TapTestSame[Sum[GCD[3, k], {k, 1000}], 1666], 
 TapTestSame[FullSimplify[GCD[GCD[m, n], p] - GCD[m, GCD[n, p]], 
   Element[{m, n, p}, Integers]], 0], 
 TapTestSame[FullSimplify[LCM[a, b]*GCD[a, b], Element[{a, b}, Integers] && 
    a > 0 && b > 0], a*b], TapTestSameBROKEN[
  Reduce[GCD[a, 3] < GCD[a/2, 6] && -10 < a < 10, a, Integers], 
  a == -8 || a == -4 || a == 0 || a == 4 || a == 8], 
 TapTestSameBROKEN[Timing[GCD @@ RandomInteger[{10^100000, 10^100001}, 
     {1000}]], {0.532, 1}], TapComment["Signs are discarded:"], 
 TapTestSame[GCD[-3, 9], 3], TapTestSame[GCD[2., 3], GCD[2., 3]], 
 TapTestSame[GCD[b, a], GCD[a, b]], TapTestSameBROKEN[
  HoldComplete[ArrayPlot[Arg[Fourier[Table[GCD[m, n], {m, 100}, 
       {n, 100}]]]]], $Failed], TapTestSameBROKEN[
  HoldComplete[ListPlot[({#1, GCD[1, #1]} & ) /@ 
     Union[Flatten[Table[i/j, {j, 40}, {i, 2*j}]]]]], $Failed], 
 TapComment["A GCD property of Fibonacci numbers:"], 
 TapTestSame[{GCD[Fibonacci[100], Fibonacci[1000]], 
   Fibonacci[GCD[100, 1000]]}, {354224848179261915075, 
   354224848179261915075}]]
