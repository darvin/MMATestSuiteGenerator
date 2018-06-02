(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[x, x], ESameTestBROKEN[fact[n_] := n*fact[n - 1], 
  Null], ESameTest[f[a], f[a]], ESameTestBROKEN[{x1, x2, y}, {x1, x2, 5}], 
 ESameTestBROKEN[fib[5], 5], ESameTestBROKEN[Null, 
  Attributes[f] = {Listable}*Default[f] = 0*Options[f] = 
     {opt1 -> def1, opt2 -> def2}], ESameTestBROKEN[Null, Null], 
 ESameTestBROKEN[fact[n_] := n*fact[n - 1], fact[n_] := n*fact[n - 1]], 
 ESameTestBROKEN[fact[n_] := n*fact[n - 1], Null]]
