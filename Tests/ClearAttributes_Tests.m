(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[Log[{1, 2, 3}]]], 
 TapComment[
  "Clear a particular attribute; the remaining ones are retained:"], 
 TapTestSameBROKEN[ClearAttributes[f, OneIdentity]; Attributes[f], 
  {Flat, Orderless}], TapComment["RefLink[ClearAttributes,paclet:ref/ClearAtt\
ributes] is equivalent to this assignment to the attributes:"], 
 TapTestSame[Attributes[f] = Complement[Attributes[f], 
    {HoldFirst, NHoldFirst}], {}], TapComment["Unprotecting a symbol is \
equivalent to clearing the RefLink[Protected,paclet:ref/Protected] \
attribute:"], TapTestSameBROKEN[Protect[f, g] ;; Unprotect[f]; 
   ClearAttributes[g, Protected] ;; Attributes[{f, g}], {{}, {}}]]
