(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
Global`TapSuite[Global`TapComment[
  "Define a function f in the MyContext` \
RefLink[Context,paclet:ref/Context]:"], Global`TapTestSameBROKEN[
  HoldComplete[Begin["MyContext`"]], $Failed], 
 Global`TapComment["Restore the context:"], Global`TapTestSameBROKEN[
  HoldComplete[End[]], $Failed], Global`TapComment[
  "The function can be called using its fully qualified name:"], 
 Global`TapTestSameBROKEN[MyContext`f[Global`a + Global`b], 
  1 + (Global`a + Global`b)^2], Global`TapComment["Make symbols used for \
package function definitions private, reducing the possibility for conflict:"]\
, Global`TapTestSameBROKEN[HoldComplete[BeginPackage["MyPackage`"]], 
  $Failed], Global`TapComment["When the context given to \
RefLink[Begin,paclet:ref/Begin] starts with ` it extends from the current \
context:"], Global`TapTestSameBROKEN[HoldComplete[Begin["`Private`"]], 
  $Failed], Global`TapTestSameBROKEN[HoldComplete[End[]], $Failed], 
 Global`TapComment["Since the symbol f is in the package context, the \
function works after RefLink[EndPackage,paclet:ref/EndPackage]:"], 
 Global`TapTestSameBROKEN[f[a + b], 1 + (a + b)^2]]
