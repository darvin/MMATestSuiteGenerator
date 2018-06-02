(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "RefLink[Sequence,paclet:ref/Sequence] is automatically spliced in:"], 
 TapTestSame[f[a, Sequence[b, c], d], f[a, b, c, d]], 
 TapComment["Replace with a sequence that is automatically spliced in:"], 
 TapTestSame[{u, u, u} /. u -> Sequence[a, b, c], 
  {a, b, c, a, b, c, a, b, c}], TapTestSameBROKEN[u = Sequence[a, b, c], 
  Sequence[a, b, c]], TapTestSame[{u, u, u}, {a, b, c, a, b, c, a, b, c}], 
 TapComment[
  "Completely flatten out all lists in the argument to a function:"], 
 TapTestSame[f[{{a, b}, {c, d}, {a}}] /. List -> Sequence, f[a, b, c, d, a]], 
 TapComment["A sequence of arguments matched by __ is treated as a \
RefLink[Sequence,paclet:ref/Sequence] object: "], 
 TapTestSameBROKEN[f[a, b, c] /. f[x__] -> x, Sequence[a, b, c]], 
 TapComment["## represents sequences of arguments by \
RefLink[Sequence,paclet:ref/Sequence] objects:"], 
 TapTestSameBROKEN[(##1 & )[a, b, c], Sequence[a, b, c]], 
 TapComment["A sequence with one argument acts like \
RefLink[Identity,paclet:ref/Identity]:"], 
 TapTestSame[{a, Sequence[b], c, Identity[d]}, {a, b, c, d}], 
 TapComment["Most Wolfram Language functions automatically splice in \
RefLink[Sequence,paclet:ref/Sequence] objects:"], 
 TapTestSame[Head[Sequence[a, b]], Head[a, b]], 
 TapComment["Assignment and replacement functions have the attribute \
RefLink[SequenceHold,paclet:ref/SequenceHold]:"], 
 TapTestSame[u -> Sequence[a, b], u -> Sequence[a, b]]]
