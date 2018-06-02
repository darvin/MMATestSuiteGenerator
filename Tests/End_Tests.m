(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Define a function f in the MyContext` \
RefLink[Context,paclet:ref/Context]:"], 
 ESameTestBROKEN[HoldComplete[originalcontext = Context[]], $Failed], 
 ESameTestBROKEN[HoldComplete[Begin["MyContext`"]], $Failed], 
 EComment["Restore the context:"], ESameTestBROKEN[HoldComplete[End[]], 
  $Failed], EComment["The context is now what it was before \
RefLink[Begin,paclet:ref/Begin] was used:"], 
 ESameTest[Context[] === originalcontext, True]]
