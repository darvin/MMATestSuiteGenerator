(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Default behavior: "], TapTestSame[Sqrt[x^2], Sqrt[x^2]], 
 TapComment["New behavior: "], TapTestSameBROKEN[Sqrt[x^2], x], 
 TapComment["Unprotect all symbols in the current context:"], 
 TapTestSame[Unprotect["`*"], {}], 
 TapComment["Unprotect a system symbol to make a definition for it:"], 
 TapTestSame[protected = Unprotect[Sqrt], {Sqrt}], 
 TapComment["Restore protection:"], TapTestSame[Protect[Evaluate[protected]], 
  {Sqrt}], TapComment["Unprotecting a symbol is equivalent to clearing the \
RefLink[Protected,paclet:ref/Protected] attribute:"], 
 TapTestSameBROKEN[Protect[f, g] ;; Unprotect[f]; 
   ClearAttributes[g, Protected] ;; Attributes[{f, g}], {{}, {}}], 
 TapComment["RefLink[Unprotect,paclet:ref/Unprotect] returns the list of \
symbols actually unprotected:"], TapTestSameBROKEN[
  Protect[f] ;; Unprotect[f, g], {f}], 
 TapComment["To modify definitions of a protected symbol, unprotect it \
first:"], TapTestSame[f[x_] := x^2; Protect[f] ;; f[x_] := x^3, $Failed], 
 TapComment["To unprotect all symbols given in a variable, use \
RefLink[Evaluate,paclet:ref/Evaluate]:"], 
 TapTestSameBROKEN[syms = {f, g, h}; Protect /@ syms ;; 
    Unprotect[Evaluate[syms]], {f, g, h}], TapTestSame[Attributes[f], {}]]
