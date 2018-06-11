(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Set a value for x:"], TapTestSame[x = a + b, a + b], 
 TapTestSame[1 + x^2, 1 + (a + b)^2], TapComment["Set multiple values: "], 
 TapTestSame[{x, y, z} = Range[3], {1, 2, 3}], 
 TapTestSame[x + y^2 + z^3, 32], TapComment["Ordinary program variables:"], 
 TapTestSame[i = 1; While[Prime[i] < 100, i = i + 1]; i, 26], 
 TapComment["Set values for \"indexed variables\":"], 
 TapTestSameBROKEN[a[1] = x; a[2] = y ;; {a[1], a[2], a[3]}, {x, y, a[3]}], 
 TapComment["Define a function from an expression:"], 
 TapTestSame[Expand[(1 + x)^3], 1 + 3*x + 3*x^2 + x^3], 
 TapTestSame[f[x_] = %, 1 + 3*x + 3*x^2 + x^3], 
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
  1*2*100*14*15*101*7*8*102], TapComment["Ownvalues:"], 
 TapTestSameBROKEN[x = 7 ;; OwnValues[x], {HoldPattern[x] :> 7}], 
 TapComment["Downvalues:"], TapTestSameBROKEN[a[1] = 17 ;; DownValues[a], 
  {HoldPattern[a[1]] :> 17}], TapComment["Subvalues:"], 
 TapTestSameBROKEN[derivative[1][f] = fg ;; SubValues[derivative], 
  {HoldPattern[derivative[1][f]] :> fg}], TapComment["Upvalues:"], 
 TapTestSameBROKEN[sq /: area[sq] = s^2 ;; UpValues[sq], 
  {HoldPattern[area[sq]] :> s^2}], TapComment["Default values and options:"], 
 TapTestSameBROKEN[Default[f] = 0 ;; Options[f] = 
    {opt1 -> def1, opt2 -> def2} ;; DefaultValues[f], 
  {HoldPattern[Default[f]] :> 0, HoldPattern[Options[f]] :> 
    {opt1 -> def1, opt2 -> def2}}], TapComment["Numerical values:"], 
 TapTestSameBROKEN[N[const] = Product[1 - 2^(-i), {i, 2, 10}] ;; 
    NValues[const], 
  {HoldPattern[N[const, {MachinePrecision, MachinePrecision}]] :> 
    10414855105976475/18014398509481984}], TapTestSameBROKEN[N[const], 
  0.578141], TapComment["Format values:"], 
 TapTestSameBROKEN[a = \[Alpha] ;; FormatValues[a], 
  {HoldPattern[\[Alpha]] :> \[Alpha], 
   HoldPattern[MakeBoxes[\[Alpha], FormatType_]] :> \[Alpha]}], 
 TapTestSameBROKEN[a, \[Alpha]], TapComment["A definition for \
RefLink[Attributes,paclet:ref/Attributes] is associated with f, rather than \
RefLink[Attributes,paclet:ref/Attributes]:"], 
 TapTestSame[Attributes[f] = HoldAll, HoldAll], 
 TapTestSameBROKEN[Attributes[f] = {HoldAll}
 
Default[f] = {opt1 -> def1, opt2 -> def2} ;; {}, Attributes[f] = {HoldAll}], 
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
 TapComment[
  "Assign multiple return values of a function to individual variables:"], 
 TapTestSameBROKEN[{time, res} = Timing[N[Catalan, 100000]] ;; time, 5.703], 
 TapTestSameBROKEN[N[res], 0.915966], TapComment["A definition for a pattern \
with a specific head is associated with that head:"], 
 TapTestSame[_a = \[Alpha], \[Alpha]], TapTestSameBROKEN[a = Sqrt[2]
 
a[1] = 17 ;; {HoldPattern[a[1]] :> 1, HoldPattern[a[2]] :> 
        2 ;; {1, a[2], a[3]}}
 
a[2] = 2 ;; {1, a[2], a[3]}
 
_a = \[Alpha]
 
Format[a] = \[Alpha] ;; {}
 
MakeBoxes[a, FormatType_] ^= Format[\[Alpha] ;; {}, FormatType], 
  _a = \[Alpha]], TapTestSameBROKEN[{a, a[1]}, {a, \[Alpha]}], 
 TapComment["Compute the GCD of two numbers:"], 
 TapTestSame[{a, b} = {27, 6}; While[b != 0, {a, b} = {b, Mod[a, b]}]; a, 3], 
 TapComment["Find a fixed point:"], 
 TapTestSame[x = 1.; While[Cos[x] != x, x = Cos[x]]; x, 0.739085], 
 TapComment["Compute Sqrt[2] using Newton's method:"], 
 TapTestSame[x = 1.; Do[x = (x + 2/x)/2, {5}]; x, 1.41421], 
 TapComment["Use a variable as an abbreviation for a complicated expression \
used more than once:"], TapTestSameBROKEN[x = (a + b)^2 ;; 1 + x + 1/x, 
  1 + 1/(a + b)^2 + (a + b)^2], TapComment["A scalar implementation of \
backsubstitution in a system of linear equations: "], 
 TapTestSame[$Failed, HoldComplete[{-(1/3), 2/3}]], 
 TapComment["A vector implementation of backsubstitution in a system of \
linear equations: "], TapTestSameBROKEN[upperTriangularLinearSolve[U_, v_] := 
   Module[{x, m, n}, {m, n} = Dimensions[U]; x = Range[n]; 
      Do[x[[i]] = (v[[i]] - U[[i,i + 1 ;; n]] . x[[i + 1 ;; n]])/U[[i,i]], 
       {i, n, 1, -1}]; x] ;; upperTriangularLinearSolve[{{1, 2}, {0, 3}}, 
     {1, 2}], {-(1/3), 2/3}], TapComment["The right side of an immediate \
definition is evaluated when the definition is made: "], 
 TapTestSameBROKEN[x = Random[] ;; {x, x, x}, 
  {0.446837, 0.446837, 0.446837}], TapComment["The right side of a delayed \
definition is evaluated each time the definition is used: "], 
 TapTestSameBROKEN[y := Random[] ;; {y, y, y}, 
  {0.72466, 0.646934, 0.872933}], TapComment["The arguments of the left side \
of a definition are evaluated before the definition is made:"], 
 TapTestSame[x = 5 ;; f[x] = 17, 17], TapTestSameBROKEN[
  Attributes[f] = {HoldAll}
 
Default[f] = {opt1 -> def1, opt2 -> def2} ;; {}, f[5] = 17], 
 TapComment["Definitions with the same left side overwrite earlier ones:"], 
 TapTestSameBROKEN[a = 5 ;; a = 6 ;; a, 6], TapComment["Make definitions for \
special and general cases using immediate and delayed assignments:"], 
 TapTestSame[fact[1] = 1; fact[n_] := n*fact[n - 1]; fact[10], 3628800], 
 TapComment[
  "More specific definitions are put in front of more general ones:"], 
 TapTestSameBROKEN[fact[n_] := n*fact[n - 1]; 
   fact[1] = 1 ;; fact[n_] := n*fact[n - 1], 
  fact[1] = 1*fact[n_] := n*fact[n - 1]], TapTestSame[fact[10], 3628800], 
 TapComment[
  "The pattern variable is renamed if necessary inside a nested scope:"], 
 TapTestSameBROKEN[makedef[z_] := (f[x_] = z^2; ); makedef[x]; 
   Attributes[f] = {HoldAll}
 
Default[f] = {opt1 -> def1, opt2 -> def2} ;; {}, f[x$_] = x^2], 
 TapTestSameBROKEN[f[5], x^2], TapComment["RefLink[Module,paclet:ref/Module] \
introduces new symbols, distinct from global ones:"], 
 TapTestSameBROKEN[x = 5 ;; Module[{x}, x = 17; x], 17], 
 TapTestSameBROKEN[x, 5], TapComment["RefLink[Definition,paclet:ref/Definitio\
n] prints definitions associated with a symbol:"], 
 TapTestSame[a = Sqrt[2], Sqrt[2]], TapTestSameBROKEN[a = Sqrt[2]
 
a[1] = 17 ;; {HoldPattern[a[1]] :> 1, HoldPattern[a[2]] :> 
        2 ;; {1, a[2], a[3]}}
 
a[2] = 2 ;; {1, a[2], a[3]}
 
_a = \[Alpha]
 
Format[a] = \[Alpha] ;; {}
 
MakeBoxes[a, FormatType_] ^= Format[\[Alpha] ;; {}, FormatType], 
  a = Sqrt[2]], TapComment["RefLink[OwnValues,paclet:ref/OwnValues] returns a \
list of rules corresponding to any downvalues defined:"], 
 TapTestSame[OwnValues[a], {HoldPattern[a] :> Sqrt[2]}], 
 TapComment["Use RefLink[Unset,paclet:ref/Unset] (=.) to clear definitions \
with a particular left-hand side:"], TapTestSameBROKEN[
  fact[1] = 1; fact[n_] := n*fact[n - 1]; fact[1] =. ; 
   fact[n_] := n*fact[n - 1], fact[n_] := n*fact[n - 1]], 
 TapComment["Clear all definitions:"], TapTestSameBROKEN[
  Clear[f]; fact[n_] := n*fact[n - 1], fact[n_] := n*fact[n - 1]], 
 TapComment["In the presence of global variables, pattern variables may show \
unexpected behavior:"], TapTestSameBROKEN[x = 5 ;; f[x_] = x^2 ;; f[2], 25], 
 TapComment["Delayed assignments behave as expected:"], 
 TapTestSame[g[x_] := x^2; g[2], 4], TapComment["Runaway definitions:"], 
 TapTestSameBROKEN[x = x + 1, 255 + Hold[1 + x]], 
 TapTestSame[y = 5; y = y + 1, 6], 
 TapComment[
  "Pattern variables are not symbols; you cannot normally assign to them:"], 
 TapTestSame[wrong[x_] := x = x^2; wrong[5], 25], 
 TapComment["Use local variables for this purpose:"], 
 TapTestSame[right[x0_] := Module[{x}, x = x0^2]; right[5], 25], 
 TapComment["Use upvalues to assign to subscripted variables:"], 
 TapTestSameBROKEN[a /: Subscript[a, 1] = 5 ;; FullForm[UpValues[a]], 
  {HoldPattern[Subscript[a, 1]] :> 5}], 
 TapComment["Subscripted variables are distinct from indexed variables:"], 
 TapTestSameBROKEN[a[1] = 6 ;; FullForm[DownValues[a]], 
  {HoldPattern[a[1]] :> 6}], TapComment["Compute the arithmetic-geometric \
mean of two numbers WebLink[[more \
info],http://mathworld.wolfram.com/Arithmetic-GeometricMean.html]:"], 
 TapTestSameBROKEN[{x, y} = N[{1, 2}, 20]; 
   While[x != y, {x, y} = {(x + y)/2, Sqrt[x*y]}]; x, 
  1.45679103104690686920000000001`19.163397258995797]]
