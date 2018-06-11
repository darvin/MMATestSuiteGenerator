(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[-4]], 
 TapTestSameBROKEN[k, -4], TapComment["Subtract from a numerical value:"], 
 TapTestSame[x = 1.5; x -= 0.75; x, 0.75], 
 TapComment["Subtract from a symbolic value:"], 
 TapTestSame[v = a; v -= b; v, a - b], 
 TapComment["Subtract from all values in a list:"], 
 TapTestSame[x = {100, 200, 300}, {100, 200, 300}], 
 TapTestSame[x -= 17; x, {83, 183, 283}], TapTestSame[x -= {20, 21, 22}; x, 
  {63, 162, 261}], TapComment["Find the last prime below one million:"], 
 TapTestSame[i = 10^6 + 1; While[ !PrimeQ[i], i -= 2]; i, 999983], 
 TapComment["RefLink[SubtractFrom,paclet:ref/SubtractFrom] is a short form of \
this assignment:"], TapTestSame[k = 1; k = k - 5, -4], 
 TapComment["RefLink[PreDecrement,paclet:ref/PreDecrement] is a special case \
of RefLink[SubtractFrom,paclet:ref/SubtractFrom]:"], 
 TapTestSame[k = 10; k -= 1, 9], TapTestSame[--k, 8], 
 TapComment["RefLink[AddTo,paclet:ref/AddTo] is closely related:"], 
 TapTestSame[k = 10; k -= 5, 5], TapTestSame[k += -5, 0], 
 TapComment["A variable to be decremented must have an initial value:"], 
 TapTestSameBROKEN[x -= 2, x -= 2]]
