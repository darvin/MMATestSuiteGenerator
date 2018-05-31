Import["CompatTests.m"]; 
ESimpleExamples[
 ESameTest[1+1+3, 5], 
 EComment["This is comment"], 
 ESameTest[2+2, 4], 
 EComment["Now broken test:"], 
 ESameTest[2+2, 3], 
 EComment["Now skipped test:"], 
 ESameTestBROKEN[2+0, 3],
 EComment["Now really broken test:"], 
 ESameTest[2+2+0/0, 3], 
  EComment["Now nice test:"], 
  ESameTest[1+1+3, 5], 


 ]
