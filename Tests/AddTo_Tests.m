(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[k = 1; k += 5, 6], ESameTest[k, 6], 
 EComment["Add to a numerical value:"], ESameTest[x = 1.5; x += 3.75; x, 
  5.25], EComment["Add to a symbolic value:"], 
 ESameTest[v = a; v += b; v, a + b], 
 EComment["Add to all values in a list:"], ESameTest[x = {1, 2, 3}, 
  {1, 2, 3}], ESameTest[x += 17; x, {18, 19, 20}], 
 ESameTest[x += {20, 21, 22}; x, {38, 40, 42}], 
 EComment["Find the first prime above one million:"], 
 ESameTest[i = 10^6 - 1; While[ !PrimeQ[i], i += 2]; i, 1000003], 
 EComment[
  "RefLink[AddTo,paclet:ref/AddTo] is a short form of this assignment:"], 
 ESameTest[k = 1; k = k + 5, 6], EComment["RefLink[PreIncrement,paclet:ref/Pr\
eIncrement] is a special case of RefLink[AddTo,paclet:ref/AddTo]:"], 
 ESameTest[k = 1; k += 1, 2], ESameTest[++k, 3], 
 EComment[
  "RefLink[SubtractFrom,paclet:ref/SubtractFrom] is closely related:"], 
 ESameTest[k = 10; k += -5, 5], ESameTest[k -= 5, 0], 
 ESameTestBROKEN[AppendTo[list, 4]; list, {1, 2, 3, 4}], 
 EComment["A variable to be incremented must have an initial value:"], 
 ESameTestBROKEN[x += 2, x += 2]]
