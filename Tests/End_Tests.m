(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Define a function f in the MyContext` \
RefLink[Context,paclet:ref/Context]:"], TapTestSameBROKEN[
  HoldComplete[originalcontext = Context[]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Begin["MyContext`"]], $Failed], 
 TapComment["Restore the context:"], TapTestSameBROKEN[HoldComplete[End[]], 
  $Failed], TapComment["The context is now what it was before \
RefLink[Begin,paclet:ref/Begin] was used:"], 
 TapTestSame[Context[] === originalcontext, True]]
