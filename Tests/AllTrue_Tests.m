(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test if all elements of a list satisfy a condition: "], 
 TapTestSameBROKEN[AllTrue[{2, 3, 4, 6, 8}, EvenQ], False], 
 TapTestSameBROKEN[AllTrue[{2, 4, 6, 8}, EvenQ], True], 
 TapComment["Test if all values of an association satisfy a condition: "], 
 TapTestSameBROKEN[AllTrue[\[LeftAssociation] "a" -> 1, "b" -> 3, 
    "c" -> 5 \[RightAssociation], OddQ], True], 
 TapComment["If the condition applied to no element produces \
RefLink[False,paclet:ref/False], a symbolic result may be returned:"], 
 TapTestSameBROKEN[AllTrue[{2, 6, x, 4, y}, #1 < 10 & ], x < 10 && y < 10], 
 TapTestSameBROKEN[% /. {x -> 3, y -> 7}, True], 
 TapComment["Even when the condition applied to some elements is symbolic, a \
definitive result may be deduced: "], TapTestSameBROKEN[
  AllTrue[{2, 6, x, 4, y, 15}, #1 < 10 & ], False], 
 TapComment["RefLink[TrueQ,paclet:ref/TrueQ] may be used to avoid getting a \
symbolic result:"], TapTestSameBROKEN[AllTrue[{2, 6, x, 4, y}, 
   TrueQ[#1 < 10] & ], False], TapComment["RefLink[AllTrue,paclet:ref/AllTrue\
] may be applied to expressions with any head:"], 
 TapTestSameBROKEN[AllTrue[f[1, 7, 3], OddQ], True], 
 TapTestSameBROKEN[AllTrue[f[x, y, z], #1 < 10 & ], 
  x < 10 && y < 10 && z < 10], 
 TapComment[
  "RefLink[AllTrue,paclet:ref/AllTrue] always operates at level 1:"], 
 TapTestSameBROKEN[AllTrue[3, EvenQ], True], 
 TapTestSameBROKEN[AllTrue[{}, EvenQ], True], 
 TapComment["Compose the predicate with RefLink[TrueQ,paclet:ref/TrueQ] to \
make the predicate stronger:"], TapTestSameBROKEN[
  AllTrue[{x, y, z}, Composition[TrueQ, f]], False], 
 TapComment["RefLink[AllTrue,paclet:ref/AllTrue][list,f] is equivalent to \
RefLink[NoneTrue,paclet:ref/NoneTrue][list,RefLink[Composition,paclet:ref/Com\
position][RefLink[Not,paclet:ref/Not],f]]:"], 
 TapTestSameBROKEN[LogicalExpand /@ {AllTrue[{x, y, z}, f], 
    NoneTrue[{x, y, z},  !f[#1] & ]}, {f[x] && f[y] && f[z], 
   f[x] && f[y] && f[z]}], TapComment["RefLink[AllTrue,paclet:ref/AllTrue][li\
st,f] is equivalent to RefLink[VectorQ,paclet:ref/VectorQ][list,f] when f \
evaluates to RefLink[True,paclet:ref/True] or \
RefLink[False,paclet:ref/False]:"], 
 TapTestSame[AllTrue[Range[10], IntegerQ]*VectorQ[Range[10], IntegerQ], 
  True], TapTestSameBROKEN[AllTrue[{x, y, z}, #1 < 10 & ]*
   VectorQ[{x, y, z}, #1 < 10 & ], x < 10 && y < 10 && z < 10], 
 TapComment["RefLink[AllTrue,paclet:ref/AllTrue][list,f] works efficiently on \
sparse vectors:"], TapTestSameBROKEN[
  AllTrue[SparseArray[{1000 -> 2}, {1000000000000}], EvenQ], True], 
 TapComment["A symbolic result may be returned:"], 
 TapTestSameBROKEN[AllTrue[{x, y, z}, f], f[x] && f[y] && f[z]]]
