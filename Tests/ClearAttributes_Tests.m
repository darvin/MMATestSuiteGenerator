(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Log[{1, 2, 3}], Log[{1, 2, 3}]], 
 ESameTestBROKEN[Attributes[f], {Flat, Orderless}], 
 EComment["RefLink[ClearAttributes,paclet:ref/ClearAttributes] is equivalent \
to this assignment to the attributes:"], 
 ESameTest[Attributes[f] = Complement[Attributes[f], 
    {HoldFirst, NHoldFirst}], {}], ESameTest[Attributes[{f, g}], {{}, {}}]]
