(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[x + y]], 
 TapComment["Plot a collection of functions together with the y=x line:"], 
 TapTestSame[HoldComplete[Plot[Evaluate[Through[{Identity, Exp, Log}[x]]], 
    {x, -2, 2}, AspectRatio -> Automatic, PlotRange -> 2]], $Failed], 
 TapComment["RefLink[Identity,paclet:ref/Identity] is removed from functional \
composition:"], TapTestSame[Composition[f, g, Identity, h, Identity], 
  Composition[f, g, h]], TapComment[
  "The first derivative of the identity is the constant 1:"], 
 TapTestSame[Derivative[1][Identity], 1 & ], TapComment["RefLink[Sequence,pac\
let:ref/Sequence] acts as a general identity for several arguments:"], 
 TapTestSame[{a, Sequence[b, c, d], e}, {a, b, c, d, e}], 
 TapComment["RefLink[Identity,paclet:ref/Identity] as a pure function:"], 
 TapTestSame[(#1 & )[a], a], 
 TapComment[
  "Tabulate square roots of values without using auxiliary variables:"], 
 TapTestSameBROKEN[TableForm[Composition[Through, {Identity, Sqrt}] /@ 
    {0, 1., 2., 3., 4.}], 0*0*1.*1.*2.*1.41421*3.*1.73205*4.*2.]]
