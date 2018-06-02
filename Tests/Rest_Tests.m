(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[Rest[{a, b, c, d}], {b, c, d}], 
 TapTestSame[Rest[\[LeftAssociation] 1 :> a, 2 -> b, 
    3 :> c \[RightAssociation]], \[LeftAssociation] 2 -> b, 
   3 :> c \[RightAssociation]], 
 TapComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Rest[a + b + c + d], b + c + d], 
 TapTestSame[Rest[f[a, b, c, d]], f[b, c, d]], 
 TapComment["RefLink[Rest,paclet:ref/Rest] works on \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSameBROKEN[HoldComplete[Rest[SparseArray[Range[100]]]], $Failed], 
 TapComment["Nest the operation of finding the rest of a list:"], 
 TapTestSame[NestList[Rest, {a, b, c, d, e}, 3], 
  {{a, b, c, d, e}, {b, c, d, e}, {c, d, e}, {d, e}}], 
 TapComment["RefLink[Rest,paclet:ref/Rest][expr] is equivalent to \
RefLink[Drop,paclet:ref/Drop][expr,1]. "], TapTestSame[Rest[{a, b, c, d}], 
  {b, c, d}], TapTestSame[Drop[{a, b, c, d}, 1], {b, c, d}], 
 TapComment["The expression is evaluated before RefLink[Rest,paclet:ref/Rest] \
is applied:"], TapTestSame[Rest[c + a + b], b + c], 
 TapComment["RefLink[Rest,paclet:ref/Rest] always operates on the \
RefLink[FullForm,paclet:ref/FullForm] of expressions:"], 
 TapTestSame[Rest[1/b], -1], TapTestSameBROKEN[FullForm[1/b], b^(-1)]]
