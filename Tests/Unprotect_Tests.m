(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Default behavior: "], 
 ESameTest[Sqrt[x^2], Sqrt[x^2]], EComment["New behavior: "], 
 ESameTestBROKEN[Sqrt[x^2], x], 
 EComment["Unprotect all symbols in the current context:"], 
 ESameTest[Unprotect["`*"], {}], 
 EComment["Unprotect a system symbol to make a definition for it:"], 
 ESameTestBROKEN[protected = Unprotect[Sqrt], {Sqrt}], 
 EComment["Restore protection:"], ESameTestBROKEN[
  Protect[Evaluate[protected]], {Sqrt}], ESameTest[Attributes[{f, g}], 
  {{}, {}}], ESameTestBROKEN[Unprotect[f, g], {f}], 
 ESameTestBROKEN[f[x_] := x^3, $Failed], 
 ESameTestBROKEN[Unprotect[Evaluate[syms]], {f, g, h}], 
 ESameTest[Attributes[f], {}]]
