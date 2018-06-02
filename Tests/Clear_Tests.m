(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[x, x], TapTestSameBROKEN[fact[n_] := n*fact[n - 1], 
  Null], TapTestSame[f[a], f[a]], TapTestSameBROKEN[{x1, x2, y}, 
  {x1, x2, 5}], TapTestSameBROKEN[fib[5], 5], 
 TapTestSameBROKEN[Null, Attributes[f] = {Listable}*Default[f] = 
    0*Options[f] = {opt1 -> def1, opt2 -> def2}], 
 TapTestSameBROKEN[Null, Null], TapTestSameBROKEN[fact[n_] := n*fact[n - 1], 
  fact[n_] := n*fact[n - 1]], TapTestSameBROKEN[fact[n_] := n*fact[n - 1], 
  Null]]
