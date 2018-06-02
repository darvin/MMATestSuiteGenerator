Import["CompatTests.m"]; 
TapSuite[
 TapTestSame[1+1+3, 5], 
 TapComment["This is comment"], 
 TapTestSame[2+2, 4], 
 TapComment["Now broken test:"], 
 TapTestSame[2+2, 3], 
 TapComment["Now skipped test:"], 
 TapTestSameBROKEN[2+0, 3],
 TapComment["Now really broken test:"], 
 TapTestSame[2+2+0/0, 3], 
  TapComment["Now nice test:"], 
  TapTestSame[1+1+3, 5], 


 ]
