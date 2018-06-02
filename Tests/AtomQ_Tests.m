(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Test if an expression cannot be subdivided:"], 
 ESameTest[e = x + 22/7, 22/7 + x], ESameTest[AtomQ[e], False], 
 EComment["Since it is not an atom, its parts can be extracted:"], 
 ESameTest[e[[1]], 22/7], EComment["This is a number that is an atom:"], 
 ESameTestBROKEN[AtomQ[%], True], EComment["Strings are not subdividable:"], 
 ESameTest[AtomQ["This is an atom"], True], 
 EComment["Symbols are not subdividable:"], ESameTest[AtomQ[ThisIsAnAtom], 
  True], EComment["Numbers are not subdividable:"], 
 ESameTest[AtomQ[1.23], True], EComment["RefLink[Rational,paclet:ref/Rational\
] numbers appear to have a compound structure:"], 
 ESameTestBROKEN[FullForm[22/7], Rational[22, 7]], 
 EComment["As numbers, they are not subdividable:"], 
 ESameTest[AtomQ[22/7], True], EComment["The parts can be accessed through \
RefLink[Numerator,paclet:ref/Numerator] and \
RefLink[Denominator,paclet:ref/Denominator]:"], 
 ESameTest[{Numerator[22/7], Denominator[22/7]}, {22, 7}], 
 EComment["RefLink[Complex,paclet:ref/Complex] numbers appear to have a \
compound structure:"], ESameTestBROKEN[FullForm[1 + 2*I], Complex[1, 2]], 
 EComment["As numbers, they are not subdividable:"], 
 ESameTest[AtomQ[1 + 2*I], True], EComment["The parts can be accessed through \
RefLink[Re,paclet:ref/Re] and RefLink[Im,paclet:ref/Im]:"], 
 ESameTest[{Re[1 + 2*I], Im[1 + 2*I]}, {1, 2}], 
 EComment["RefLink[SparseArray,paclet:ref/SparseArray] objects are atomic raw \
objects:"], ESameTestBROKEN[HoldComplete[s = SparseArray[{i_, i_} -> i, 3]], 
  $Failed], ESameTest[AtomQ[s], True], EComment["Commands that work with \
RefLink[SparseArray,paclet:ref/SparseArray] objects typically do so on the \
represented array:"], ESameTest[a = Normal[s], 
  {{1, 0, 0}, {0, 2, 0}, {0, 0, 3}}], ESameTest[s[[2,2]], 2], 
 ESameTest[a[[2,2]], 2], EComment["The RefLink[FullForm,paclet:ref/FullForm] \
of a RefLink[SparseArray,paclet:ref/SparseArray] object is designed to be \
sufficient to reconstruct the raw object:"], ESameTestBROKEN[FullForm[s], 
  SparseArray[Automatic, {3, 3}, 0, {1, {{0, 1, 2, 3}, {{1}, {2}, {3}}}, 
    {1, 2, 3}}]], ESameTestBROKEN[HoldComplete[
   s1 = SparseArray[Automatic, {3, 3}, 0, 
     {1, {{0, 1, 2, 3}, {{1}, {2}, {3}}}, {1, 2, 3}}]], $Failed], 
 EComment["A deeply nested expression:"], ESameTest[e = Fold[f, x, Range[5]], 
  f[f[f[f[f[x, 1], 2], 3], 4], 5]], ESameTestBROKEN[leaves[e], 11], 
 EComment["This is equivalent to RefLink[LeafCount,paclet:ref/LeafCount]:"], 
 ESameTest[LeafCount[e], 11], EComment["With the option \
RefLink[Heads,paclet:ref/Heads]->RefLink[False,paclet:ref/False], only atoms \
with no branches are counted:"], ESameTestBROKEN[leaves[e, Heads -> False], 
  6], EComment["This corresponds to the dangling leaves you see with \
RefLink[TreeForm,paclet:ref/TreeForm]:"], 
 ESameTestBROKEN[HoldComplete[TreeForm[e]], $Failed], 
 ESameTestBROKEN[depth[1 + x + 2*x^2], {1, 3}], 
 ESameTestBROKEN[depth[{{1, 2}, {3, 4}}], {2, 2}], 
 EComment["RefLink[Depth,paclet:ref/Depth] gives the maximum depth plus 1:"], 
 ESameTest[Depth[1 + x + 2*x^2], 4], EComment["RefLink[Map,paclet:ref/Map][f,\
expr,{-1}] generally maps f on atoms in expr:"], 
 ESameTest[Map[f, 1 + x + 2*x^2, {-1}], f[1] + f[x] + f[2]*f[x]^f[2]], 
 ESameTest[Map[f, 1 + x + 2*x^2, {-1}], f[1] + f[x] + f[2]*f[x]^f[2]]]
