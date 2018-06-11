(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Return from a function:"], 
 TapTestSame[f[x_] := (If[x > 5, Return[a]]; x + 3); f[6], a], 
 TapComment["RefLink[Return,paclet:ref/Return] exits only the innermost \
construct in which it is invoked:"], 
 TapTestSame[f[x_] := (If[x > 5, Return[a]]; x); f[6], a], 
 TapComment[
  "Here it exits the RefLink[Do,paclet:ref/Do] loop, but not the function g:"]\
, TapTestSame[g[x_] := (Do[If[x > 5, Return[a]], {3}]; x); g[6], 6], 
 TapComment["Use RefLink[Catch,paclet:ref/Catch] and \
RefLink[Throw,paclet:ref/Throw] for explicit flow control:"], 
 TapTestSame[h[x_] := Catch[Do[If[x > 5, Throw[a]], {3}]; x]; h[6], a]]
