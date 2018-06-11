(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[a^2 + 2*a*b + b^2]], 
 TapComment["A variable defined with \
RefLink[SetDelayed,paclet:ref/SetDelayed] is evaluated every time it is \
used:"], TapTestSameBROKEN[r := Random[]; {r, r, r}, 
  {0.964064, 0.797772, 0.472486}], TapComment["Make definitions for special \
and general cases using immediate and delayed assignments:"], 
 TapTestSame[fact[1] = 1; fact[n_] := n*fact[n - 1]; fact[10], 3628800], 
 TapComment["Make conditional definitions:"], 
 TapTestSame[f[x_ /; x > 0] := Sqrt[2*x]; {f[2], f[-2]}, {2, f[-2]}], 
 TapComment["Define a function by several conditional cases:"], 
 TapTestSame[unit[x_ /; x < 0] := 0*unit[x_ /; x >= 0] := 1; 
   {unit[-2], unit[0], unit[1], unit[a]}, {0, 1, 1, unit[a]}], 
 TapComment["Ownvalues:"], TapTestSame[r := Random[]; OwnValues[r], 
  {HoldPattern[r] :> Random[]}], TapComment["Downvalues:"], 
 TapTestSameBROKEN[f[x_] := x^2; DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapComment["Subvalues:"], TapTestSameBROKEN[derivative[1][f][x_] = 
   fg[x] ;; SubValues[derivative], {HoldPattern[derivative[1][f][x_]] :> 
    fg[x]}], TapComment["Upvalues:"], 
 TapTestSame[mod /: (a_mod) + (b_mod) := modPlus[a, b]; UpValues[mod], 
  {HoldPattern[(a_mod) + (b_mod)] :> modPlus[a, b]}], 
 TapComment["Numerical values:"], TapTestSameBROKEN[
  N[f[x_]] = Product[1 - x^(-i), {i, 2, 10}] ;; NValues[f], 
  {HoldPattern[N[f[x_], {MachinePrecision, MachinePrecision}]] :> 
    (1 - 1/x^10)*(1 - 1/x^9)*(1 - 1/x^8)*(1 - 1/x^7)*(1 - 1/x^6)*(1 - 1/x^5)*
     (1 - 1/x^4)*(1 - 1/x^3)*(1 - 1/x^2)}], TapTestSameBROKEN[N[f[2]], 
  0.578141], TapComment[
  "Define a procedure that computes a square root with Newton's method:"], 
 TapTestSame[newton[r_] := FixedPoint[Function[x, (x + r/x)/2], r]; 
   newton[5.], 2.23607], TapComment[
  "Perform a calculation on demand and cache the result:"], 
 TapTestSameBROKEN[pi2 := pi2 = N[Pi^2, 50]; pi2, 
  9.8696044010893586188344909998761511353136994072408`49.994299745388275], 
 TapTestSameBROKEN[
  pi2 = 9.8696044010893586188344909998761511353136994072408`49.99429974538827\
5, 
  pi2 = 9.8696044010893586188344909998761511353136994072408`49.99429974538827\
5], TapComment["Definitions for unevaluated expressions can implement \
call-by-name semantics:"], TapTestSameBROKEN[SetAttributes[f, HoldFirst]; 
   f[sym_, val_] := sym = val^2; x = 17 ;; f[x, 5], 25], 
 TapComment["The global variable has been modified:"], 
 TapTestSameBROKEN[x, 25], TapComment["The right side of an immediate \
definition is evaluated when the definition is made: "], 
 TapTestSameBROKEN[x = Random[] ;; {x, x, x}, 
  {0.446837, 0.446837, 0.446837}], TapComment["The right side of a delayed \
definition is evaluated each time the definition is used: "], 
 TapTestSameBROKEN[y := Random[] ;; {y, y, y}, 
  {0.72466, 0.646934, 0.872933}], TapComment["The arguments of the left side \
of a definition are evaluated before the definition is made:"], 
 TapTestSameBROKEN[x = 5 ;; f[x] := 17; f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, f[5] := 17], 
 TapComment["Definitions with the same left side overwrite earlier ones:"], 
 TapTestSameBROKEN[f[x_] := x^2; f[x_] := x^3; f[2], 8], 
 TapComment[
  "The pattern variable is renamed if necessary inside a nested scope:"], 
 TapTestSameBROKEN[makedef[z_] := (f[x_] := z^2; ); makedef[x]; 
   f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, f[x$_] := x^2], TapTestSameBROKEN[f[5], x^2], 
 TapComment["Delayed assignment introduces a scope that is not affected by \
global variables:"], TapTestSameBROKEN[x = 5 ;; f[x_] := x^2; {f[2], x}, 
  {4, 5}], TapComment["Immediate assignment does not introduce a scope:"], 
 TapTestSameBROKEN[g[x_] = x^2 ;; {g[2], x}, {25, 5}], 
 TapComment["Use a rule to do a transformation to a particular expression:"], 
 TapTestSameBROKEN[f[2*x*y] + f[x*y] //. f[(a_)*(b_)] :> f[a] + f[b], 
  f[2] + 2*f[x] + 2*f[y]], TapComment["Use a definition to do a \
transformation automatically for all expressions involving g:"], 
 TapTestSameBROKEN[g[(a_)*(b_)] := g[a] + g[b]; g[2*x*y] + g[x*y] + f[x*y], 
  f[x*y] + g[2] + 2*g[x] + 2*g[y]], 
 TapComment["More specific definitions are put in front of more general \
ones:"], TapTestSameBROKEN[fact[n_] := n*fact[n - 1]; 
   fact[1] = 1 ;; fact[1] = 1
 
fact[n_] := n*fact[n - 1], fact[1] = 1*fact[n_] := n*fact[n - 1]], 
 TapTestSame[fact[10], 3628800], TapComment["RefLink[Definition,paclet:ref/De\
finition] prints definitions associated with a symbol:"], 
 TapTestSameBROKEN[f[x_] := x^2; f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, f[x_] := x^2], TapComment["RefLink[DownValues,pac\
let:ref/DownValues] returns a list of rules corresponding to any downvalues \
defined:"], TapTestSameBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapComment["Use RefLink[Unset,paclet:ref/Unset] (=.) to clear definitions \
with a particular left-hand side:"], TapTestSameBROKEN[
  f[-1] =. ; f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, Attributes[f] = {Listable}*f[x_] := x^2], 
 TapComment["Clear any definitions, but not attributes:"], 
 TapTestSameBROKEN[Clear[f]; f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, Attributes[f] = {Listable}], 
 TapComment[
  "Use RefLink[ClearAll,paclet:ref/ClearAll] to clear attributes, too:"], 
 TapTestSame[ClearAll[f]; f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, Null], TapComment["Omitting the _ defines a \
transformation only for a literal value, rather than a function:"], 
 TapTestSameBROKEN[f[x] := x^2; g[x_] := x^2 ;; {f[x], g[x]}, {x^2, x^2}], 
 TapTestSameBROKEN[{f[2], g[2]}, {f[2], 4}], 
 TapComment["Using delayed definitions may have unexpected consequences:"], 
 TapTestSame[Expand[(x + 1)^3], 1 + 3*x + 3*x^2 + x^3], 
 TapComment["The definition actually made and its behavior: "], 
 TapTestSameBROKEN[f[$Failed] := x^2
 
f[x_] := f[Floor[x/2]] + 1, f[x_] := %], TapTestSame[f[1], f[x_] := %], 
 TapComment["Use RefLink[Evaluate,paclet:ref/Evaluate] to force evaluation of \
the right-hand side: "], TapTestSame[Expand[(x + 1)^3], 
  1 + 3*x + 3*x^2 + x^3], TapTestSameBROKEN[g[x_] := Evaluate[%]; g[1] = 0
 
g[10] = 10
 
g[(a_)*(b_)] := g[a] + g[b]
 
g[x_] := g[Floor[x/2]] + 1, g[x_] := 1 + 3*x + 3*x^2 + x^3], 
 TapTestSame[g[1], 8], TapComment["Or use RefLink[Set,paclet:ref/Set] to \
force evaluation of the right-hand side: "], TapTestSame[Expand[(x + 1)^3], 
  1 + 3*x + 3*x^2 + x^3], TapTestSame[h[x_] = %, 1 + 3*x + 3*x^2 + x^3], 
 TapTestSameBROKEN[h[x_] = 1 + 3*$Failed + 3*$Failed^2 + $Failed^3, 
  h[x_] = 1 + 3*x + 3*x^2 + x^3], TapTestSameBROKEN[h[1], 8], 
 TapComment["An iterative runaway definition: "], 
 TapTestSame[f[x_] := f[x + 1]; f[1], Hold[f[4096 + 1]]], 
 TapComment["By providing a base case, the iteration terminates:"], 
 TapTestSame[g[10] = 10; g[x_] := g[x + 1]; g[1], 10], 
 TapComment["A recursive runaway definition: "], 
 TapTestSameBROKEN[f[x_] := f[Floor[x/2]] + 1; f[10], 
  255 + Hold[Hold[f[Floor[0/2]]]]], 
 TapComment["By providing a base case, the recursion terminates: "], 
 TapTestSameBROKEN[g[1] = 0; g[x_] := g[Floor[x/2]] + 1; g[10], 3], 
 TapComment["Dynamic programming for the Fibonacci sequence:"], 
 TapTestSame[fib[1] = fib[2] = 1; fib[n_] := 
    fib[n] = fib[n - 1] + fib[n - 2]; fib[5], 5], 
 TapComment["New definitions have been added during the calculation:"], 
 TapTestSameBROKEN[fib[1] = 1
 
fib[2] = 1
 
fib[3] = 2
 
fib[4] = 3
 
fib[5] = 5
 
fib[n_] := fib[n] = fib[n - 1] + fib[n - 2], 
  fib[1] = 1*fib[2] = 1*fib[3] = 2*fib[4] = 3*fib[5] = 
       5*fib[n_] := fib[n] = fib[n - 1] + fib[n - 2]]]
