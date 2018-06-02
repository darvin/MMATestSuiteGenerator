(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Pad with 0 to make the list be of length 10:"], 
 ESameTest[PadRight[{a, b, c}, 10], {a, b, c, 0, 0, 0, 0, 0, 0, 0}], 
 EComment["Pad with x:"], ESameTest[PadRight[{a, b, c}, 10, x], 
  {a, b, c, x, x, x, x, x, x, x}], EComment["Pad by repeating {x,y,z}:"], 
 ESameTest[PadRight[{a, b, c}, 10, {x, y, z}], {a, b, c, x, y, z, x, y, z, 
   x}], EComment["Leave margin 2 on the left:"], 
 ESameTest[PadRight[{a, b, c}, 10, x, 2], {x, x, a, b, c, x, x, x, x, x}], 
 EComment["Pad to make a 3*4 array:"], 
 ESameTestBROKEN[TableForm[PadRight[{{a, b}, {c}}, {3, 4}]], 
  a*b*0*0*c*0*0*0*0*0*0*0], EComment["Pad to make a full array:"], 
 ESameTestBROKEN[TableForm[PadRight[{{a, b, c}, {d, e}, {f}}]], 
  a*b*c*d*e*0*f*0*0], 
 EComment["Negative length specifications pad on the left:"], 
 ESameTest[PadRight[{a, b, c}, -10], {0, 0, 0, 0, 0, 0, 0, a, b, c}], 
 EComment[
  "Lay down repetitions of the padding, then superimpose the original array:"]\
, ESameTestBROKEN[TableForm[PadRight[{{aa, bb}, {cc}}, {4, 4}, 
    {{x, y}, {z}}]], aa*bb*x*y*cc*z*z*z*x*y*x*y*z*z*z*z], 
 EComment["Use different margins for rows and columns:"], 
 ESameTestBROKEN[TableForm[PadRight[{{aa, bb}, {cc}}, {5, 5}, {{x, y}, {z}}, 
    {1, 2}]], z*z*z*z*z*x*y*aa*bb*x*z*z*cc*z*z*x*y*x*y*x*z*z*z*z*z], 
 EComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 ESameTest[PadRight[f[a, b, c], 8, x], f[a, b, c, x, x, x, x, x]], 
 EComment["Put a 1 at the center of a list of 0s:"], 
 ESameTest[PadRight[{1}, 19, 0, 9], {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
   0, 0, 0, 0, 0, 0}], EComment["Lay out an array of tiles:"], 
 ESameTestBROKEN[HoldComplete[ArrayPlot[PadRight[{{}}, {15, 15}, 
     {{1, 0, 1}, {0, 1, 1}, {1, 0, 0}}], Mesh -> True]], $Failed], 
 EComment["RefLink[PadLeft,paclet:ref/PadLeft][list,n] and \
RefLink[PadRight,paclet:ref/PadRight][list,n] pad to make a list of length \
n:"], ESameTest[PadLeft[{1, 2, 3}, 5], {0, 0, 1, 2, 3}], 
 ESameTest[PadRight[{1, 2, 3}, 5], {1, 2, 3, 0, 0}], 
 EComment["RefLink[ArrayPad,paclet:ref/ArrayPad][list,n] pads with n \
additional elements on each side:"], ESameTest[ArrayPad[{1, 2, 3}, 5], 
  {0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0}], 
 EComment["Pad with an element that is itself a list:"], 
 ESameTest[PadRight[{a, b, c}, 7, {{u, v}}], {a, b, c, {u, v}, {u, v}, 
   {u, v}, {u, v}}], ESameTest[PadRight[{a, b, c}, 7, {u, v}], 
  {a, b, c, v, u, v, u}]]
