(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Scalar product of vectors:"], 
 TapTestSame[{a, b, c} . {x, y, z}, a*x + b*y + c*z], 
 TapComment["Products of matrices and vectors:"], 
 TapTestSame[{{a, b}, {c, d}} . {x, y}, {a*x + b*y, c*x + d*y}], 
 TapTestSame[{x, y} . {{a, b}, {c, d}}, {a*x + c*y, b*x + d*y}], 
 TapTestSame[{x, y} . {{a, b}, {c, d}} . {r, s}, 
  r*(a*x + c*y) + s*(b*x + d*y)], TapComment["Matrix product:"], 
 TapTestSame[{{a, b}, {c, d}} . {{r, s}, {t, u}}, 
  {{a*r + b*t, a*s + b*u}, {c*r + d*t, c*s + d*u}}], 
 TapComment["Use exact arithmetic to find the matrix product of a and b:"], 
 TapTestSameBROKEN[MatrixForm[a . b], 2*3*1*1*1*2*2*1*1*0*1*1*1*1*1*1*2*0*0*1*
   1*3*1*0*1], TapComment["Use machine arithmetic:"], 
 TapTestSameBROKEN[MatrixForm[N[a] . N[b]], 2.*3.*1.*1.*1.*2.*2.*1.*1.*0.*1.*
   1.*1.*1.*1.*1.*2.*0.*0.*1.*1.*3.*1.*0.*1.], 
 TapComment["Use higher-precision arithmetic:"], 
 TapTestSameBROKEN[MatrixForm[N[a, 20] . N[b, 20]], 
  2.`19.30102999566398*3.`19.477121254719663*1.`19.*1.`19.*1.`19.*
   2.`19.30102999566398*2.`19.30102999566398*1.`19.*1.`19.*0*1.`19.*1.`19.*
   1.`19.*1.`19.*1.`19.*1.`19.*2.`19.30102999566398*0*0*1.`19.*1.`19.*
   3.`19.477121254719663*1.`19.*0*1.`19.], 
 TapComment["Use RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 TapTestSameBROKEN[HoldComplete[SparseArray[a] . SparseArray[b]], $Failed], 
 TapTestSameBROKEN[Normal[%], {{2, 3, 1, 1, 1}, {2, 2, 1, 1, 0}, 
   {1, 1, 1, 1, 1}, {1, 2, 0, 0, 1}, {1, 3, 1, 0, 1}}], 
 TapComment["Compute the matrix product of random real and complex \
rectangular matrices:"], TapTestSameBROKEN[
  MatrixForm[RandomReal[1, {2, 3}] . RandomComplex[4 + 5*I, {3, 4}]], 
  0.79005 + 7.12673*I*2.71719 + 4.95134*I*4.41983 + 1.46947*I*5.61652 + 
   1.33687*I*1.32312 + 5.60335*I*1.95402 + 5.11821*I*2.01812 + 
   2.82809*I*3.84393 + 2.30291*I], TapTestSameBROKEN[a . b, 
  {{{{56, 70}, {40, 54}, {86, 69}, {34, 47}, {62, 58}}, 
    {{88, 112}, {66, 88}, {142, 105}, {49, 70}, {99, 94}}, 
    {{78, 147}, {59, 96}, {133, 128}, {65, 81}, {137, 121}}}, 
   {{{74, 103}, {65, 108}, {143, 115}, {76, 75}, {150, 103}}, 
    {{78, 88}, {54, 80}, {116, 106}, {65, 75}, {101, 78}}, 
    {{21, 105}, {28, 63}, {70, 70}, {35, 35}, {112, 91}}}}], 
 TapComment["The dimensions of the result are those of the input with the \
common dimension collapsed:"], TapTestSameBROKEN[Dimensions[%], 
  {2, 3, 5, 2}], TapComment["Any combination is allowed as long as products \
are done with a common dimension:"], TapTestSameBROKEN[c . a . b . c, 
  {{1648, 1728, 1840, 1200, 1648}, {1408, 1280, 1696, 1200, 1248}, 
   {1680, 1008, 1120, 560, 1456}}], TapComment["A linear mapping R^n->R^n:"], 
 TapTestSame[n = 10; u = Array[Subscript[x, #1] & , n]; 
   lm = ListConvolve[{1, -2, 1}*n^2, u, {2, 2}], 
  {-200*Subscript[x, 1] + 100*Subscript[x, 2] + 100*Subscript[x, 10], 
   100*Subscript[x, 1] - 200*Subscript[x, 2] + 100*Subscript[x, 3], 
   100*Subscript[x, 2] - 200*Subscript[x, 3] + 100*Subscript[x, 4], 
   100*Subscript[x, 3] - 200*Subscript[x, 4] + 100*Subscript[x, 5], 
   100*Subscript[x, 4] - 200*Subscript[x, 5] + 100*Subscript[x, 6], 
   100*Subscript[x, 5] - 200*Subscript[x, 6] + 100*Subscript[x, 7], 
   100*Subscript[x, 6] - 200*Subscript[x, 7] + 100*Subscript[x, 8], 
   100*Subscript[x, 7] - 200*Subscript[x, 8] + 100*Subscript[x, 9], 
   100*Subscript[x, 8] - 200*Subscript[x, 9] + 100*Subscript[x, 10], 
   100*Subscript[x, 1] + 100*Subscript[x, 9] - 200*Subscript[x, 10]}], 
 TapComment["Get the matrix representation m for the linear mapping:"], 
 TapTestSameBROKEN[HoldComplete[{c, m} = N[CoefficientArrays[%, u]]], 
  $Failed], TapTestSameBROKEN[ListConvolve[{1, -2, 1}*n^2, v, {2, 2}], 
  {-22.4514, -36.3271, -36.3271, -22.4514, 0., 22.4514, 36.3271, 36.3271, 
   22.4514, 2.84217/10^14}], TapTestSameBROKEN[lm /. Thread[u -> v], 
  {-22.4514, -36.3271, -36.3271, -22.4514, 0., 22.4514, 36.3271, 36.3271, 
   22.4514, 2.76696/10^14}], TapTestSameBROKEN[m . v, 
  {-22.4514, -36.3271, -36.3271, -22.4514, 0., 22.4514, 36.3271, 36.3271, 
   22.4514, 2.76696/10^14}], 
 TapComment["Using the matrix with RefLink[Dot,paclet:ref/Dot] is faster:"], 
 TapTestSameBROKEN[trials = 10000; First /@ {Timing[Do[m . v, {trials}]], 
     Timing[Do[ListConvolve[{1, -2, 1}*n^2, v, {2, 2}], {trials}]], 
     Timing[Do[lm /. Thread[u -> v], {trials}]]}, {0.296, 0.92, 1.088}], 
 TapComment["The result of applying RefLink[Dot,paclet:ref/Dot] to two \
tensors Subscript[T, Subscript[i, 1] Subscript[i, 2]...Subscript[i, n]] and \
Subscript[U, Subscript[j, 1] Subscript[j, 2]...Subscript[j, m]] is the tensor \
Underscript[\\[Sum], k] Subscript[T, Subscript[i, 1] Subscript[i, \
2]...Subscript[i, n-1]k] Subscript[U, k Subscript[j, 2]...Subscript[j, m]]:"]\
, TapTestSameBROKEN[Table[Sum[a[[i1,i2,k]]*b[[k,j2]], {k, 4}], {i1, 2}, 
   {i2, 3}, {j2, 5}], {{{60, 70, 74, 85, 108}, {39, 31, 41, 37, 59}, 
    {54, 31, 41, 40, 68}}, {{6, 40, 67, 63, 71}, {63, 32, 27, 61, 74}, 
    {32, 29, 3, 50, 38}}}], TapTestSameBROKEN[a . b, 
  {{{60, 70, 74, 85, 108}, {39, 31, 41, 37, 59}, {54, 31, 41, 40, 68}}, 
   {{6, 40, 67, 63, 71}, {63, 32, 27, 61, 74}, {32, 29, 3, 50, 38}}}], 
 TapComment["Applying RefLink[Dot,paclet:ref/Dot] to a rank n tensor and a \
rank m tensor gives a rank n+m-2 tensor."], 
 TapTestSameBROKEN[ArrayDepth[a . b] == 3 + 2 - 2, True], 
 TapComment["v is a random complex vector:"], 
 TapTestSameBROKEN[v = RandomComplex[1 + 2*I, {3}], 
  {0.734966 + 0.319542*I, 0.443465 + 0.0186486*I, 0.765872 + 0.292549*I}], 
 TapComment[
  "RefLink[Norm,paclet:ref/Norm][v] is given by Sqrt[v.v^\\[Conjugate]]:"], 
 TapTestSameBROKEN[Sqrt[v . Conjugate[v]], 1.2294 + 0.*I], 
 TapTestSameBROKEN[Norm[v], 1.2294], 
 TapComment["Compute the matrix product a.a.a:"], 
 TapTestSameBROKEN[b = a . a . a, {{1, 3, 3}, {0, 1, 3}, {0, 0, 1}}], 
 TapComment[
  "This is the same as RefLink[MatrixPower,paclet:ref/MatrixPower]:"], 
 TapTestSameBROKEN[MatrixPower[a, 3], {{1, 3, 3}, {0, 1, 3}, {0, 0, 1}}], 
 TapComment[
  "This is equivalent to composing the action of a on a vector three times:"]\
, TapTestSameBROKEN[x = {1, 2, 3}; Do[x = a . x, {3}]; x, {16, 11, 3}], 
 TapTestSameBROKEN[b . {1, 2, 3}, {16, 11, 3}], 
 TapComment["RefLink[Dot,paclet:ref/Dot] is a special case of \
RefLink[Inner,paclet:ref/Inner]:"], 
 TapTestSame[Inner[Times, {a, b, c}, {x, y, z}, Plus], a*x + b*y + c*z], 
 TapTestSame[{a, b, c} . {x, y, z}, a*x + b*y + c*z], 
 TapTestSameBROKEN[Simplify[v . a . m == TensorContract[
     v \[TensorProduct] a \[TensorProduct] m, {{1, 2}, {4, 5}}]], True], 
 TapTestSameBROKEN[a . {1, 1}, {3, 7, 11}], TapTestSameBROKEN[a . {{1}, {1}}, 
  {{3}, {7}, {11}}], TapComment["RefLink[Dot,paclet:ref/Dot] effectively \
treats vectors multiplied from the left as row vectors: "], 
 TapTestSameBROKEN[{1, 1, 1} . a, {9, 12}], 
 TapTestSameBROKEN[{{1, 1, 1}} . a, {{9, 12}}], 
 TapComment[
  "To get an outer product, you need to form the inputs as matrices:"], 
 TapTestSame[{{1}, {2}, {3}} . {{4, 5, 6}}, {{4, 5, 6}, {8, 10, 12}, 
   {12, 15, 18}}], TapComment[
  "Or you can use RefLink[KroneckerProduct,paclet:ref/KroneckerProduct]:"], 
 TapTestSame[KroneckerProduct[{1, 2, 3}, {4, 5, 6}], 
  {{4, 5, 6}, {8, 10, 12}, {12, 15, 18}}], 
 TapComment["Or RefLink[Outer,paclet:ref/Outer]:"], 
 TapTestSame[Outer[Times, {1, 2, 3}, {4, 5, 6}], 
  {{4, 5, 6}, {8, 10, 12}, {12, 15, 18}}]]
