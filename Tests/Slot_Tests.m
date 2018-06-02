(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["# represents the first argument of a pure function:"], 
 TapTestSame[(f[#1, a, #1, b] & )[x, y], f[x, a, x, b]], 
 TapComment["Use numbered arguments:"], 
 TapTestSame[(f[#1, #2, #1, #3] & )[x, y, z], f[x, y, x, z]], 
 TapComment["Used named arguments from an association:"], 
 TapTestSameBROKEN[(f[u, v, u] & )[\[LeftAssociation] "u" -> x, 
    "v" -> y \[RightAssociation]], f[x, y, x]], 
 TapComment["# is short for #1, the first argument:"], 
 TapTestSame[(#1 & )[1, 2, 3], 1], TapTestSame[(#1 & )[1, 2, 3], 1], 
 TapComment["#name is effectively a short form of #[\"name\"]:"], 
 TapTestSameBROKEN[(x & )[\[LeftAssociation] "x" -> a, 
    "y" -> b \[RightAssociation]], a], 
 TapTestSame[(#1["x"] & )[\[LeftAssociation] "x" -> a, 
    "y" -> b \[RightAssociation]], a], 
 TapComment["#name is interpreted as \
RefLink[Slot,paclet:ref/Slot][\"name\"]:"], TapTestSameBROKEN[FullForm[z & ], 
  Slot["z"] & ], TapComment[
  "#name always refers to the association in the first argument:"], 
 TapTestSameBROKEN[(y & )[\[LeftAssociation] "x" -> 1, 
    "y" -> 2 \[RightAssociation], \[LeftAssociation] "x" -> 3, 
    "y" -> 4 \[RightAssociation]], 2], 
 TapComment["Extract from an association slot other than the first:"], 
 TapTestSame[(#2["y"] & )[\[LeftAssociation] "x" -> 1, 
    "y" -> 2 \[RightAssociation], \[LeftAssociation] "x" -> 3, 
    "y" -> 4 \[RightAssociation]], 4], 
 TapComment["#0 stands for the whole pure function:"], 
 TapTestSame[(f[#0] & )[x], f[f[#0] & ]], 
 TapComment["Programmatically create a pure function of 5 arguments:"], 
 TapTestSame[Evaluate[f @@ Array[Slot, 5]] & , f[#1, #2, #3, #4, #5] & ], 
 TapTestSameBROKEN[% @@ Range[10], f[1, 2, 3, 4, 5]], 
 TapComment[
  "# allows function arguments to be referenced without giving them names:"], 
 TapTestSame[Function[u, 1 + u][x], 1 + x], TapTestSame[(1 + #1 & )[x], 
  1 + x], TapComment["Additional arguments are ignored:"], 
 TapTestSame[(f[#1, #2] & )[a, b, c, d], f[a, b]], 
 TapComment["## stands for the sequence of all arguments:"], 
 TapTestSame[({#1, #2, #3} & )[a, b, c], {a, b, c}], 
 TapTestSame[({##1} & )[a, b, c], {a, b, c}], 
 TapComment["Use explicit names to set up nested pure functions:"], 
 TapTestSame[Function[u, Function[v, f[u, v]]][x], Function[v$, f[x, v$]]], 
 TapTestSame[Function[u, Function[v, f[u, v]]][x][y], f[x, y]], 
 TapComment["Use # for the inner function:"], 
 TapTestSame[Function[u, f[u, #1] & ][x], f[x, #1] & ], 
 TapTestSame[Function[u, f[u, #1] & ][x][y], f[x, y]], 
 TapComment["Use # for the outer function: "], 
 TapTestSame[(Function[v, f[#1, v]] & )[x], Function[v, f[x, v]]], 
 TapTestSame[(Function[v, f[#1, v]] & )[x][y], f[x, y]], 
 TapComment["Using nested # notation behaves differently:"], 
 TapTestSame[((f[#1, #1] & ) & )[x], f[#1, #1] & ], 
 TapTestSame[((f[#1, #1] & ) & )[x][y], f[y, y]], 
 TapComment["If too few arguments are provided, a message is generated:"], 
 TapTestSame[(f[#4] & )[a, b, c], f[#4]], TapTestSame[(f[#4] & )[a, b, c, d], 
  f[d]], TapComment["A space between # and the following token will be \
interpreted as multiplication:"], TapTestSameBROKEN[InputForm[#1*2], 2*#1], 
 TapTestSameBROKEN[InputForm[#1*name], name*#1], 
 TapComment["A recursive definition for factorial using #0:"], 
 TapTestSame[f = If[#1 == 1, 1, #1*#0[#1 - 1]] & , 
  If[#1 == 1, 1, #1*#0[#1 - 1]] & ], TapTestSame[f[10], 3628800], 
 TapTestSame[10!, 3628800]]
