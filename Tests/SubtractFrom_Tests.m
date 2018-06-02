(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[k = 1; k -= 5, -4], ESameTest[k, -4], 
 EComment["Subtract from a numerical value:"], 
 ESameTest[x = 1.5; x -= 0.75; x, 0.75], 
 EComment["Subtract from a symbolic value:"], ESameTest[v = a; v -= b; v, 
  a - b], EComment["Subtract from all values in a list:"], 
 ESameTest[x = {100, 200, 300}, {100, 200, 300}], 
 ESameTest[x -= 17; x, {83, 183, 283}], ESameTest[x -= {20, 21, 22}; x, 
  {63, 162, 261}], EComment["Find the last prime below one million:"], 
 ESameTest[i = 10^6 + 1; While[ !PrimeQ[i], i -= 2]; i, 999983], 
 EComment["RefLink[SubtractFrom,paclet:ref/SubtractFrom] is a short form of \
this assignment:"], ESameTest[k = 1; k = k - 5, -4], 
 EComment["RefLink[PreDecrement,paclet:ref/PreDecrement] is a special case of \
RefLink[SubtractFrom,paclet:ref/SubtractFrom]:"], 
 ESameTest[k = 10; k -= 1, 9], ESameTest[--k, 8], 
 EComment["RefLink[AddTo,paclet:ref/AddTo] is closely related:"], 
 ESameTest[k = 10; k -= 5, 5], ESameTest[k += -5, 0], 
 EComment["A variable to be decremented must have an initial value:"], 
 ESameTestBROKEN[x -= 2, x -= 2]]
