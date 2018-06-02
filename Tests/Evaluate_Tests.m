(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Evaluate inside a RefLink[Hold,paclet:ref/Hold]:"], 
 ESameTest[Hold[Evaluate[1 + 1], 2 + 2], Hold[2, 2 + 2]], 
 EComment["RefLink[Evaluate,paclet:ref/Evaluate] works for arguments of any \
symbol with attributes RefLink[HoldAll,paclet:ref/HoldAll], \
RefLink[HoldFirst,paclet:ref/HoldFirst], or \
RefLink[HoldRest,paclet:ref/HoldRest]:"], ESameTest[Attributes[Attributes], 
  {HoldAll, Listable, Protected}], ESameTestBROKEN[
  {Attributes[x], Attributes[Evaluate[x]]}, 
  {{}, {Flat, Listable, NumericFunction, OneIdentity, Orderless, 
    Protected}}], 
 EComment["Unprotect a system symbol to make a definition for it:"], 
 ESameTestBROKEN[protected = Unprotect[Sqrt], {Sqrt}], 
 EComment["Restore protection:"], ESameTestBROKEN[
  Protect[Evaluate[protected]], {Sqrt}], 
 EComment[
  "Force evaluation of the right-hand side of a delayed definition:"], 
 ESameTest[Expand[(1 + x)^3], 1 + 3*x + 3*x^2 + x^3], 
 ESameTestBROKEN[f[x_] := 1 + 3*x + 3*x^2 + x^3, 
  f[x_] := 1 + 3*x + 3*x^2 + x^3], 
 EComment["Build a function from an expression:"], 
 ESameTest[ch = ChebyshevT[5, x], 5*x - 20*x^3 + 16*x^5], 
 ESameTestBROKEN[Function[x, Evaluate[ch]], 
  Function[x, 5*x - 20*x^3 + 16*x^5]], ESameTestBROKEN[%[10], 1580050], 
 EComment["RefLink[Evaluate,paclet:ref/Evaluate] does not work inside \
functions with attribute \
RefLink[HoldAllComplete,paclet:ref/HoldAllComplete]:"], 
 ESameTest[HoldComplete[Evaluate[1 + 2]], HoldComplete[Evaluate[1 + 2]]], 
 EComment["Use RefLink[Unevaluated,paclet:ref/Unevaluated] to temporarily \
treat a function as if it were RefLink[HoldAll,paclet:ref/HoldAll]:"], 
 ESameTest[Length[Unevaluated[1 + 2 + 3]], 3], 
 ESameTest[Length[1 + 2 + 3], 0], EComment["RefLink[Evaluate,paclet:ref/Evalu\
ate] does not work inside RefLink[Unevaluated,paclet:ref/Unevaluated]:"], 
 ESameTest[Unevaluated[Evaluate[1 + 1]], Unevaluated[Evaluate[1 + 1]]], 
 EComment["RefLink[Evaluate,paclet:ref/Evaluate] works only on the first \
level, directly inside a held function:"], 
 ESameTest[Hold[f[Evaluate[1 + 2]]], Hold[f[Evaluate[1 + 2]]]]]
