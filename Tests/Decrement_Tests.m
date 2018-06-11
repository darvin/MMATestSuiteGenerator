(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Decrement the value of k by one, but return the old value:"], 
 TapTestSame[k = 1; k--, 1], TapTestSame[k, 0], 
 TapComment["Decrement a numerical value:"], TapTestSame[x = 1.5; x--; x, 
  0.5], TapComment["Decrement a symbolic value:"], 
 TapTestSame[v = a; v--; v, -1 + a], 
 TapComment["Decrement all values in a list:"], 
 TapTestSame[x = {1, 2, 3}, {1, 2, 3}], TapTestSame[x--; x, {0, 1, 2}], 
 TapComment["Find the largest prime smaller than a given number:"], 
 TapTestSame[i = 10^6; While[ !PrimeQ[i], i--]; i, 999983], 
 TapComment["RefLink[Decrement,paclet:ref/Decrement] and \
RefLink[PreDecrement,paclet:ref/PreDecrement] differ in the return value of \
the operation:"], TapTestSameBROKEN[{a, b} = {1, 1} ;; {a--, --b}, {1, 0}], 
 TapTestSameBROKEN[{a, b}, {0, 0}], TapComment["RefLink[Decrement,paclet:ref/\
Decrement] is a short form of this assignment:"], 
 TapTestSame[k = 1; k = k - 1, 0], TapComment["RefLink[Decrement,paclet:ref/D\
ecrement] is a special case of \
RefLink[SubtractFrom,paclet:ref/SubtractFrom]:"], 
 TapTestSame[k = 1; k -= 1, 0], TapComment["RefLink[Increment,paclet:ref/Incr\
ement] and RefLink[PreIncrement,paclet:ref/PreIncrement] are closely related \
operations:"], TapTestSameBROKEN[{a, b, c, d} = 
   {1, 1, 1, 1} ;; {a++, ++b, c--, --d}, {1, 2, 1, 0}], 
 TapTestSameBROKEN[{a, b, c, d}, {2, 2, 0, 0}], 
 TapComment["A variable to be decremented must have an initial value:"], 
 TapTestSameBROKEN[x--, x--]]
