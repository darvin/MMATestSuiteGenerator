(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Process messages generated during an evaluation:"], 
 TapTestSameBROKEN[{Sin[1, 2.], BesselJ[3, 4.], Log[5, 6.], Exp[7, 8.]}, 
  {Sin[1, 2.], 0.430171, 1.11328, Exp[7, 8.]}], 
 TapTestSameBROKEN[mess = MessageList[-1], {Sin::argx, Exp::argx}], 
 TapTestSameBROKEN[mest = Cases[mess, HoldForm[MessageName[f_, s_]] -> 
     {f, s}], {{Sin, argx}, {Exp, argx}}], 
 TapTestSameBROKEN[oneargtest[g, 1, 2], False], 
 TapTestSame[g[1, 2], g[1, 2]], TapTestSameBROKEN[g[1.5], 1.25]]
