(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Read in each line as a separate expression:"], 
 TapTestSame[ReadList[StringToStream["123\n45\nx\ny"]], {123, 45, x, y}], 
 TapComment["Read each line as a string:"], 
 TapTestSame[ReadList[StringToStream["123\n45\nx\ny"], String], 
  {123, 45, x, y}], TapTestSame[InputForm[%], {"123", "45", "x", "y"}]]
