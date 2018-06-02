(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[f[1 + 2], f[1 + 2]], 
 ESameTestBROKEN[plus[a, plus[c, b]], plus[a, b, c]], 
 ESameTestBROKEN[Attributes[f], {Flat, Orderless}], 
 ESameTestBROKEN[Attributes[{f, g}], {{HoldAll, Listable}, {HoldAll}}], 
 EComment["RefLink[SetAttributes,paclet:ref/SetAttributes] is equivalent to \
this assignment to the attributes:"], 
 ESameTest[Attributes[f] = Union[Attributes[f], {HoldFirst, NHoldFirst}], 
  {HoldFirst, NHoldFirst}], ESameTestBROKEN[Attributes[f], 
  {Flat, Orderless}], ESameTestBROKEN[Attributes[{f, g}], 
  {{Protected}, {Protected}}], EComment["A locked symbol can no longer be \
unprotected, as the RefLink[Protected,paclet:ref/Protected] attribute cannot \
be cleared:"], ESameTest[Unprotect[f], {}], EComment["RefLink[SetAttributes,p\
aclet:ref/SetAttributes] has the attribute \
RefLink[HoldFirst,paclet:ref/HoldFirst]:"], 
 ESameTest[Attributes[SetAttributes], {HoldFirst, Protected}], 
 ESameTestBROKEN[Attributes[syms], {Protected}], 
 ESameTestBROKEN[Attributes[{f, g, h}], {{Protected}, {Protected}, 
   {Protected}}], 
 EComment["The 10 system symbols with the most attributes:"], 
 ESameTestBROKEN[TableForm[Take[Sort[({#1, Attributes[#1]} & ) /@ 
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
