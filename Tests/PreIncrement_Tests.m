(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Increment the value by 1 and return the new value:"], 
 ESameTest[k = 1; ++k, 2], ESameTest[k, 2], 
 EComment["Increment a numerical value:"], ESameTest[x = 1.5; ++x; x, 2.5], 
 EComment["Increment a symbolic value:"], ESameTest[v = a; ++v; v, 1 + a], 
 EComment["Increment all values in a list:"], 
 ESameTest[x = {1, 2, 3}, {1, 2, 3}], ESameTest[++x; x, {2, 3, 4}], 
 EComment["Find the first integer with a certain property:"], 
 ESameTest[i = 1; While[Prime[++i] < 10^6, Null]; i, 78499], 
 ESameTestBROKEN[{a++, ++b}, {1, 2}], ESameTestBROKEN[{a, b}, {2, 2}], 
 EComment["RefLink[PreIncrement,paclet:ref/PreIncrement] is a short form of \
this assignment:"], ESameTest[k = 1; k = k + 1, 2], 
 EComment["RefLink[PreIncrement,paclet:ref/PreIncrement] is a special case of \
RefLink[AddTo,paclet:ref/AddTo]:"], ESameTest[k = 1; k += 1, 2], 
 ESameTestBROKEN[{a++, ++b, c--, --d}, {1, 2, 1, 0}], 
 ESameTestBROKEN[{a, b, c, d}, {2, 2, 0, 0}], 
 EComment["A variable to be incremented must have an initial value:"], 
 ESameTestBROKEN[++x, ++x]]
