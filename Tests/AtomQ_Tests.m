(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test if an expression cannot be subdivided:"], 
 TapTestSame[e = x + 22/7, 22/7 + x], TapTestSame[AtomQ[e], False], 
 TapComment["Since it is not an atom, its parts can be extracted:"], 
 TapTestSame[e[[1]], 22/7], TapComment["This is a number that is an atom:"], 
 TapTestSameBROKEN[AtomQ[%], True], 
 TapComment["Strings are not subdividable:"], 
 TapTestSame[AtomQ["This is an atom"], True], 
 TapComment["Symbols are not subdividable:"], 
 TapTestSame[AtomQ[ThisIsAnAtom], True], 
 TapComment["Numbers are not subdividable:"], TapTestSame[AtomQ[1.23], True], 
 TapComment["RefLink[Rational,paclet:ref/Rational] numbers appear to have a \
compound structure:"], TapTestSameBROKEN[FullForm[22/7], Rational[22, 7]], 
 TapComment["As numbers, they are not subdividable:"], 
 TapTestSame[AtomQ[22/7], True], TapComment["The parts can be accessed \
through RefLink[Numerator,paclet:ref/Numerator] and \
RefLink[Denominator,paclet:ref/Denominator]:"], 
 TapTestSame[{Numerator[22/7], Denominator[22/7]}, {22, 7}], 
 TapComment["RefLink[Complex,paclet:ref/Complex] numbers appear to have a \
compound structure:"], TapTestSameBROKEN[FullForm[1 + 2*I], Complex[1, 2]], 
 TapComment["As numbers, they are not subdividable:"], 
 TapTestSame[AtomQ[1 + 2*I], True], TapComment["The parts can be accessed \
through RefLink[Re,paclet:ref/Re] and RefLink[Im,paclet:ref/Im]:"], 
 TapTestSame[{Re[1 + 2*I], Im[1 + 2*I]}, {1, 2}], 
 TapComment["RefLink[SparseArray,paclet:ref/SparseArray] objects are atomic \
raw objects:"], TapTestSameBROKEN[HoldComplete[
   s = SparseArray[{i_, i_} -> i, 3]], $Failed], TapTestSame[AtomQ[s], True], 
 TapComment["Commands that work with \
RefLink[SparseArray,paclet:ref/SparseArray] objects typically do so on the \
represented array:"], TapTestSame[a = Normal[s], 
  {{1, 0, 0}, {0, 2, 0}, {0, 0, 3}}], TapTestSame[s[[2,2]], 2], 
 TapTestSame[a[[2,2]], 2], TapComment["The \
RefLink[FullForm,paclet:ref/FullForm] of a \
RefLink[SparseArray,paclet:ref/SparseArray] object is designed to be \
sufficient to reconstruct the raw object:"], TapTestSameBROKEN[FullForm[s], 
  SparseArray[Automatic, {3, 3}, 0, {1, {{0, 1, 2, 3}, {{1}, {2}, {3}}}, 
    {1, 2, 3}}]], TapTestSameBROKEN[HoldComplete[
   s1 = SparseArray[Automatic, {3, 3}, 0, 
     {1, {{0, 1, 2, 3}, {{1}, {2}, {3}}}, {1, 2, 3}}]], $Failed], 
 TapComment["A deeply nested expression:"], 
 TapTestSame[e = Fold[f, x, Range[5]], f[f[f[f[f[x, 1], 2], 3], 4], 5]], 
 TapTestSameBROKEN[leaves[e], 11], 
 TapComment[
  "This is equivalent to RefLink[LeafCount,paclet:ref/LeafCount]:"], 
 TapTestSame[LeafCount[e], 11], TapComment["With the option \
RefLink[Heads,paclet:ref/Heads]->RefLink[False,paclet:ref/False], only atoms \
with no branches are counted:"], TapTestSameBROKEN[leaves[e, Heads -> False], 
  6], TapComment["This corresponds to the dangling leaves you see with \
RefLink[TreeForm,paclet:ref/TreeForm]:"], 
 TapTestSameBROKEN[HoldComplete[TreeForm[e]], $Failed], 
 TapComment["Find the minimum and maximum \"depth\" of an expression:"], 
 TapTestSame[depth[expr_] := Block[{mind = Infinity, maxd = 0, burrow, d}, 
     burrow[(e_)?AtomQ, d_] := (mind = Min[d, mind]; maxd = Max[d, maxd]); 
      burrow[e_, d_] := Scan[burrow[#1, d + 1] & , e]; burrow[expr, 0]; 
      {mind, maxd}]; depth[1 + x + 2*x^2], {1, 3}], 
 TapTestSame[depth[{{1, 2}, {3, 4}}], {2, 2}], 
 TapComment[
  "RefLink[Depth,paclet:ref/Depth] gives the maximum depth plus 1:"], 
 TapTestSame[Depth[1 + x + 2*x^2], 4], TapComment["RefLink[Map,paclet:ref/Map\
][f,expr,{-1}] generally maps f on atoms in expr:"], 
 TapTestSame[Map[f, 1 + x + 2*x^2, {-1}], f[1] + f[x] + f[2]*f[x]^f[2]], 
 TapComment["This is equivalent to the following recursive function:"], 
 TapTestSame[mapf[(e_)?AtomQ] := f[e]; mapf[(head_)[args___]] := 
    head @@ Table[mapf[arg], {arg, {args}}]; Map[f, 1 + x + 2*x^2, {-1}], 
  f[1] + f[x] + f[2]*f[x]^f[2]]]
