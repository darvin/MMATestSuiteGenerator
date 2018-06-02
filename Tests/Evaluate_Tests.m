(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Evaluate inside a RefLink[Hold,paclet:ref/Hold]:"], 
 TapTestSame[Hold[Evaluate[1 + 1], 2 + 2], Hold[2, 2 + 2]], 
 TapComment["RefLink[Evaluate,paclet:ref/Evaluate] works for arguments of any \
symbol with attributes RefLink[HoldAll,paclet:ref/HoldAll], \
RefLink[HoldFirst,paclet:ref/HoldFirst], or \
RefLink[HoldRest,paclet:ref/HoldRest]:"], TapTestSame[Attributes[Attributes], 
  {HoldAll, Listable, Protected}], TapTestSameBROKEN[
  {Attributes[x], Attributes[Evaluate[x]]}, 
  {{}, {Flat, Listable, NumericFunction, OneIdentity, Orderless, 
    Protected}}], TapComment[
  "Unprotect a system symbol to make a definition for it:"], 
 TapTestSameBROKEN[protected = Unprotect[Sqrt], {Sqrt}], 
 TapComment["Restore protection:"], TapTestSameBROKEN[
  Protect[Evaluate[protected]], {Sqrt}], 
 TapComment["Force evaluation of the right-hand side of a delayed \
definition:"], TapTestSame[Expand[(1 + x)^3], 1 + 3*x + 3*x^2 + x^3], 
 TapTestSameBROKEN[f[x_] := 1 + 3*x + 3*x^2 + x^3, 
  f[x_] := 1 + 3*x + 3*x^2 + x^3], 
 TapComment["Build a function from an expression:"], 
 TapTestSame[ch = ChebyshevT[5, x], 5*x - 20*x^3 + 16*x^5], 
 TapTestSameBROKEN[Function[x, Evaluate[ch]], 
  Function[x, 5*x - 20*x^3 + 16*x^5]], TapTestSameBROKEN[%[10], 1580050], 
 TapComment["RefLink[Evaluate,paclet:ref/Evaluate] does not work inside \
functions with attribute \
RefLink[HoldAllComplete,paclet:ref/HoldAllComplete]:"], 
 TapTestSame[HoldComplete[Evaluate[1 + 2]], HoldComplete[Evaluate[1 + 2]]], 
 TapComment["Use RefLink[Unevaluated,paclet:ref/Unevaluated] to temporarily \
treat a function as if it were RefLink[HoldAll,paclet:ref/HoldAll]:"], 
 TapTestSame[Length[Unevaluated[1 + 2 + 3]], 3], 
 TapTestSame[Length[1 + 2 + 3], 0], TapComment["RefLink[Evaluate,paclet:ref/E\
valuate] does not work inside RefLink[Unevaluated,paclet:ref/Unevaluated]:"], 
 TapTestSame[Unevaluated[Evaluate[1 + 1]], Unevaluated[Evaluate[1 + 1]]], 
 TapComment["RefLink[Evaluate,paclet:ref/Evaluate] works only on the first \
level, directly inside a held function:"], 
 TapTestSame[Hold[f[Evaluate[1 + 2]]], Hold[f[Evaluate[1 + 2]]]]]
