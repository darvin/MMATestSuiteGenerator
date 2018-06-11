(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[f]], 
 TapTestSame[Head[a + b + c], Plus], TapTestSame[Head[{a, b, c}], List], 
 TapTestSame[Head[45], Integer], TapTestSame[Head[x], Symbol], 
 TapComment["Heads need not be symbols:"], TapTestSame[Head[f[x][y][z]], 
  f[x][y]], TapComment[
  "Find the cases with a head of RefLink[Integer,paclet:ref/Integer]:"], 
 TapTestSame[Cases[{2, 1, x, 3, y}, _Integer], {2, 1, 3}], 
 TapComment["The head is the part with index 0:"], 
 TapTestSame[(a + b + c)[[0]], Plus], 
 TapComment["The head is based on RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSame[Head[a/b], Times], TapTestSameBROKEN[FullForm[a/b], a/b], 
 TapComment[
  "RefLink[Head,paclet:ref/Head] always eventually burrows to a symbol:"], 
 TapTestSame[FixedPoint[Head, f[x][y][z]], Symbol], 
 TapTestSame[FixedPoint[Head, {3, 4, 5}], Symbol]]
