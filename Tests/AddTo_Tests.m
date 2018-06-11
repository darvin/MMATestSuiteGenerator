(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[6]], 
 TapTestSameBROKEN[k, 6], TapComment["Add to a numerical value:"], 
 TapTestSame[x = 1.5; x += 3.75; x, 5.25], 
 TapComment["Add to a symbolic value:"], TapTestSame[v = a; v += b; v, 
  a + b], TapComment["Add to all values in a list:"], 
 TapTestSame[x = {1, 2, 3}, {1, 2, 3}], TapTestSame[x += 17; x, 
  {18, 19, 20}], TapTestSame[x += {20, 21, 22}; x, {38, 40, 42}], 
 TapComment["Find the first prime above one million:"], 
 TapTestSame[i = 10^6 - 1; While[ !PrimeQ[i], i += 2]; i, 1000003], 
 TapComment[
  "RefLink[AddTo,paclet:ref/AddTo] is a short form of this assignment:"], 
 TapTestSame[k = 1; k = k + 5, 6], TapComment["RefLink[PreIncrement,paclet:re\
f/PreIncrement] is a special case of RefLink[AddTo,paclet:ref/AddTo]:"], 
 TapTestSame[k = 1; k += 1, 2], TapTestSame[++k, 3], 
 TapComment[
  "RefLink[SubtractFrom,paclet:ref/SubtractFrom] is closely related:"], 
 TapTestSame[k = 10; k += -5, 5], TapTestSame[k -= 5, 0], 
 TapComment[
  "A related operation for lists is RefLink[AppendTo,paclet:ref/AppendTo]:"], 
 TapTestSameBROKEN[list = {1, 2, 3} ;; AppendTo[list, 4]; list, 
  {1, 2, 3, 4}], TapComment[
  "A variable to be incremented must have an initial value:"], 
 TapTestSameBROKEN[x += 2, x += 2]]
