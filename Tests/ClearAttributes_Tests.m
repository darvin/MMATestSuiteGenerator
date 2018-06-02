(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[Log[{1, 2, 3}], Log[{1, 2, 3}]], 
 TapTestSameBROKEN[Attributes[f], {Flat, Orderless}], 
 TapComment["RefLink[ClearAttributes,paclet:ref/ClearAttributes] is \
equivalent to this assignment to the attributes:"], 
 TapTestSame[Attributes[f] = Complement[Attributes[f], 
    {HoldFirst, NHoldFirst}], {}], TapTestSame[Attributes[{f, g}], {{}, {}}]]
