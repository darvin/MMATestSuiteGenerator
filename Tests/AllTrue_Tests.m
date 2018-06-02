(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Test if all elements of a list satisfy a condition: "], 
 ESameTestBROKEN[AllTrue[{2, 3, 4, 6, 8}, EvenQ], False], 
 ESameTestBROKEN[AllTrue[{2, 4, 6, 8}, EvenQ], True], 
 EComment["Test if all values of an association satisfy a condition: "], 
 ESameTestBROKEN[AllTrue[\[LeftAssociation] "a" -> 1, "b" -> 3, 
    "c" -> 5 \[RightAssociation], OddQ], True], 
 EComment["If the condition applied to no element produces \
RefLink[False,paclet:ref/False], a symbolic result may be returned:"], 
 ESameTestBROKEN[AllTrue[{2, 6, x, 4, y}, #1 < 10 & ], x < 10 && y < 10], 
 ESameTestBROKEN[% /. {x -> 3, y -> 7}, True], 
 EComment["Even when the condition applied to some elements is symbolic, a \
definitive result may be deduced: "], ESameTestBROKEN[
  AllTrue[{2, 6, x, 4, y, 15}, #1 < 10 & ], False], 
 EComment["RefLink[TrueQ,paclet:ref/TrueQ] may be used to avoid getting a \
symbolic result:"], ESameTestBROKEN[AllTrue[{2, 6, x, 4, y}, 
   TrueQ[#1 < 10] & ], False], EComment["RefLink[AllTrue,paclet:ref/AllTrue] \
may be applied to expressions with any head:"], 
 ESameTestBROKEN[AllTrue[f[1, 7, 3], OddQ], True], 
 ESameTestBROKEN[AllTrue[f[x, y, z], #1 < 10 & ], 
  x < 10 && y < 10 && z < 10], 
 EComment["RefLink[AllTrue,paclet:ref/AllTrue] always operates at level 1:"], 
 ESameTestBROKEN[AllTrue[3, EvenQ], True], 
 ESameTestBROKEN[AllTrue[{}, EvenQ], True], EComment["Compose the predicate \
with RefLink[TrueQ,paclet:ref/TrueQ] to make the predicate stronger:"], 
 ESameTestBROKEN[AllTrue[{x, y, z}, Composition[TrueQ, f]], False], 
 EComment["RefLink[AllTrue,paclet:ref/AllTrue][list,f] is equivalent to \
RefLink[NoneTrue,paclet:ref/NoneTrue][list,RefLink[Composition,paclet:ref/Com\
position][RefLink[Not,paclet:ref/Not],f]]:"], 
 ESameTestBROKEN[LogicalExpand /@ {AllTrue[{x, y, z}, f], 
    NoneTrue[{x, y, z},  !f[#1] & ]}, {f[x] && f[y] && f[z], 
   f[x] && f[y] && f[z]}], EComment["RefLink[AllTrue,paclet:ref/AllTrue][list\
,f] is equivalent to RefLink[VectorQ,paclet:ref/VectorQ][list,f] when f \
evaluates to RefLink[True,paclet:ref/True] or \
RefLink[False,paclet:ref/False]:"], ESameTestBROKEN[
  AllTrue[Range[10], IntegerQ]*VectorQ[Range[10], IntegerQ], True], 
 ESameTestBROKEN[AllTrue[{x, y, z}, #1 < 10 & ]*
   VectorQ[{x, y, z}, #1 < 10 & ], x < 10 && y < 10 && z < 10], 
 EComment["RefLink[AllTrue,paclet:ref/AllTrue][list,f] works efficiently on \
sparse vectors:"], ESameTestBROKEN[AllTrue[SparseArray[{1000 -> 2}, 
    {1000000000000}], EvenQ], True], 
 EComment["A symbolic result may be returned:"], 
 ESameTestBROKEN[AllTrue[{x, y, z}, f], f[x] && f[y] && f[z]]]
