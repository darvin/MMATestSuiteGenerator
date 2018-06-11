(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Transpose a 2*3 matrix:"], 
 TapTestSame[Transpose[{{a, b, c}, {x, y, z}}], {{a, x}, {b, y}, {c, z}}], 
 TapTestSameBROKEN[m = {{a, b, c}, {x, y, z}} ;; MatrixForm[m], a*b*c*x*y*z], 
 TapTestSameBROKEN[MatrixForm[Transpose[m]], a*x*b*y*c*z], 
 TapTestSame[m = Array[a, {2, 3, 2}], 
  {{{a[1, 1, 1], a[1, 1, 2]}, {a[1, 2, 1], a[1, 2, 2]}, 
    {a[1, 3, 1], a[1, 3, 2]}}, {{a[2, 1, 1], a[2, 1, 2]}, 
    {a[2, 2, 1], a[2, 2, 2]}, {a[2, 3, 1], a[2, 3, 2]}}}], 
 TapTestSame[Transpose[m, {1, 3, 2}], 
  {{{a[1, 1, 1], a[1, 2, 1], a[1, 3, 1]}, {a[1, 1, 2], a[1, 2, 2], 
     a[1, 3, 2]}}, {{a[2, 1, 1], a[2, 2, 1], a[2, 3, 1]}, 
    {a[2, 1, 2], a[2, 2, 2], a[2, 3, 2]}}}], 
 TapTestSame[Transpose[m, {3, 2, 1}], 
  {{{a[1, 1, 1], a[2, 1, 1]}, {a[1, 2, 1], a[2, 2, 1]}, 
    {a[1, 3, 1], a[2, 3, 1]}}, {{a[1, 1, 2], a[2, 1, 2]}, 
    {a[1, 2, 2], a[2, 2, 2]}, {a[1, 3, 2], a[2, 3, 2]}}}], 
 TapTestSame[Transpose[m, {2, 1, 3}], 
  {{{a[1, 1, 1], a[1, 1, 2]}, {a[2, 1, 1], a[2, 1, 2]}}, 
   {{a[1, 2, 1], a[1, 2, 2]}, {a[2, 2, 1], a[2, 2, 2]}}, 
   {{a[1, 3, 1], a[1, 3, 2]}, {a[2, 3, 1], a[2, 3, 2]}}}], 
 TapComment["s is a sparse matrix:"], TapTestSameBROKEN[
  HoldComplete[s = SparseArray[{{1, 1} -> 1, {2, 3} -> 4, {3, 1} -> -1}]], 
  $Failed], TapComment[
  "RefLink[Transpose,paclet:ref/Transpose][s] is sparse:"], 
 TapTestSameBROKEN[HoldComplete[Transpose[s]], $Failed], 
 TapComment["The indices have, in effect, just been reversed:"], 
 TapTestSameBROKEN[ArrayRules[%], {{1, 1} -> 1, {1, 3} -> -1, {3, 2} -> 4, 
   {_, _} -> 0}], TapComment[
  "Enter using Esc\\[ThinSpace]tr\\[ThinSpace]Esc:"], 
 TapTestSameBROKEN[$Failed, HoldComplete[{{1, 3}, {2, 4}}]], 
 TapComment["Get the leading diagonal by transposing two identical levels:"], 
 TapTestSame[Transpose[Array[a, {3, 3}], {1, 1}], 
  {a[1, 1], a[2, 2], a[3, 3]}], TapComment["RefLink[Accumulate,paclet:ref/Acc\
umulate] values of a tensor at all levels:"], 
 TapTestSameBROKEN[Multidimensionalize[Accumulate][
   {{{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}}, 
    {{13, 14, 15, 16}, {17, 18, 19, 20}, {21, 22, 23, 24}}}], 
  {{{1, 3, 6, 10}, {6, 14, 24, 36}, {15, 33, 54, 78}}, 
   {{14, 30, 48, 68}, {36, 76, 120, 168}, {66, 138, 216, 300}}}], 
 TapComment["Import data from an image:"], 
 TapTestSameBROKEN[HoldComplete[
   ArrayPlot[data = 256 - Import["ExampleData/Turtle.jpg", "Data"]]], 
  $Failed], TapComment["Flip the image by reversing at both levels:"], 
 TapTestSameBROKEN[HoldComplete[ArrayPlot[Multidimensionalize[Reverse][
     data]]], $Failed], TapComment["Transposing by a permutation \\[Sigma] \
transposes the element positions by \\[Sigma]^-1: "], 
 TapTestSameBROKEN[{\[Sigma] = RandomSample[Range[3]], 
   \[Sigma]i = \[Sigma]; \[Sigma]i[[\[Sigma]]] = Range[3]}, 
  {{2, 3, 1}, {1, 2, 3}}], TapTestSameBROKEN[Extract[T, {1, 3, 1}] == 
   Extract[Transpose[T, \[Sigma]], {1, 3, 1}[[\[Sigma]i]]], True], 
 TapComment["RefLink[Transpose,paclet:ref/Transpose][m,{1,1}] is equivalent \
to RefLink[Diagonal,paclet:ref/Diagonal][m]:"], 
 TapTestSameBROKEN[m = RandomReal[1, {4, 4}] ;; Transpose[m, {1, 1}], 
  {0.0102966, 0.440439, 0.137455, 0.555521}], TapTestSameBROKEN[Diagonal[m], 
  {0.0102966, 0.440439, 0.137455, 0.555521}], TapComment["RefLink[Transpose,p\
aclet:ref/Transpose] only works for rectangular arrays:"], 
 TapTestSame[Transpose[{{1, 2, 3, 4}, {5}, {6, 7}}], 
  Transpose[{{1, 2, 3, 4}, {5}, {6, 7}}]], 
 TapComment["Generalize transposition by padding:"], 
 TapTestSame[Transpose[PadRight[{{1, 2, 3, 4}, {5}, {6, 7}}, {3, 4}, p]], 
  {{1, 5, 6}, {2, p, 7}, {3, p, p}, {4, p, p}}], 
 TapComment["Eliminate the padding:"], TapTestSameBROKEN[
  % /. p -> Sequence[], {{1, 5, 6}, {2, 7}, {3}, {4}}], 
 TapTestSameBROKEN[HoldComplete[
   (MatrixForm[Transpose[{{{{x, x, x, x}}}}, #1]] & ) /@ 
    Permutations[{1, 2, 3, 4}]], $Failed]]
