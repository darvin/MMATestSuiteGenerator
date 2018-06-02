(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Set a value for x:"], TapTestSame[x = a + b, a + b], 
 TapTestSame[1 + x^2, 1 + (a + b)^2], TapComment["Set multiple values: "], 
 TapTestSame[{x, y, z} = Range[3], {1, 2, 3}], 
 TapTestSame[x + y^2 + z^3, 32], TapComment["Ordinary program variables:"], 
 TapTestSame[i = 1; While[Prime[i] < 100, i = i + 1]; i, 26], 
 TapTestSameBROKEN[{a[1], a[2], a[3]}, {x, y, a[3]}], 
 TapComment["Define a function from an expression:"], 
 TapTestSame[Expand[(1 + x)^3], 1 + 3*x + 3*x^2 + x^3], 
 TapTestSameBROKEN[f[x_] = %, 1 + 3*x + 3*x^2 + x^3], 
 TapTestSameBROKEN[f[a + b], 1 + 3*(a + b) + 3*(a + b)^2 + (a + b)^3], 
 TapComment[
  "Use RefLink[Block,paclet:ref/Block] to temporarily set variables: "], 
 TapTestSameBROKEN[Block[{$RecursionLimit = 20}, x = x + 1], 
  18 + Hold[1 + x]], TapComment["Set part of a list:"], 
 TapTestSame[v = {a, b, c, d}, {a, b, c, d}], TapTestSame[v[[2]] = x, x], 
 TapTestSame[v, {a, x, c, d}], TapComment["Set part of an expression:"], 
 TapTestSame[v = 1 + x^5, 1 + x^5], TapTestSame[v[[2,2]] = 77777, 77777], 
 TapTestSameBROKEN[v, 1 + x^77777], TapComment["Replace a row of a matrix:"], 
 TapTestSameBROKEN[mat[[2]] = mat[[2]] + 10; MatrixForm[mat], 
  1*2*3*14*15*16*7*8*9], TapComment["Replace a column of a matrix:"], 
 TapTestSameBROKEN[mat[[All,3]] = {100, 101, 102}; MatrixForm[mat], 
  1*2*100*14*15*101*7*8*102], TapTestSameBROKEN[OwnValues[x], 
  {HoldPattern[x] :> 7}], TapTestSameBROKEN[DownValues[a], 
  {HoldPattern[a[1]] :> 17}], TapTestSameBROKEN[SubValues[derivative], 
  {HoldPattern[derivative[1][f]] :> fg}], TapTestSameBROKEN[UpValues[sq], 
  {HoldPattern[area[sq]] :> s^2}], TapTestSameBROKEN[DefaultValues[f], 
  {HoldPattern[Default[f]] :> 0, HoldPattern[Options[f]] :> 
    {opt1 -> def1, opt2 -> def2}}], TapTestSameBROKEN[NValues[const], 
  {HoldPattern[N[const, {MachinePrecision, MachinePrecision}]] :> 
    10414855105976475/18014398509481984}], TapTestSameBROKEN[N[const], 
  0.578141], TapTestSameBROKEN[FormatValues[a], 
  {HoldPattern[\[Alpha]] :> \[Alpha], 
   HoldPattern[MakeBoxes[\[Alpha], FormatType_]] :> \[Alpha]}], 
 TapTestSameBROKEN[a, \[Alpha]], TapComment["A definition for \
RefLink[Attributes,paclet:ref/Attributes] is associated with f, rather than \
RefLink[Attributes,paclet:ref/Attributes]:"], 
 TapTestSame[Attributes[f] = HoldAll, HoldAll], 
 TapTestSameBROKEN[Attributes[f] = {HoldAll}
 
f[5] = 17
 
f[x] = 17
 
f[x$_] = 1.9999999999999996, Attributes[f] = {HoldAll}], 
 TapComment["Set x and y to the same value:"], TapTestSame[x = y = 77, 77], 
 TapTestSame[{x, y}, {77, 77}], 
 TapComment["Set x and y to different values:"], 
 TapTestSame[{x, y} = {a, b}, {a, b}], TapComment["Interchange values:"], 
 TapTestSame[{x, y} = {y, x}, {b, a}], TapTestSame[{x, y}, {b, a}], 
 TapComment["Set part of a sparse array:"], 
 TapTestSameBROKEN[HoldComplete[v = SparseArray[{1 -> 1, 4 -> 4}]], $Failed], 
 TapTestSame[v[[2]] = 3, 3], 
 TapComment["v is still a sparse array, with its second part changed:"], 
 TapTestSameBROKEN[HoldComplete[{v, Normal[v]}], $Failed], 
 TapTestSameBROKEN[time, 5.703], TapTestSameBROKEN[N[res], 0.915966], 
 TapComment["A definition for a pattern with a specific head is associated \
with that head:"], TapTestSame[_a = \[Alpha], \[Alpha]], 
 TapTestSameBROKEN[a = Sqrt[2]
 
_a = \[Alpha], _a = \[Alpha]], TapTestSame[{a, a[1]}, {a, \[Alpha]}], 
 TapComment["Compute the GCD of two numbers:"], 
 TapTestSame[{a, b} = {27, 6}; While[b != 0, {a, b} = {b, Mod[a, b]}]; a, 3], 
 TapComment["Find a fixed point:"], TapTestSameBROKEN[
  x = 1.; While[Cos[x] != x, x = Cos[x]]; x, 0.739085], 
 TapComment["Compute Sqrt[2] using Newton's method:"], 
 TapTestSameBROKEN[x = 1.; Do[x = (x + 2/x)/2, {5}]; x, 1.41421], 
 TapTestSameBROKEN[1 + x + 1/x, 1 + 1/(a + b)^2 + (a + b)^2], 
 TapTestSameBROKEN[upperTriangularLinearSolve[{{1, 2}, {0, 3}}, {1, 2}], 
  {-(1/3), 2/3}], TapTestSameBROKEN[upperTriangularLinearSolve[
   {{1, 2}, {0, 3}}, {1, 2}], {-(1/3), 2/3}], TapTestSameBROKEN[{x, x, x}, 
  {0.446837, 0.446837, 0.446837}], TapTestSameBROKEN[{y, y, y}, 
  {0.72466, 0.646934, 0.872933}], TapTestSame[f[x] = 17, 17], 
 TapTestSameBROKEN[Attributes[f] = {HoldAll}
 
f[5] = 17
 
f[x] = 17
 
f[x$_] = 1.9999999999999996, f[5] = 17], TapTestSameBROKEN[a, 6], 
 TapTestSameBROKEN[fact[10], 3628800], TapTestSameBROKEN[fact[1] = $Failed
 
fact[n_] := n*fact[n - 1], fact[1] = 1*fact[n_] := n*fact[n - 1]], 
 TapTestSameBROKEN[fact[10], 3628800], TapTestSameBROKEN[
  Attributes[f] = {HoldAll}
 
f[5] = 17
 
f[x] = 17
 
f[x$_] = 1.9999999999999996, f[x$_] = x^2], TapTestSameBROKEN[f[5], x^2], 
 TapTestSame[Module[{x}, x = 17; x], 17], TapTestSameBROKEN[x, 5], 
 TapComment["RefLink[Definition,paclet:ref/Definition] prints definitions \
associated with a symbol:"], TapTestSame[a = Sqrt[2], Sqrt[2]], 
 TapTestSameBROKEN[a = Sqrt[2]
 
_a = \[Alpha], a = Sqrt[2]], TapComment["RefLink[OwnValues,paclet:ref/OwnValu\
es] returns a list of rules corresponding to any downvalues defined:"], 
 TapTestSameBROKEN[OwnValues[a], {HoldPattern[a] :> Sqrt[2]}], 
 TapTestSameBROKEN[fact[1] = $Failed
 
fact[n_] := n*fact[n - 1], fact[n_] := n*fact[n - 1]], 
 TapTestSameBROKEN[fact[1] = $Failed
 
fact[n_] := n*fact[n - 1], fact[n_] := n*fact[n - 1]], 
 TapTestSameBROKEN[f[2], 25], TapTestSameBROKEN[g[2], 4], 
 TapComment["Runaway definitions:"], TapTestSameBROKEN[x = x + 1, 
  255 + Hold[1 + x]], TapTestSame[y = 5; y = y + 1, 6], 
 TapTestSameBROKEN[wrong[5], 25], TapTestSameBROKEN[right[5], 25], 
 TapTestSameBROKEN[FullForm[UpValues[a]], 
  {HoldPattern[Subscript[a, 1]] :> 5}], TapTestSameBROKEN[
  FullForm[DownValues[a]], {HoldPattern[a[1]] :> 6}], 
 TapComment["Compute the arithmetic-geometric mean of two numbers \
WebLink[[more \
info],http://mathworld.wolfram.com/Arithmetic-GeometricMean.html]:"], 
 TapTestSame[{x, y} = N[{1, 2}, 20]; While[x != y, 
    {x, y} = {(x + y)/2, Sqrt[x*y]}]; x, 
  1.45679103104690686920000000001`19.163397258995797]]
