(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Pad with 0 to make the list be of length 10:"], 
 TapTestSame[PadRight[{a, b, c}, 10], {a, b, c, 0, 0, 0, 0, 0, 0, 0}], 
 TapComment["Pad with x:"], TapTestSame[PadRight[{a, b, c}, 10, x], 
  {a, b, c, x, x, x, x, x, x, x}], TapComment["Pad by repeating {x,y,z}:"], 
 TapTestSame[PadRight[{a, b, c}, 10, {x, y, z}], 
  {a, b, c, x, y, z, x, y, z, x}], TapComment["Leave margin 2 on the left:"], 
 TapTestSame[PadRight[{a, b, c}, 10, x, 2], {x, x, a, b, c, x, x, x, x, x}], 
 TapComment["Pad to make a 3*4 array:"], TapTestSameBROKEN[
  TableForm[PadRight[{{a, b}, {c}}, {3, 4}]], a*b*0*0*c*0*0*0*0*0*0*0], 
 TapComment["Pad to make a full array:"], 
 TapTestSameBROKEN[TableForm[PadRight[{{a, b, c}, {d, e}, {f}}]], 
  a*b*c*d*e*0*f*0*0], TapComment[
  "Negative length specifications pad on the left:"], 
 TapTestSame[PadRight[{a, b, c}, -10], {0, 0, 0, 0, 0, 0, 0, a, b, c}], 
 TapComment[
  "Lay down repetitions of the padding, then superimpose the original array:"]\
, TapTestSameBROKEN[TableForm[PadRight[{{aa, bb}, {cc}}, {4, 4}, 
    {{x, y}, {z}}]], aa*bb*x*y*cc*z*z*z*x*y*x*y*z*z*z*z], 
 TapComment["Use different margins for rows and columns:"], 
 TapTestSameBROKEN[TableForm[PadRight[{{aa, bb}, {cc}}, {5, 5}, 
    {{x, y}, {z}}, {1, 2}]], z*z*z*z*z*x*y*aa*bb*x*z*z*cc*z*z*x*y*x*y*x*z*z*z*
   z*z], TapComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 TapTestSame[PadRight[f[a, b, c], 8, x], f[a, b, c, x, x, x, x, x]], 
 TapComment["Put a 1 at the center of a list of 0s:"], 
 TapTestSame[PadRight[{1}, 19, 0, 9], {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
   0, 0, 0, 0, 0, 0}], TapComment["Lay out an array of tiles:"], 
 TapTestSame[HoldComplete[ArrayPlot[PadRight[{{}}, {15, 15}, 
     {{1, 0, 1}, {0, 1, 1}, {1, 0, 0}}], Mesh -> True]], $Failed], 
 TapComment["RefLink[PadLeft,paclet:ref/PadLeft][list,n] and \
RefLink[PadRight,paclet:ref/PadRight][list,n] pad to make a list of length \
n:"], TapTestSame[PadLeft[{1, 2, 3}, 5], {0, 0, 1, 2, 3}], 
 TapTestSame[PadRight[{1, 2, 3}, 5], {1, 2, 3, 0, 0}], 
 TapComment["RefLink[ArrayPad,paclet:ref/ArrayPad][list,n] pads with n \
additional elements on each side:"], TapTestSame[ArrayPad[{1, 2, 3}, 5], 
  {0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0}], 
 TapComment["Pad with an element that is itself a list:"], 
 TapTestSame[PadRight[{a, b, c}, 7, {{u, v}}], {a, b, c, {u, v}, {u, v}, 
   {u, v}, {u, v}}], TapTestSame[PadRight[{a, b, c}, 7, {u, v}], 
  {a, b, c, v, u, v, u}]]
