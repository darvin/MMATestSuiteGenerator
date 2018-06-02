(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[Log,paclet:ref/Log] is listable:"], 
 TapTestSame[Log[{a, b, c}], {Log[a], Log[b], Log[c]}], 
 TapTestSame[Attributes[Log], {Listable, NumericFunction, Protected}], 
 TapComment["Listable functions combine corresponding elements:"], 
 TapTestSame[{a, b, c} + {x, y, z}, {a + x, b + y, c + z}], 
 TapComment["Arguments that are not lists are replicated as needed:"], 
 TapTestSame[{a, b, c} + x, {a + x, b + x, c + x}], 
 TapTestSame[{{a, b}, {c, d}} + x, {{a + x, b + x}, {c + x, d + x}}], 
 TapTestSameBROKEN[f[{3, 0, -2}], {Sqrt[3], 0, Sqrt[2]}], 
 TapComment["Most built-in mathematical functions are listable:"], 
 TapTestSame[Attributes[Power], {Listable, NumericFunction, OneIdentity, 
   Protected}], TapTestSame[{a, b, c}^{1, 2, 3}, {a, b^2, c^3}], 
 TapTestSame[{a, b, c}^5, {a^5, b^5, c^5}], 
 TapComment["Listability works for any nesting depth of lists:"], 
 TapTestSame[Sqrt[{{1, 2}, {3, 4}}], {{1, Sqrt[2]}, {Sqrt[3], 2}}], 
 TapComment[
  "The nesting level of the different arguments need not be the same:"], 
 TapTestSame[{{a, b}, {c, d}}^{2, 3}, {{a^2, b^2}, {c^3, d^3}}], 
 TapComment["Listability works also with sparse arrays:"], 
 TapTestSameBROKEN[HoldComplete[
   Exp[SparseArray[{1 -> 1, 2 -> 2, 10 -> 10}]]], $Failed], 
 TapTestSameBROKEN[Normal[%], {E, E^2, 1, 1, 1, 1, 1, 1, 1, E^10}], 
 TapComment["Use the listability of RefLink[Plus,paclet:ref/Plus], \
RefLink[Power,paclet:ref/Power], RefLink[Sin,paclet:ref/Sin], and \
RefLink[Times,paclet:ref/Times]:"], TapTestSameBROKEN[
  Timing[fvl = Sin[2*Pi*(v - 0.5)^2]; ], {0.151, Null}], 
 TapComment["Use RefLink[Map,paclet:ref/Map]:"], 
 TapTestSameBROKEN[Timing[fvm = (Sin[2*Pi*(#1 - 0.5)^2] & ) /@ v; ], 
  {0.53, Null}], TapComment["Use RefLink[Table,paclet:ref/Table]:"], 
 TapTestSameBROKEN[Timing[fvt = Table[Sin[2*Pi*(x - 0.5)^2], {x, v}]; ], 
  {0.571, Null}], TapComment["Use RefLink[Table,paclet:ref/Table] and \
RefLink[Part,paclet:ref/Part] to access elements of v as might be done in a \
lower-level language:"], TapTestSameBROKEN[
  Timing[fvp = Table[Sin[2*Pi*(v[[i]] - 0.5)^2], {i, Length[v]}]; ], 
  {0.631, Null}], TapComment[
  "The results are the same up to numerical roundoff:"], 
 TapTestSameBROKEN[{Norm[fvl - fvm], Norm[fvl - fvt], Norm[fvl - fvp]}, 
  {1.12688/10^15, 1.12688/10^15, 1.12688/10^15}], 
 TapComment["Matrix for a second-order approximation to the second derivative \
on the grid x:"], TapTestSameBROKEN[HoldComplete[
   d2 = n^2*SparseArray[{{i_, i_} -> -2., {i_, j_} /; Abs[i - j] == 1 -> 1.}, 
      {n + 1, n + 1}, 0.]], $Failed], 
 TapComment[
  "Incorporate Dirichlet boundary conditions to form the Jacobian J:"], 
 TapTestSameBROKEN[HoldComplete[j = d2; j[[1,{1, 2}]] = 0.; 
    j[[-1,{-1, -2}]] = 0.; j = SparseArray[j]], $Failed], 
 TapComment["The sparse identity matrix:"], 
 TapTestSameBROKEN[HoldComplete[id = IdentityMatrix[n + 1, SparseArray]], 
  $Failed], TapComment["Form sparse matrix m=I-h J for h=0.01 using the \
listability of arithmetic:"], TapTestSameBROKEN[
  HoldComplete[m = id - 0.001*j], $Failed], 
 TapComment["LU decomposition of m in a functional form:"], 
 TapTestSameBROKEN[HoldComplete[lu = LinearSolve[m]], $Failed], 
 TapComment["Step initial condition on spatial grid x using the listability \
of RefLink[UnitStep,paclet:ref/UnitStep]:"], 
 TapTestSameBROKEN[HoldComplete[init = UnitStep[x - 0.5]; 
    ListPlot[init, DataRange -> {0, 1}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[ListPlot[sol, DataRange -> {0, 1}]], 
  $Failed], TapTestSameBROKEN[f[{1, 2, 3}], {f[1], f[2], f[3]}], 
 TapTestSame[g[{1, 2, 3}], g[{1, 2, 3}]], TapTestSame[Thread[g[{1, 2, 3}]], 
  {g[1], g[2], g[3]}], TapTestSameBROKEN[g[{1, 2, 3}], {1, 4, 9}], 
 TapTestSame[Attributes[Power], {Listable, NumericFunction, OneIdentity, 
   Protected}], TapComment["The system symbols with the \
RefLink[Listable,paclet:ref/Listable] attribute: "], 
 TapTestSameBROKEN[HoldComplete[
   listable = Select[Names["System`*"], MemberQ[Attributes[#1], 
        Listable] & ]; Short[listable, 4]], $Failed], 
 TapComment["Many of these are arithmetic or numerical functions:"], 
 TapTestSameBROKEN[{Length[listable], 
   Length[Select[listable, MemberQ[Attributes[#1], NumericFunction] & ]]}, 
  {308, 191}], TapComment["The inner product of two vectors:"], 
 TapTestSameBROKEN[u . v, a + 2*b + 3*c + 4*d], 
 TapComment["The vector resulting from the product of corresponding \
elements:"], TapTestSameBROKEN[u*v, {a, 2*b, 3*c, 4*d}], 
 TapComment["The matrix resulting from the outer product of the vectors:"], 
 TapTestSameBROKEN[MatrixForm[KroneckerProduct[u, v]], 
  a*2*a*3*a*4*a*b*2*b*3*b*4*b*c*2*c*3*c*4*c*d*2*d*3*d*4*d], 
 TapComment["All list arguments must have the same length:"], 
 TapTestSame[{a, b, c}^{1, 2}, {a, b, c}^{1, 2}]]
