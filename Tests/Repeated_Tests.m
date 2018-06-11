(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Replace any list of a's by x:"], 
 TapTestSame[{{}, {a, a}, {a, b}, {a, a, a}, {a}} /. {a..} -> x, 
  {{}, x, {a, b}, x, x}], TapComment[
  "Replace any list of f's with one argument:"], 
 TapTestSame[{{}, {f[a], f[b]}, {f[a]}, {f[a, b]}, {f[a], g[b]}} /. 
   {f[_]..} -> x, {{}, x, x, {f[a, b]}, {f[a], g[b]}}], 
 TapComment["a.. represents a sequence of a's inside any head:"], 
 TapTestSame[{f[a, a], f[a, b], f[a, a, a]} /. f[a..] -> x, {x, f[a, b], x}], 
 TapComment["Replace any list of a's with length up to 3:"], 
 TapTestSame[{{}, {a}, {a, a}, {a, a, a}, {a, a, a, a}} /. 
   {Repeated[a, 3]} -> x, {{}, x, x, x, {a, a, a, a}}], 
 TapComment["Replace any list of a's with lengths between 2 and 3:"], 
 TapTestSame[{{}, {a}, {a, a}, {a, a, a}, {a, a, a, a}} /. 
   {Repeated[a, {2, 3}]} -> x, {{}, {a}, x, x, {a, a, a, a}}], 
 TapComment["Replace lists with lengths between 0 and 3:"], 
 TapTestSame[{{}, {a}, {a, a}, {a, a, a}, {a, a, a, a}} /. 
   {Repeated[a, {0, 3}]} -> x, {x, x, x, x, {a, a, a, a}}], 
 TapComment["Replace lists of length exactly 3:"], 
 TapTestSame[{{}, {a}, {a, a}, {a, a, a}, {a, a, a, a}} /. 
   {Repeated[a, {3}]} -> x, {{}, {a}, {a, a}, x, {a, a, a, a}}], 
 TapComment[
  "Define a function that takes as an argument any list of pairs:"], 
 TapTestSame[f[x:{{_, _}..}] := Norm[N[x]]; f[{{1, 1}, {1, 2}, {1, 3}}], 
  4.07914], TapTestSame[f[{{1, 1, 1}, {1, 2}, {1, 3}}], 
  f[{{1, 1, 1}, {1, 2}, {1, 3}}]], TapComment["Use parentheses or spaces to \
indicate that 1.. is not 1. followed by a dot:"], 
 TapTestSame[{{1, 1}, {1}, {2, 1}} /. {(1)..} -> x, {x, x, {2, 1}}]]
