(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[f[1 + 2], f[1 + 2]], 
 TapTestSameBROKEN[plus[a, plus[c, b]], plus[a, b, c]], 
 TapTestSameBROKEN[Attributes[f], {Flat, Orderless}], 
 TapTestSameBROKEN[Attributes[{f, g}], {{HoldAll, Listable}, {HoldAll}}], 
 TapComment["RefLink[SetAttributes,paclet:ref/SetAttributes] is equivalent to \
this assignment to the attributes:"], 
 TapTestSame[Attributes[f] = Union[Attributes[f], {HoldFirst, NHoldFirst}], 
  {HoldFirst, NHoldFirst}], TapTestSameBROKEN[Attributes[f], 
  {Flat, Orderless}], TapTestSameBROKEN[Attributes[{f, g}], 
  {{Protected}, {Protected}}], TapComment["A locked symbol can no longer be \
unprotected, as the RefLink[Protected,paclet:ref/Protected] attribute cannot \
be cleared:"], TapTestSame[Unprotect[f], {}], TapComment["RefLink[SetAttribut\
es,paclet:ref/SetAttributes] has the attribute \
RefLink[HoldFirst,paclet:ref/HoldFirst]:"], 
 TapTestSame[Attributes[SetAttributes], {HoldFirst, Protected}], 
 TapTestSameBROKEN[Attributes[syms], {Protected}], 
 TapTestSameBROKEN[Attributes[{f, g, h}], {{Protected}, {Protected}, 
   {Protected}}], TapComment[
  "The 10 system symbols with the most attributes:"], 
 TapTestSameBROKEN[TableForm[Take[Sort[({#1, Attributes[#1]} & ) /@ 
      Names["System`*"], Length[#1[[2]]] > Length[#2[[2]]] & ], 10], 
   TableDepth -> 2], Times*{Flat, Listable, NumericFunction, OneIdentity, 
    Orderless, Protected}*Plus*{Flat, Listable, NumericFunction, OneIdentity, 
    Orderless, Protected}*Min*{Flat, NumericFunction, OneIdentity, Orderless, 
    Protected}*Max*{Flat, NumericFunction, OneIdentity, Orderless, Protected}*
   LCM*{Flat, Listable, OneIdentity, Orderless, Protected}*GCD*
   {Flat, Listable, OneIdentity, Orderless, Protected}*BitXor*
   {Flat, Listable, OneIdentity, Orderless, Protected}*BitOr*
   {Flat, Listable, OneIdentity, Orderless, Protected}*BitAnd*
   {Flat, Listable, OneIdentity, Orderless, Protected}*
   ArithmeticGeometricMean*{Listable, NumericFunction, Orderless, Protected, 
    ReadProtected}]]
