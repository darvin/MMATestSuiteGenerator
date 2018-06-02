(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Pick out a part of a list:"], 
 TapTestSame[{a, b, c, d, e, f}[[3]], c], 
 TapComment["Pick out a sequence of parts:"], 
 TapTestSame[{a, b, c, d, e, f}[[2 ;; 4]], {b, c, d}], 
 TapComment["Pick out a part of a matrix:"], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[2,3]], f], 
 TapComment["The second row of a matrix:"], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[2]], {d, e, f}], 
 TapComment["The second column of a matrix:"], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[All,2]], {b, e, h}], 
 TapComment["An element 2 from the end of a list:"], 
 TapTestSame[{a, b, c, d, e, f}[[-2]], e], TapComment["A list of parts:"], 
 TapTestSame[{a, b, c, d, e, f}[[{1, 3, 1, 2, -1, -1}]], {a, c, a, b, f, f}], 
 TapComment["A part of an RefLink[Association,paclet:ref/Association] \
corresponding to key \"a\":"], 
 TapTestSame[\[LeftAssociation] "a" -> 5, "b" -> 6 \[RightAssociation][[
   "a"]], 5], TapComment[
  "The first part of an RefLink[Association,paclet:ref/Association]: "], 
 TapTestSame[\[LeftAssociation] 2 -> b, 1 -> a \[RightAssociation][[1]], b], 
 TapComment["The part associated with the key 1:"], 
 TapTestSame[\[LeftAssociation] 2 -> b, 1 -> a \[RightAssociation][[Key[1]]], 
  a], TapComment[
  "Take several parts in an RefLink[Association,paclet:ref/Association]:"], 
 TapTestSameBROKEN[HoldComplete[\[LeftAssociation] "a" -> 1, "b" -> 2, 
     "c" -> 3, "d" -> 4 \[RightAssociation][[1 ;; 2]]], $Failed], 
 TapComment["Extract parts by keys:"], TapTestSameBROKEN[
  HoldComplete[\[LeftAssociation] "a" -> 1, "b" -> 2, 
     "c" -> 3 \[RightAssociation][[{Key["a"], Key["c"]}]]], $Failed], 
 TapComment["Extract subexpressions from an \
RefLink[Association,paclet:ref/Association]:"], 
 TapTestSameBROKEN[HoldComplete[
   \[LeftAssociation] "a" -> \[LeftAssociation] 
       1 -> "a1" \[RightAssociation], "b" -> \[LeftAssociation] 
       1 -> "b1" \[RightAssociation] \[RightAssociation][[All,Key[1]]]], 
  $Failed], TapComment["Reassign a part:"], TapTestSame[m = {{a, b}, {c, d}}, 
  {{a, b}, {c, d}}], TapTestSame[m[[2,2]] = x, x], 
 TapTestSame[m, {{a, b}, {c, x}}], 
 TapComment["Reassign a sequence of parts:"], 
 TapTestSame[v = {a, b, c, d, e, f}, {a, b, c, d, e, f}], 
 TapTestSame[v[[2 ;; 4]] = x, x], TapTestSame[v, {a, x, x, x, e, f}], 
 TapComment["RefLink[Part,paclet:ref/Part] works with expressions of any \
kind, not just lists:"], TapTestSame[f[g[a, b], g[c, d]][[2,1]], c], 
 TapTestSame[(1 + 2*x^2 + y^2)[[2]], 2*x^2], 
 TapTestSame[{x -> 4, y -> 5}[[1,2]], 4], TapComment["RefLink[Part,paclet:ref\
/Part] always operates on the RefLink[FullForm,paclet:ref/FullForm] of \
expressions:"], TapTestSame[(x/y)[[2]], 1/y], 
 TapTestSameBROKEN[FullForm[x/y], x/y], TapComment["Equivalent forms:"], 
 TapTestSame[{{a, b, c}, {d, e, f}}[[1]][[2]], b], 
 TapTestSame[{{a, b, c}, {d, e, f}}[[1,2]], b], 
 TapComment["Pick out parts 1 and 3:"], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[{1, 3}]], 
  {{a, b, c}, {g, h, i}}], 
 TapComment["Pick out parts 2 and 3 of parts 1 and 3:"], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[{1, 3},{2, 3}]], 
  {{b, c}, {h, i}}], TapComment["Parts 1 through third-to-last:"], 
 TapTestSame[{a, b, c, d, e, f}[[1 ;; -3]], {a, b, c, d}], 
 TapComment["Shorter notation:"], TapTestSame[{a, b, c, d, e, f}[[1 ;; -3]], 
  {a, b, c, d}], TapComment[
  "Parts 3 through third-to-last extracted in steps of 2:"], 
 TapTestSame[{a, b, c, d, e, f, g, h, i, j, k}[[3 ;; -3 ;; 2]], 
  {c, e, g, i}], TapComment[
  "Parts extracted in steps of 2 starting at the beginning:"], 
 TapTestSame[{a, b, c, d, e, f, g, h, i, j, k}[[1 ;; All ;; 2]], 
  {a, c, e, g, i, k}], TapComment[
  "Enter in RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSame[{a, b, c, d, e}[[3]], c], TapComment["Enter using \
Esc\\[ThinSpace][[\\[ThinSpace]Esc and Esc\\[ThinSpace]]]\\[ThinSpace]Esc:"], 
 TapTestSame[{a, b, c, d, e}[[3]], c], TapComment["Enter as a subscript:"], 
 TapTestSameBROKEN[$Failed, HoldComplete[c]], 
 TapComment["Assign several parts at once:"], TapTestSame[m = {a, b, c, d}, 
  {a, b, c, d}], TapComment["Assign parts 2 and 3 to be x:"], 
 TapTestSame[m[[{2, 3}]] = x, x], TapTestSame[m, {a, x, x, d}], 
 TapComment["Assign different values to parts 1, 3, and 4:"], 
 TapTestSame[m[[{1, 3, 4}]] = {s, t, u}, {s, t, u}], 
 TapTestSame[m, {s, x, t, u}], TapTestSameBROKEN[m[[2]] += x, b + x], 
 TapTestSameBROKEN[m, {a, b + x, c, d}], TapTestSameBROKEN[
  m[[{1, 2}]] = m[[{3, 1}]], {c, a}], TapTestSameBROKEN[m, {c, a, c, d}], 
 TapComment["For RefLink[SparseArray,paclet:ref/SparseArray] objects, \
RefLink[Part,paclet:ref/Part] gives the parts in the corresponding ordinary \
array:"], TapTestSameBROKEN[HoldComplete[
   s = SparseArray[{{i_, j_} /; Abs[i - j] == 1 -> i - j}, {4, 4}]], 
  $Failed], TapTestSameBROKEN[MatrixForm[s], 0 - 1*0*0*1*0 - 1*0*0*1*0 - 
   1*0*0*1*0], TapTestSame[s[[1,2]], -1], 
 TapComment["Rows or columns are represented as sparse vectors:"], 
 TapTestSameBROKEN[HoldComplete[s[[All,2]]], $Failed], 
 TapComment["Values can also be set:"], TapTestSame[s[[{1, 2},{3, 4}]] = 1, 
  1], TapTestSameBROKEN[MatrixForm[s], 0 - 1*1*1*1*0*1*1*0*1*0 - 1*0*0*1*0], 
 TapComment["The zeroth part of an expression is its head:"], 
 TapTestSame[(a + b + c)[[0]], Plus], TapTestSame[{a, b, c}[[0]], List], 
 TapComment["Reassign the head:"], TapTestSame[t = {a, b, c}, {a, b, c}], 
 TapTestSame[t[[0]] = f, f], TapTestSame[t, f[a, b, c]], 
 TapComment["Heads in the original expression are reused when \"lists\" of \
parts are extracted:"], TapTestSame[f[a, b, c][[{2, 3}]], f[b, c]], 
 TapTestSame[f[g[a, b], h[c, d]][[{1, 2},{2}]], f[g[b], h[d]]], 
 TapComment["Pick out the first solution from an equation:"], 
 TapTestSame[Solve[x^2 + 5*x + 1 == 0, x], {{x -> (1/2)*(-5 - Sqrt[21])}, 
   {x -> (1/2)*(-5 + Sqrt[21])}}], TapTestSameBROKEN[%[[1,1,2]], 
  (1/2)*(-5 - Sqrt[21])], TapComment[
  "Pick out all solutions for a univariate equation:"], 
 TapTestSame[Solve[x^2 + 5*x + 1 == 0, x], {{x -> (1/2)*(-5 - Sqrt[21])}, 
   {x -> (1/2)*(-5 + Sqrt[21])}}], TapTestSameBROKEN[%[[All,1,2]], 
  {(1/2)*(-5 - Sqrt[21]), (1/2)*(-5 + Sqrt[21])}], 
 TapTestSameBROKEN[m, {245, 1, 253, 0, 1, 0, 254, 0, 246, 0}], 
 TapComment["Another way to get the same result:"], 
 TapTestSame[Table[Count[Table[Mod[Prime[i], 10], {i, 1000}], j], {j, 0, 9}], 
  {0, 245, 1, 253, 0, 1, 0, 254, 0, 246}], 
 TapComment["Apply a permutation:"], 
 TapTestSame[{a, b, c, d, e}[[{4, 5, 1, 2, 3}]], {d, e, a, b, c}], 
 TapComment["Invert a permutation:"], 
 TapTestSame[pinv = ConstantArray[0, 5]; pinv[[{4, 5, 1, 2, 3}]] = Range[5]; 
   pinv, {3, 4, 5, 1, 2}], TapTestSame[{d, e, a, b, c}[[pinv]], 
  {a, b, c, d, e}], TapComment["Pick out parts cyclically by using \
RefLink[Mod,paclet:ref/Mod] with offset 1:"], 
 TapTestSame[Table[{a, b, c, d}[[Mod[i, 4, 1]]], {i, 15}], 
  {a, b, c, d, a, b, c, d, a, b, c, d, a, b, c}], 
 TapComment["RefLink[Take,paclet:ref/Take] picks out ranges of parts:"], 
 TapTestSame[{a, b, c, d, e, f, g}[[2 ;; 5]], {b, c, d, e}], 
 TapTestSame[{a, b, c, d, e, f, g}[[Range[2, 5]]], {b, c, d, e}], 
 TapTestSame[Take[{a, b, c, d, e, f, g}, {2, 5}], {b, c, d, e}], 
 TapComment["RefLink[Part,paclet:ref/Part] operates on the \
RefLink[FullForm,paclet:ref/FullForm] of expressions, not their formatted \
forms:"], TapTestSameBROKEN[FullForm[x/y], x/y], 
 TapTestSame[(x/y)[[2]], 1/y], TapComment["RefLink[Position,paclet:ref/Positi\
on] does not return part specifications in a form that can immediately be \
used by RefLink[Part,paclet:ref/Part]:"], 
 TapTestSame[Position[{1, 0, 0, 1, 0, 0, 1, 1}, 1], {{1}, {4}, {7}, {8}}], 
 TapTestSameBROKEN[Apply[{1, 0, 0, 1, 0, 0, 1, 1}[[##1]] & , %, {1}], 
  {1, 1, 1, 1}], TapComment["RefLink[Extract,paclet:ref/Extract] extracts \
parts specified in the way returned by \
RefLink[Position,paclet:ref/Position]:"], 
 TapTestSame[Extract[{1, 0, 0, 1, 0, 0, 1, 1}, {{1}, {4}, {7}, {8}}], 
  {1, 1, 1, 1}], TapComment["Successive part extraction is not always \
equivalent to direct part extraction:"], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[{1, 3}]][[{2, 3}]], 
  {{a, b, c}, {g, h, i}}[[{2, 3}]]], 
 TapTestSame[{{a, b, c}, {d, e, f}, {g, h, i}}[[{1, 3},{2, 3}]], 
  {{b, c}, {h, i}}], TapComment["If an expression contains held parts, \
extraction may cause them to evaluate:"], TapTestSame[a = Hold[2*x + 2*3], 
  Hold[2*x + 2*3]], TapTestSame[a[[1]], 6 + 2*x], 
 TapComment["This can lead to a difference between direct part extraction and \
successive part extraction:"], TapTestSame[a[[1,1]], 2*x], 
 TapTestSame[a[[1]][[1]], 6], 
 TapComment["Only parts that already exist can be reassigned:"], 
 TapTestSame[m = {a, b, c, d}, {a, b, c, d}], TapTestSame[m[[5]] = x, x]]
