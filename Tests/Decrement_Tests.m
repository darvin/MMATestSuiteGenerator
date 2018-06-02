(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Decrement the value of k by one, but return the old value:"], 
 ESameTest[k = 1; k--, 1], ESameTest[k, 0], 
 EComment["Decrement a numerical value:"], ESameTest[x = 1.5; x--; x, 0.5], 
 EComment["Decrement a symbolic value:"], ESameTest[v = a; v--; v, -1 + a], 
 EComment["Decrement all values in a list:"], 
 ESameTest[x = {1, 2, 3}, {1, 2, 3}], ESameTest[x--; x, {0, 1, 2}], 
 EComment["Find the largest prime smaller than a given number:"], 
 ESameTest[i = 10^6; While[ !PrimeQ[i], i--]; i, 999983], 
 ESameTestBROKEN[{a--, --b}, {1, 0}], ESameTestBROKEN[{a, b}, {0, 0}], 
 EComment["RefLink[Decrement,paclet:ref/Decrement] is a short form of this \
assignment:"], ESameTest[k = 1; k = k - 1, 0], 
 EComment["RefLink[Decrement,paclet:ref/Decrement] is a special case of \
RefLink[SubtractFrom,paclet:ref/SubtractFrom]:"], 
 ESameTest[k = 1; k -= 1, 0], ESameTestBROKEN[{a++, ++b, c--, --d}, 
  {1, 2, 1, 0}], ESameTestBROKEN[{a, b, c, d}, {2, 2, 0, 0}], 
 EComment["A variable to be decremented must have an initial value:"], 
 ESameTestBROKEN[x--, x--]]
