(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Pad with 0 to make the list be of length 10:"], 
 TapTestSame[PadLeft[{a, b, c}, 10], {0, 0, 0, 0, 0, 0, 0, a, b, c}], 
 TapComment["Pad with x:"], TapTestSame[PadLeft[{a, b, c}, 10, x], 
  {x, x, x, x, x, x, x, a, b, c}], TapComment["Pad by repeating {x,y,z}:"], 
 TapTestSame[PadLeft[{a, b, c}, 10, {x, y, z}], 
  {z, x, y, z, x, y, z, a, b, c}], 
 TapComment["Leave margin 2 on the right:"], 
 TapTestSame[PadLeft[{a, b, c}, 10, x, 2], {x, x, x, x, x, a, b, c, x, x}], 
 TapComment["Pad to make a 3*5 array:"], TapTestSameBROKEN[
  TableForm[PadLeft[{{a, b}, {c}}, {3, 5}]], 0*0*0*0*0*0*0*0*a*b*0*0*0*0*c], 
 TapComment["Pad to make a full array:"], 
 TapTestSameBROKEN[TableForm[PadLeft[{{a, b, c}, {d, e}, {f}}]], 
  a*b*c*0*d*e*0*0*f], TapComment[
  "Negative length specifications pad on the right:"], 
 TapTestSame[PadLeft[{a, b, c}, -10], {a, b, c, 0, 0, 0, 0, 0, 0, 0}], 
 TapComment[
  "Lay down repetitions of the padding, then superimpose the original array:"]\
, TapTestSameBROKEN[TableForm[PadLeft[{{aa, bb}, {cc}}, {4, 4}, 
    {{x, y}, {z}}]], x*y*x*y*z*z*z*z*x*y*aa*bb*z*z*z*cc], 
 TapComment["Use different margins for rows and columns:"], 
 TapTestSameBROKEN[TableForm[PadLeft[{{aa, bb}, {cc}}, {5, 5}, {{x, y}, {z}}, 
    {1, 2}]], y*x*y*x*y*z*z*z*z*z*y*aa*bb*x*y*z*z*cc*z*z*y*x*y*x*y], 
 TapComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 TapTestSame[PadLeft[f[a, b, c], 8, x], f[x, x, x, x, x, a, b, c]], 
 TapComment["Put a 1 at the center of a list of 0s:"], 
 TapTestSame[PadLeft[{1}, 19, 0, 9], {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
   0, 0, 0, 0, 0, 0}], TapComment["Pad digit lists to be the same length:"], 
 TapTestSame[PadLeft[Table[IntegerDigits[i^2, 2], {i, 5}]], 
  {{0, 0, 0, 0, 1}, {0, 0, 1, 0, 0}, {0, 1, 0, 0, 1}, {1, 0, 0, 0, 0}, 
   {1, 1, 0, 0, 1}}], TapComment["Lay out an array of tiles:"], 
 TapTestSameBROKEN[HoldComplete[ArrayPlot[PadLeft[{{}}, {15, 15}, 
     {{1, 0, 1}, {0, 1, 1}, {1, 0, 0}}], Mesh -> True]], $Failed], 
 TapComment["RefLink[PadLeft,paclet:ref/PadLeft][list,n] and \
RefLink[PadRight,paclet:ref/PadRight][list,n] pad to make a list of length \
n:"], TapTestSame[PadLeft[{1, 2, 3}, 5], {0, 0, 1, 2, 3}], 
 TapTestSame[PadRight[{1, 2, 3}, 5], {1, 2, 3, 0, 0}], 
 TapComment["RefLink[ArrayPad,paclet:ref/ArrayPad][list,n] pads with n \
additional elements on each side:"], TapTestSame[ArrayPad[{1, 2, 3}, 5], 
  {0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0}], 
 TapComment["Pad with an element that is itself a list:"], 
 TapTestSame[PadLeft[{a, b, c}, 7, {{u, v}}], {{u, v}, {u, v}, {u, v}, 
   {u, v}, a, b, c}], TapTestSame[PadLeft[{a, b, c}, 7, {u, v}], 
  {v, u, v, u, a, b, c}]]
