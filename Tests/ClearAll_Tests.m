(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Define values and attributes for a symbol: "], 
 TapTestSameBROKEN[SetAttributes[f, Listable]; f[x_] := x^2; Null, 
  Attributes[f] = {Listable}*f[x_] := x^2], 
 TapComment["Clear values and attributes: "], TapTestSame[ClearAll[f]; Null, 
  Null], TapComment["Clear values of variables:"], 
 TapTestSame[x = 5 ;; ClearAll[x]; x, x], 
 TapComment["Clear functions (downvalues):"], 
 TapTestSame[fact[1] = 1; fact[n_] := n*fact[n - 1]; ClearAll[fact]; Null, 
  Null], TapComment["Clear several symbols:"], 
 TapTestSame[a = 5; f[x_] := x^3; ClearAll[a, f]; f[a], f[a]], 
 TapComment["Specify symbols to clear as string patterns:"], 
 TapTestSameBROKEN[x1 = 1; x2 = 3; y = 5 ;; ClearAll["x*"]; {x1, x2, y}, 
  {x1, x2, 5}], TapComment[
  "Clear any old definitions before making new ones:"], 
 TapTestSame[ClearAll[fib]; fib[1] = fib[2] = 1; 
   fib[n_] := fib[n] = fib[n - 1] + fib[n - 2]; fib[5], 5], 
 TapComment["RefLink[Clear,paclet:ref/Clear] does not remove defaults, \
options, or attributes: "], TapTestSameBROKEN[
  Default[f] = 0; Options[f] = {opt1 -> def1, opt2 -> def2}; f[x_] := x^2; 
   Clear[f]; Null, Default[f] = 0*Options[f] = {opt1 -> def1, opt2 -> def2}], 
 TapComment[
  "Use RefLink[ClearAll,paclet:ref/ClearAll] to clear everything:"], 
 TapTestSame[ClearAll[f]; Null, Null], 
 TapComment["Use =. to clear definitions with a particular left-hand side:"], 
 TapTestSameBROKEN[fact[1] = 1; fact[n_] := n*fact[n - 1]; fact[1] =. ; Null, 
  fact[n_] := n*fact[n - 1]], TapComment["Clear all definitions:"], 
 TapTestSame[ClearAll[fact]; Null, Null]]
