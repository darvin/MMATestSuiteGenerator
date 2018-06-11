(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Decrement the value by one and return the new value:"], 
 TapTestSame[k = 1; --k, 0], TapTestSame[k, 0], 
 TapComment["Decrement a numerical value:"], TapTestSame[x = 1.5; --x; x, 
  0.5], TapComment["Decrement a symbolic value:"], 
 TapTestSame[v = a; --v; v, -1 + a], 
 TapComment["Decrement all values in a list:"], 
 TapTestSame[x = {1, 2, 3}, {1, 2, 3}], TapTestSame[--x; x, {0, 1, 2}], 
 TapComment[
  "Find the first integer below one million with a certain property:"], 
 TapTestSame[i = 10^6; While[ !PrimeQ[--i], Null]; i, 999983], 
 TapComment["RefLink[Decrement,paclet:ref/Decrement] and \
RefLink[PreDecrement,paclet:ref/PreDecrement] differ in the return value of \
the operation:"], TapTestSameBROKEN[{a, b} = {1, 1} ;; {a--, --b}, {1, 0}], 
 TapTestSameBROKEN[{a, b}, {0, 0}], TapComment["RefLink[PreDecrement,paclet:r\
ef/PreDecrement] is a short form of this assignment:"], 
 TapTestSame[k = 1; k = k - 1, 0], TapComment["RefLink[PreDecrement,paclet:re\
f/PreDecrement] is a special case of \
RefLink[SubtractFrom,paclet:ref/SubtractFrom]:"], 
 TapTestSame[k = 1; k -= 1, 0], TapComment["RefLink[Increment,paclet:ref/Incr\
ement] and RefLink[PreIncrement,paclet:ref/PreIncrement] are closely related \
operations:"], TapTestSameBROKEN[{a, b, c, d} = 
   {1, 1, 1, 1} ;; {a++, ++b, c--, --d}, {1, 2, 1, 0}], 
 TapTestSameBROKEN[{a, b, c, d}, {2, 2, 0, 0}], 
 TapComment["A variable to be decremented must have an initial value:"], 
 TapTestSameBROKEN[--x, --x]]
