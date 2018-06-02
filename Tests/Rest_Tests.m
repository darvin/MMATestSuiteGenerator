(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Rest[{a, b, c, d}], {b, c, d}], 
 ESameTest[Rest[\[LeftAssociation] 1 :> a, 2 -> b, 
    3 :> c \[RightAssociation]], \[LeftAssociation] 2 -> b, 
   3 :> c \[RightAssociation]], 
 EComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 ESameTest[Rest[a + b + c + d], b + c + d], ESameTest[Rest[f[a, b, c, d]], 
  f[b, c, d]], EComment["RefLink[Rest,paclet:ref/Rest] works on \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 ESameTestBROKEN[HoldComplete[Rest[SparseArray[Range[100]]]], $Failed], 
 EComment["Nest the operation of finding the rest of a list:"], 
 ESameTest[NestList[Rest, {a, b, c, d, e}, 3], 
  {{a, b, c, d, e}, {b, c, d, e}, {c, d, e}, {d, e}}], 
 EComment["RefLink[Rest,paclet:ref/Rest][expr] is equivalent to \
RefLink[Drop,paclet:ref/Drop][expr,1]. "], ESameTest[Rest[{a, b, c, d}], 
  {b, c, d}], ESameTest[Drop[{a, b, c, d}, 1], {b, c, d}], 
 EComment["The expression is evaluated before RefLink[Rest,paclet:ref/Rest] \
is applied:"], ESameTest[Rest[c + a + b], b + c], 
 EComment["RefLink[Rest,paclet:ref/Rest] always operates on the \
RefLink[FullForm,paclet:ref/FullForm] of expressions:"], 
 ESameTest[Rest[1/b], -1], ESameTestBROKEN[FullForm[1/b], b^(-1)]]
