(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
Global`ESimpleExamples[Global`EComment[
  "Define a function f in the MyContext` \
RefLink[Context,paclet:ref/Context]:"], Global`ESameTestBROKEN[
  HoldComplete[Begin["MyContext`"]], $Failed], 
 Global`EComment["Restore the context:"], Global`ESameTestBROKEN[
  HoldComplete[End[]], $Failed], Global`EComment[
  "The function can be called using its fully qualified name:"], 
 Global`ESameTestBROKEN[MyContext`f[Global`a + Global`b], 
  1 + (Global`a + Global`b)^2], Global`EComment["Make symbols used for \
package function definitions private, reducing the possibility for conflict:"]\
, Global`ESameTestBROKEN[HoldComplete[BeginPackage["MyPackage`"]], $Failed], 
 Global`EComment["When the context given to RefLink[Begin,paclet:ref/Begin] \
starts with ` it extends from the current context:"], 
 Global`ESameTestBROKEN[HoldComplete[Begin["`Private`"]], $Failed], 
 Global`ESameTestBROKEN[HoldComplete[End[]], $Failed], 
 Global`EComment["Since the symbol f is in the package context, the function \
works after RefLink[EndPackage,paclet:ref/EndPackage]:"], 
 Global`ESameTestBROKEN[f[a + b], 1 + (a + b)^2]]
