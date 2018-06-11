(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{x, a, b, c, d}]], 
 TapComment["Prepend to an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSame[Prepend[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   3 -> d], \[LeftAssociation] 3 -> d, 1 -> a, 2 -> b \[RightAssociation]], 
 TapComment[
  "Prepend several rules to an RefLink[Association,paclet:ref/Association]:"]\
, TapTestSame[Prepend[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   {3 -> d, 4 -> e}], \[LeftAssociation] 4 -> e, 3 -> d, 1 -> a, 
   2 -> b \[RightAssociation]], 
 TapComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Prepend[f[a, b, c], x + y], f[x + y, a, b, c]], 
 TapComment["Prepend a row to a matrix:"], 
 TapTestSameBROKEN[MatrixForm[Prepend[{{a, b}, {c, d}}, {x, y}]], 
  x*y*a*b*c*d], TapComment["Prepend to each row in a matrix:"], 
 TapTestSameBROKEN[MatrixForm[(Prepend[#1, x] & ) /@ {{a, b}, {c, d}}], 
  x*a*b*x*c*d], TapComment["Prepend a vector to a matrix:"], 
 TapTestSameBROKEN[MatrixForm[MapThread[Prepend, 
    {{{a, b}, {c, d}}, {x, y}}]], x*a*b*y*c*d], 
 TapComment["Successively prepend to a list:"], 
 TapTestSame[NestList[Prepend[#1, x] & , {a}, 5], 
  {{a}, {x, a}, {x, x, a}, {x, x, x, a}, {x, x, x, x, a}, 
   {x, x, x, x, x, a}}], TapTestSame[Prepend[{a, b, c}, {x, y}], 
  {{x, y}, a, b, c}], TapTestSameBROKEN[Flatten[%], {x, y, a, b, c}]]
