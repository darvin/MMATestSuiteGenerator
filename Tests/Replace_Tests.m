(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["RefLink[Replace,paclet:ref/Replace] by default \
applies rules only to complete expressions:"], 
 ESameTest[Replace[x^2, x^2 -> a + b], a + b], 
 EComment["It does not map down to subparts:"], 
 ESameTest[Replace[1 + x^2, x^2 -> a + b], 1 + x^2], 
 EComment["A list of rules gives a list of results:"], 
 ESameTest[Replace[x, {{x -> a}, {x -> b}}], {a, b}], 
 EComment["Replace at level 1:"], ESameTest[Replace[1 + x^2, x^2 -> a + b, 
   {1}], 1 + a + b], EComment["RefLink[Replace,paclet:ref/Replace] also works \
with RefLink[RuleDelayed,paclet:ref/RuleDelayed]:"], 
 ESameTestBROKEN[Replace[{x, x, x}, x :> RandomReal[], {1}], 
  {0.921434, 0.760332, 0.860225}]]
