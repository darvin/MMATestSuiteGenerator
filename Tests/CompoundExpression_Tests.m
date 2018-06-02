(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[a = 2; b = 3; a + b, 5], 
 EComment["% is still set to be the output:"], 
 ESameTestBROKEN[%, 
  1606938044258990275541962092341162602522202993782792835301376], 
 EComment["Use RefLink[Throw,paclet:ref/Throw], \
RefLink[Catch,paclet:ref/Catch] to exit immediately:"], 
 ESameTest[Catch[a = 2; Throw[a]; a = 5], 2]]
