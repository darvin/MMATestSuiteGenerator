(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Process Boolean value to 1 or 0, giving a message and \
defaulting to 0 when not Boolean:"], TapTestSameBROKEN[
  f::boole = "The value `1` is not True or False." ;; f[b_] := 
     Switch[b, True, 1, False, 0, _, Message[f::boole, b]; 0]; 
   {f[True], f[False], f[x]}, {1, 0, 0}], 
 TapComment["Give a suggested symbolic transformation for an expression:"], 
 TapTestSame[t[e_] := Switch[e, _Plus, Together, _Times, Apart, _, Identity]; 
   e = (1 + x)/(1 - x) + x/(1 + x); t[e], Together], 
 TapComment["Try the transformation:"], TapTestSame[e1 = t[e][e], 
  (-1 - 3*x)/((-1 + x)*(1 + x))]]
