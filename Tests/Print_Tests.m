(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["The actual expression returned by \
RefLink[Print,paclet:ref/Print] is RefLink[Null,paclet:ref/Null]:"], 
 ESameTestBROKEN[InputForm[Print[x]], Null]]
