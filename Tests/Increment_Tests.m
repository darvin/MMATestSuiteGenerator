(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Increment the value by one, and return the old value:"], 
 TapTestSame[k = 1; k++, 1], TapTestSame[k, 2], 
 TapComment["Increment a numerical value:"], TapTestSame[x = 1.5; x++; x, 
  2.5], TapComment["Increment a symbolic value:"], 
 TapTestSame[v = a; v++; v, 1 + a], 
 TapComment["Increment all values in a list:"], 
 TapTestSame[x = {1, 2, 3}, {1, 2, 3}], TapTestSame[x++; x, {2, 3, 4}], 
 TapComment["Find the first integer with a certain property:"], 
 TapTestSame[i = 1; While[Prime[i] < 10^6, i++]; i, 78499], 
 TapComment["RefLink[Increment,paclet:ref/Increment] and \
RefLink[PreIncrement,paclet:ref/PreIncrement] differ only in the return value \
of the operation:"], TapTestSameBROKEN[{a, b} = {1, 1} ;; {a++, ++b}, 
  {1, 2}], TapTestSameBROKEN[{a, b}, {2, 2}], TapComment["RefLink[Increment,p\
aclet:ref/Increment] is a short form of this assignment:"], 
 TapTestSame[k = 1; k = k + 1, 2], TapComment["RefLink[Increment,paclet:ref/I\
ncrement] is a special case of RefLink[AddTo,paclet:ref/AddTo]:"], 
 TapTestSame[k = 1; k += 1, 2], TapComment["RefLink[Decrement,paclet:ref/Decr\
ement] and RefLink[PreDecrement,paclet:ref/PreDecrement] are closely related \
operations:"], TapTestSameBROKEN[{a, b, c, d} = 
   {1, 1, 1, 1} ;; {a++, ++b, c--, --d}, {1, 2, 1, 0}], 
 TapTestSameBROKEN[{a, b, c, d}, {2, 2, 0, 0}], 
 TapComment["A variable to be incremented must have an initial value:"], 
 TapTestSameBROKEN[x++, x++]]
