(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[f[1 + 2]]], 
 TapTestSame[SetAttributes[plus, {Flat, Orderless}]; plus[a, plus[c, b]], 
  plus[a, b, c]], TapComment[
  "Add more attributes; the previous ones are retained:"], 
 TapTestSameBROKEN[SetAttributes[f, Orderless]; Attributes[f], 
  {Flat, Orderless}], TapComment["RefLink[SetAttributes,paclet:ref/SetAttribu\
tes] adds to the already existing attributes; \
RefLink[Attributes,paclet:ref/Attributes][g]={..} resets the list:"], 
 TapTestSameBROKEN[SetAttributes[f, HoldAll]; 
   Attributes[g] = HoldAll ;; Attributes[{f, g}], 
  {{HoldAll, Listable}, {HoldAll}}], TapComment["RefLink[SetAttributes,paclet\
:ref/SetAttributes] is equivalent to this assignment to the attributes:"], 
 TapTestSameBROKEN[Attributes[f] = Union[Attributes[f], 
    {HoldFirst, NHoldFirst}], {HoldFirst, NHoldFirst}], 
 TapComment["Use RefLink[ClearAttributes,paclet:ref/ClearAttributes] to clear \
a particular attribute:"], TapTestSameBROKEN[
  SetAttributes[f, {Flat, Orderless, OneIdentity}]; 
   ClearAttributes[f, OneIdentity]; Attributes[f], {Flat, Orderless}], 
 TapComment["Protecting a symbol is equivalent to setting the \
RefLink[Protected,paclet:ref/Protected] attribute:"], 
 TapTestSameBROKEN[Protect[f]; SetAttributes[g, Protected] ;; 
    Attributes[{f, g}], {{Protected}, {Protected}}], 
 TapComment["A locked symbol can no longer be unprotected, as the \
RefLink[Protected,paclet:ref/Protected] attribute cannot be cleared:"], 
 TapTestSameBROKEN[Unprotect[f], {}], TapComment["RefLink[SetAttributes,pacle\
t:ref/SetAttributes] has the attribute \
RefLink[HoldFirst,paclet:ref/HoldFirst]:"], 
 TapTestSame[Attributes[SetAttributes], {HoldFirst, Protected}], 
 TapComment["This sets attributes of the symbol syms itself:"], 
 TapTestSame[SetAttributes[syms, Protected]; Attributes[syms], {Protected}], 
 TapComment["This sets the attributes of all symbols in the list syms:"], 
 TapTestSameBROKEN[SetAttributes[Evaluate[syms], Protected]; 
   Attributes[{f, g, h}], {{Protected}, {Protected}, {Protected}}], 
 TapComment["The 10 system symbols with the most attributes:"], 
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
