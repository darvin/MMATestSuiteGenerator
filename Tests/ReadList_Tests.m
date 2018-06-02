(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Read in each line as a separate expression:"], 
 ESameTest[ReadList[StringToStream["123\n45\nx\ny"]], {123, 45, x, y}], 
 EComment["Read each line as a string:"], 
 ESameTestBROKEN[ReadList[StringToStream["123\n45\nx\ny"], String], 
  {123, 45, x, y}], ESameTestBROKEN[InputForm[%], {"123", "45", "x", "y"}]]
