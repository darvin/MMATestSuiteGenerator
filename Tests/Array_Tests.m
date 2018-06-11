(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[
   {f[1], f[2], f[3], f[4], f[5], f[6], f[7], f[8], f[9], f[10]}]], 
 TapTestSame[Array[1 + #1^2 & , 10], {2, 5, 10, 17, 26, 37, 50, 65, 82, 
   101}], TapComment["Generate a 3*2 array:"], 
 TapTestSame[Array[f, {3, 2}], {{f[1, 1], f[1, 2]}, {f[2, 1], f[2, 2]}, 
   {f[3, 1], f[3, 2]}}], TapComment["Generate a 3*4 array:"], 
 TapTestSame[Array[10*#1 + #2 & , {3, 4}], {{11, 12, 13, 14}, 
   {21, 22, 23, 24}, {31, 32, 33, 34}}], 
 TapComment["Use index origin 0 instead of 1:"], 
 TapTestSame[Array[f, 10, 0], {f[0], f[1], f[2], f[3], f[4], f[5], f[6], 
   f[7], f[8], f[9]}], TapComment[
  "Start with indices 0 and 4 instead of 1: "], 
 TapTestSame[Array[f, {2, 3}, {0, 4}], {{f[0, 4], f[0, 5], f[0, 6]}, 
   {f[1, 4], f[1, 5], f[1, 6]}}], TapComment["Sample between 0 and 1:"], 
 TapTestSame[Array[f, 10, {0, 1}], {f[0], f[1/9], f[2/9], f[1/3], f[4/9], 
   f[5/9], f[2/3], f[7/9], f[8/9], f[1]}], 
 TapComment["Use ranges {-1/2,1/2} and {0,1}:"], 
 TapTestSame[Array[f, {2, 3}, {{-2^(-1), 1/2}, {0, 1}}], 
  {{f[-(1/2), 0], f[-(1/2), 1/2], f[-(1/2), 1]}, 
   {f[1/2, 0], f[1/2, 1/2], f[1/2, 1]}}], 
 TapComment["Use ## to pick up a sequence of indices:"], 
 TapTestSame[Array[FromDigits[{##1}] & , {2, 3, 4}], 
  {{{111, 112, 113, 114}, {121, 122, 123, 124}, {131, 132, 133, 134}}, 
   {{211, 212, 213, 214}, {221, 222, 223, 224}, {231, 232, 233, 234}}}], 
 TapComment["Use RefLink[Plus,paclet:ref/Plus] instead of \
RefLink[List,paclet:ref/List] to combine elements:"], 
 TapTestSame[Array[a, {2, 3}, 1, Plus], a[1, 1] + a[1, 2] + a[1, 3] + 
   a[2, 1] + a[2, 2] + a[2, 3]], TapComment["3*3 matrix of 0s:"], 
 TapTestSame[Array[0 & , {3, 3}], {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}}], 
 TapComment["Totally antisymmetric tensor:"], 
 TapTestSame[Array[Signature[{##1}] & , {3, 3, 3}], 
  {{{0, 0, 0}, {0, 0, 1}, {0, -1, 0}}, {{0, 0, -1}, {0, 0, 0}, {1, 0, 0}}, 
   {{0, 1, 0}, {-1, 0, 0}, {0, 0, 0}}}], 
 TapComment["Lower-triangular matrix:"], TapTestSameBROKEN[
  MatrixForm[Boole[Array[Greater, {5, 5}]]], 0*0*0*0*0*1*0*0*0*0*1*1*0*0*0*1*
   1*1*0*0*1*1*1*1*0], TapComment["Matrix with generic symbolic entries:"], 
 TapTestSame[m = Array[Subscript[a, ##1] & , {3, 4}], 
  {{Subscript[a, 1, 1], Subscript[a, 1, 2], Subscript[a, 1, 3], 
    Subscript[a, 1, 4]}, {Subscript[a, 2, 1], Subscript[a, 2, 2], 
    Subscript[a, 2, 3], Subscript[a, 2, 4]}, {Subscript[a, 3, 1], 
    Subscript[a, 3, 2], Subscript[a, 3, 3], Subscript[a, 3, 4]}}], 
 TapTestSameBROKEN[MatrixForm[m], Subscript[a, 1, 1]*Subscript[a, 1, 2]*
   Subscript[a, 1, 3]*Subscript[a, 1, 4]*Subscript[a, 2, 1]*
   Subscript[a, 2, 2]*Subscript[a, 2, 3]*Subscript[a, 2, 4]*
   Subscript[a, 3, 1]*Subscript[a, 3, 2]*Subscript[a, 3, 3]*
   Subscript[a, 3, 4]], TapComment[
  "Use it to see the effects of some linear algebra functions:"], 
 TapTestSameBROKEN[HoldComplete[MatrixForm[RowReduce[m]]], $Failed], 
 TapTestSame[Det[Take[m, All, 3]], (-Subscript[a, 1, 3])*Subscript[a, 2, 2]*
    Subscript[a, 3, 1] + Subscript[a, 1, 2]*Subscript[a, 2, 3]*
    Subscript[a, 3, 1] + Subscript[a, 1, 3]*Subscript[a, 2, 1]*
    Subscript[a, 3, 2] - Subscript[a, 1, 1]*Subscript[a, 2, 3]*
    Subscript[a, 3, 2] - Subscript[a, 1, 2]*Subscript[a, 2, 1]*
    Subscript[a, 3, 3] + Subscript[a, 1, 1]*Subscript[a, 2, 2]*
    Subscript[a, 3, 3]], TapComment[
  "Sample a function uniformly on an interval:"], 
 TapTestSame[HoldComplete[ListPlot[Array[Sin[2*#1] - Cos[3*#1] & , 50, 
     {0, 2*Pi}], Filling -> Axis, DataRange -> {0, 2*Pi}]], $Failed], 
 TapComment["RefLink[ConstantArray,paclet:ref/ConstantArray][c,dims] and \
RefLink[Array,paclet:ref/Array][c&,dims] are equivalent:"], 
 TapTestSameBROKEN[dims = RandomInteger[{1, 4}, {5}] ;; 
     ConstantArray[c, dims] === Array[c & , dims], True], 
 TapComment["When c is a machine number, \
RefLink[ConstantArray,paclet:ref/ConstantArray] is much faster for large \
arrays:"], TapTestSameBROKEN[
  {First[Timing[ca = ConstantArray[0., {2000, 2000}]]], 
   First[Timing[a = Array[0. & , {2000, 2000}]]], ca === a}, 
  {0.03, 0.23, True}], TapComment[
  "Set up the RefLink[Table,paclet:ref/Table] limit specifications:"], 
 TapTestSameBROKEN[v = Array[x, Length[dims]]; tl = Transpose[{v, dims}], 
  {{x[1], 4}, {x[2], 5}}], TapComment["The result is identical to the array \
generated using RefLink[Array,paclet:ref/Array]:"], 
 TapTestSameBROKEN[a === t, True], TapComment["RefLink[SparseArray,paclet:ref\
/SparseArray][{i_,j_}->f[i,j],dims] gives a sparse representation of \
RefLink[Array,paclet:ref/Array][f,dims]:"], 
 TapTestSameBROKEN[HoldComplete[dims = RandomInteger[{1, 10}, {2}]; 
    f[i_, j_] := i - 2*j; s = SparseArray[{i_, j_} -> f[i, j], dims]], 
  $Failed], TapTestSameBROKEN[a = Array[f, dims], 
  {{-1, -3, -5, -7, -9, -11, -13, -15}, {0, -2, -4, -6, -8, -10, -12, -14}, 
   {1, -1, -3, -5, -7, -9, -11, -13}, {2, 0, -2, -4, -6, -8, -10, -12}, 
   {3, 1, -1, -3, -5, -7, -9, -11}, {4, 2, 0, -2, -4, -6, -8, -10}, 
   {5, 3, 1, -1, -3, -5, -7, -9}, {6, 4, 2, 0, -2, -4, -6, -8}, 
   {7, 5, 3, 1, -1, -3, -5, -7}}], 
 TapComment["The results are RefLink[Equal,paclet:ref/Equal]:"], 
 TapTestSame[s == a, True], 
 TapComment[
  "The objects are not identical, but the represented arrays are:"], 
 TapTestSame[{s === a, Normal[s] === a}, {False, True}], 
 TapComment["Array of powers:"], TapTestSame[Array[Power, {5, 5}], 
  {{1, 1, 1, 1, 1}, {2, 4, 8, 16, 32}, {3, 9, 27, 81, 243}, 
   {4, 16, 64, 256, 1024}, {5, 25, 125, 625, 3125}}], 
 TapComment["Array of GCDs:"], 
 TapTestSame[HoldComplete[ArrayPlot[Array[GCD, {20, 20}]]], $Failed], 
 TapComment["Array of arrays:"], TapTestSame[Array[Array[x & , #1] & , {6}], 
  {{x}, {x, x}, {x, x, x}, {x, x, x, x}, {x, x, x, x, x}, 
   {x, x, x, x, x, x}}]]
