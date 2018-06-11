(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Attributes for an existing symbol: "], 
 TapTestSame[Attributes[Plus], {Flat, Listable, NumericFunction, OneIdentity, 
   Orderless, Protected}], TapComment["Set attributes for a new symbol: "], 
 TapTestSame[Attributes[f] = {Listable, Protected}, {Listable, Protected}], 
 TapTestSame[Attributes[f], {Listable, Protected}], 
 TapComment["Attributes of a symbol:"], TapTestSame[Attributes[Plus], 
  {Flat, Listable, NumericFunction, OneIdentity, Orderless, Protected}], 
 TapComment["Attributes of several symbols in a list:"], 
 TapTestSame[Attributes[{Plus, Minus}], 
  {{Flat, Listable, NumericFunction, OneIdentity, Orderless, Protected}, 
   {Listable, NumericFunction, Protected}}], 
 TapComment["The symbol can be given as a string:"], 
 TapTestSame[Attributes["Set"], {HoldFirst, Protected, SequenceHold}], 
 TapComment["RefLink[SetAttributes,paclet:ref/SetAttributes] adds to the \
already existing attributes; \
RefLink[Attributes,paclet:ref/Attributes][g]={..} resets the list:"], 
 TapTestSameBROKEN[SetAttributes[f, HoldAll]; 
   Attributes[g] = HoldAll ;; Attributes[{f, g}], 
  {{HoldAll, Listable}, {HoldAll}}], TapComment["An assignment to \
RefLink[Attributes,paclet:ref/Attributes] is associated with f, not with \
RefLink[Attributes,paclet:ref/Attributes]:"], 
 TapTestSameBROKEN[Attributes[f] = Listable ;; Attributes[f] = {Listable}, 
  Attributes[f] = {Listable}], TapComment["Protecting a symbol is equivalent \
to setting the RefLink[Protected,paclet:ref/Protected] attribute:"], 
 TapTestSameBROKEN[Protect[f] ;; Attributes[f], {Protected}], 
 TapTestSameBROKEN[Unprotect[f] ;; Attributes[f], {}], 
 TapComment["RefLink[Attributes,paclet:ref/Attributes] has the attribute \
RefLink[HoldAll,paclet:ref/HoldAll]:"], TapTestSame[Attributes[Attributes], 
  {HoldAll, Listable, Protected}], 
 TapComment["This gives the attributes of the symbol syms itself:"], 
 TapTestSame[Attributes[syms], {}], 
 TapComment["This gives the attributes of all symbols in the list syms:"], 
 TapTestSameBROKEN[Attributes[Evaluate[syms]], 
  {{Flat, Listable, NumericFunction, OneIdentity, Orderless, Protected}, 
   {Flat, Listable, NumericFunction, OneIdentity, Orderless, Protected}, 
   {Listable, NumericFunction, OneIdentity, Protected}}]]
