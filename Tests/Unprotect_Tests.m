(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Default behavior: "], TapTestSame[Sqrt[x^2], Sqrt[x^2]], 
 TapComment["New behavior: "], TapTestSameBROKEN[Sqrt[x^2], x], 
 TapComment["Unprotect all symbols in the current context:"], 
 TapTestSame[Unprotect["`*"], {}], 
 TapComment["Unprotect a system symbol to make a definition for it:"], 
 TapTestSameBROKEN[protected = Unprotect[Sqrt], {Sqrt}], 
 TapComment["Restore protection:"], TapTestSameBROKEN[
  Protect[Evaluate[protected]], {Sqrt}], TapTestSame[Attributes[{f, g}], 
  {{}, {}}], TapTestSameBROKEN[Unprotect[f, g], {f}], 
 TapTestSameBROKEN[f[x_] := x^3, $Failed], 
 TapTestSameBROKEN[Unprotect[Evaluate[syms]], {f, g, h}], 
 TapTestSame[Attributes[f], {}]]
