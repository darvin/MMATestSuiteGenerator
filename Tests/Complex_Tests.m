(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Enter a complex number:"], 
 TapTestSame[1 + 2*I, 1 + 2*I], TapComment["RefLink[Complex,paclet:ref/Comple\
x] is the RefLink[Head,paclet:ref/Head] for complex numbers:"], 
 TapTestSameBROKEN[Head[%], Complex], 
 TapComment["Enter a purely imaginary number:"], TapTestSame[4*I, 4*I], 
 TapComment["Even though there is no real part it has \
RefLink[Head,paclet:ref/Head] RefLink[Complex,paclet:ref/Complex]:"], 
 TapTestSameBROKEN[Head[%], Complex], TapComment["The \
RefLink[FullForm,paclet:ref/FullForm] of a complex number \
x+RefLink[I,paclet:ref/I]y is RefLink[Complex,paclet:ref/Complex][x,y]:"], 
 TapTestSameBROKEN[FullForm[1 + 2*I], Complex[1, 2]], 
 TapComment[
  "Enter a complex number using the RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSame[Complex[2, 1], 2 + I], TapComment["If the imaginary part is \
exactly zero, then the result is not RefLink[Complex,paclet:ref/Complex]:"], 
 TapTestSame[Complex[2, 0], 2], TapTestSameBROKEN[Head[%], Integer], 
 TapTestSameBROKEN[{Re[x], Im[x]}, {1, 2}], 
 TapComment["RefLink[Part,paclet:ref/Part] does not work:"], 
 TapTestSameBROKEN[x[[1]], (1 + 2*I)[[1]]], 
 TapComment[
  "Enter a complex number with machine-number real and imaginary parts:"], 
 TapTestSame[1. + 2.*I, 1. + 2.*I], TapComment["It is considered to be a \
machine number when both its real and imaginary parts are machine numbers:"], 
 TapTestSameBROKEN[MachineNumberQ[%], True], 
 TapComment[
  "Enter a complex number with arbitrary-precision real and imaginary parts:"]\
, TapTestSame[1.`20. + 2.`30.*I, 1.`19. + 2.`29.301029995663985*I], 
 TapComment["The precision is based on the error in the complex plane:"], 
 TapTestSameBROKEN[Precision[%], 20.3495], TapComment["Enter a complex number \
with an exact real part and an approximate imaginary part:"], 
 TapTestSame[x = 1 + 2.*I, 1. + 2.*I], 
 TapComment["_Complex can be used to stand for a complex number in a \
pattern:"], TapTestSame[MatchQ[1 + 2*I, _Complex], True], 
 TapTestSameBROKEN[f[1 + 2*I, 3 + 4*I, 5] /. rule, f[2 + I, 4 + 3*I, 5]], 
 TapComment["An alternate definition:"], 
 TapTestSame[f[1 + 2*I, 3 + 4*I, 5] /. Complex[r_, i_] :> Complex[i, r], 
  f[2 + I, 4 + 3*I, 5]], TapTestSameBROKEN[
  HoldComplete[Plot3D[Abs[cosine[x + I*y]], {x, -3, 3}, {y, -1, 1}]], 
  $Failed], TapComment["Complexes are numbers:"], 
 TapTestSame[1 + 2*I, 1 + 2*I], TapTestSameBROKEN[NumberQ[%], True], 
 TapComment["Complexes are atomic objects with no subexpressions:"], 
 TapTestSame[AtomQ[1 + 2*I], True], TapComment["Use \
RefLink[Complexes,paclet:ref/Complexes] to indicate assumptions on domain \
conditions: "], TapTestSameBROKEN[Reduce[z*Conjugate[z] < 1, z, Complexes], 
  -1 < Re[z] < 1 && -Sqrt[1 - Re[z]^2] < Im[z] < Sqrt[1 - Re[z]^2]], 
 TapTestSame[f[1 + 2*I], f[1 + 2*I]], TapTestSameBROKEN[f[Evaluate[1 + 2*I]], 
  -1], TapComment["The unevaluated form is expressed in terms of \
RefLink[Plus,paclet:ref/Plus] and RefLink[Times,paclet:ref/Times]:"], 
 TapTestSameBROKEN[FullForm[HoldForm[1 + 2*I]], HoldForm[1 + 2*I]]]
