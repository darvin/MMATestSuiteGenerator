(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Process messages generated during an evaluation:"], 
 TapTestSame[{Sin[1, 2.], BesselJ[3, 4.], Log[5, 6.], Exp[7, 8.]}, 
  {Sin[1, 2.], 0.430171, 1.11328, Exp[7, 8.]}], 
 TapTestSameBROKEN[mess = MessageList[-1], {Sin::argx, Exp::argx}], 
 TapTestSameBROKEN[mest = Cases[mess, HoldForm[MessageName[f_, s_]] -> 
     {f, s}], {{Sin, argx}, {Exp, argx}}], TapComment["Define a function that \
will test another function and give the argx message if needed:"], 
 TapTestSame[oneargtest[f_, args___] := Module[{nargs = Length[{args}]}, 
     If[nargs != 1, Message[f::argx, nargs, 1]; False, True]]; 
   oneargtest[g, 1, 2], False], 
 TapComment[
  "Define g to use the test and return unevaluated when it fails:"], 
 TapTestSame[g[args___] := Module[{x = First[{args}]}, (x - 1)*(x + 1)] /; 
     oneargtest[g, args]; g[1, 2], g[1, 2]], TapTestSame[g[1.5], 1.25]]
