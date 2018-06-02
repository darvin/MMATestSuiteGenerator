(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "RefLink[Sequence,paclet:ref/Sequence] is automatically spliced in:"], 
 ESameTest[f[a, Sequence[b, c], d], f[a, b, c, d]], 
 EComment["Replace with a sequence that is automatically spliced in:"], 
 ESameTest[{u, u, u} /. u -> Sequence[a, b, c], {a, b, c, a, b, c, a, b, c}], 
 ESameTestBROKEN[u = Sequence[a, b, c], Sequence[a, b, c]], 
 ESameTest[{u, u, u}, {a, b, c, a, b, c, a, b, c}], 
 EComment["Completely flatten out all lists in the argument to a function:"], 
 ESameTest[f[{{a, b}, {c, d}, {a}}] /. List -> Sequence, f[a, b, c, d, a]], 
 EComment["A sequence of arguments matched by __ is treated as a \
RefLink[Sequence,paclet:ref/Sequence] object: "], 
 ESameTestBROKEN[f[a, b, c] /. f[x__] -> x, Sequence[a, b, c]], 
 EComment["## represents sequences of arguments by \
RefLink[Sequence,paclet:ref/Sequence] objects:"], 
 ESameTestBROKEN[(##1 & )[a, b, c], Sequence[a, b, c]], 
 EComment["A sequence with one argument acts like \
RefLink[Identity,paclet:ref/Identity]:"], 
 ESameTest[{a, Sequence[b], c, Identity[d]}, {a, b, c, d}], 
 EComment["Most Wolfram Language functions automatically splice in \
RefLink[Sequence,paclet:ref/Sequence] objects:"], 
 ESameTest[Head[Sequence[a, b]], Head[a, b]], 
 EComment["Assignment and replacement functions have the attribute \
RefLink[SequenceHold,paclet:ref/SequenceHold]:"], 
 ESameTest[u -> Sequence[a, b], u -> Sequence[a, b]]]
