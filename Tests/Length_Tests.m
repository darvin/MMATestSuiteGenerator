(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the length of a list:"], 
 TapTestSame[Length[{a, b, c, d}], 4], 
 TapComment[
  "Find the length of an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Length[\[LeftAssociation]  \[RightAssociation]], 0], 
 TapTestSame[Length[\[LeftAssociation] 1 -> 2, 3 -> 4 \[RightAssociation]], 
  2], TapComment["RefLink[Length,paclet:ref/Length] works with any head:"], 
 TapTestSame[Length[a + b + c + d], 4], TapComment["RefLink[Length,paclet:ref\
/Length][expr] gives the number of elements in the top level of expr:"], 
 TapTestSame[Length[f[g[x, y], z]], 2], 
 TapComment["The length of a symbol is 0:"], TapTestSame[Length[x], 0], 
 TapComment["The length of a string is 0:"], TapTestSame[Length["string"], 
  0], TapComment["RefLink[StringLength,paclet:ref/StringLength] gives the \
number of characters:"], TapTestSame[StringLength["string"], 6], 
 TapComment["Explicit numbers have length 0:"], 
 TapTestSame[Length[123456], 0], TapTestSame[Length[1/10], 0], 
 TapTestSame[Length[3 + I], 0], TapComment["RefLink[Length,paclet:ref/Length] \
works on RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSameBROKEN[HoldComplete[SparseArray[{a, b, c, d, e}]], $Failed], 
 TapTestSameBROKEN[Length[%], 5], 
 TapComment["Find the number of rows in a matrix:"], 
 TapTestSame[Length[{{a, b, c}, {d, e, f}}], 2], 
 TapComment["Find the length of each sublist:"], 
 TapTestSame[Length /@ {{a, b}, {a, b, c}, {x}}, {2, 3, 1}], 
 TapComment["Find the number of terms in a polynomial:"], 
 TapTestSame[Length[1 + x + x^2 + x^9], 4], 
 TapComment["Find the number of digits in 1000!:"], 
 TapTestSame[Length[IntegerDigits[1000!]], 2568], 
 TapComment["Get the number of points used to plot a curve:"], 
 TapTestSameBROKEN[HoldComplete[p = Plot[Sin[x], {x, 0, 20}]], $Failed], 
 TapTestSameBROKEN[Total[Cases[p, x_Line :> Length[x[[1]]], Infinity]], 926], 
 TapComment["RefLink[Length,paclet:ref/Length] gives the maximum index that \
can be used:"], TapTestSame[Length[{a, b, c, d}], 4], 
 TapTestSame[{a, b, c, d}[[4]], d], TapComment["RefLink[Length,paclet:ref/Len\
gth] operates on the RefLink[FullForm,paclet:ref/FullForm] of expressions, \
not their displayed form:"], TapTestSame[Sqrt[x], Sqrt[x]], 
 TapTestSameBROKEN[Length[%], 2], TapTestSameBROKEN[FullForm[Sqrt[x]], 
  Sqrt[x]], TapComment[
  "Rational and complex numbers are atoms, so they have length 0:"], 
 TapTestSame[Length[1/3], 0], TapTestSameBROKEN[FullForm[1/3], 
  Rational[1, 3]], TapTestSame[Length[2 + I], 0], 
 TapTestSameBROKEN[FullForm[2 + I], Complex[2, 1]], 
 TapComment["Numeric expressions are treated like other expressions, not like \
explicit numbers:"], TapTestSame[Length[Sqrt[7]], 2], 
 TapTestSame[Length[7], 0], TapComment["RefLink[Length,paclet:ref/Length] \
counts only \"arguments\", not parts of heads:"], 
 TapTestSame[Length[h[a, b][x, y, z]], 3], 
 TapTestSameBROKEN[HoldComplete[TableForm[Table[{e, Length[e], Dimensions[e], 
      If[Dimensions[e] === {}, 0, First[Dimensions[e]]]}, {e, exprs}], 
    TableDepth -> 2, TableHeadings -> {{}, {"e", "Length[e]", 
       "Dimensions[e]", "\"First\" dimension"}}]], $Failed]]
