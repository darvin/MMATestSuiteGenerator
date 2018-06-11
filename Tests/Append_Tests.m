(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{a, b, c, d, x}]], 
 TapComment["Append to an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Append[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   3 -> d], \[LeftAssociation] 1 -> a, 2 -> b, 3 -> d \[RightAssociation]], 
 TapComment[
  "Append several rules to an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Append[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   {3 -> d, 4 -> e}], \[LeftAssociation] 1 -> a, 2 -> b, 3 -> d, 
   4 -> e \[RightAssociation]], 
 TapComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Append[f[a, b, c], x + y], f[a, b, c, x + y]], 
 TapComment["Append a row to a matrix:"], 
 TapTestSameBROKEN[MatrixForm[Append[{{a, b}, {c, d}}, {x, y}]], 
  a*b*c*d*x*y], TapComment["Append to each row in a matrix:"], 
 TapTestSameBROKEN[MatrixForm[(Append[#1, x] & ) /@ {{a, b}, {c, d}}], 
  a*b*x*c*d*x], TapComment["Append a vector to a matrix:"], 
 TapTestSameBROKEN[MatrixForm[MapThread[Append, {{{a, b}, {c, d}}, {x, y}}]], 
  a*b*x*c*d*y], TapComment["Successively append to a list:"], 
 TapTestSame[NestList[Append[#1, x] & , {a}, 5], 
  {{a}, {a, x}, {a, x, x}, {a, x, x, x}, {a, x, x, x, x}, 
   {a, x, x, x, x, x}}], TapTestSame[Append[{a, b, c}, {x, y}], 
  {a, b, c, {x, y}}], TapTestSameBROKEN[Flatten[%], {a, b, c, x, y}]]
