(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[f[a + b], a^2 + 2*a*b + b^2], 
 TapTestSameBROKEN[{r, r, r}, {0.964064, 0.797772, 0.472486}], 
 TapTestSameBROKEN[fact[10], 3628800], TapTestSameBROKEN[{f[2], f[-2]}, 
  {2, f[-2]}], TapTestSameBROKEN[{unit[-2], unit[0], unit[1], unit[a]}, 
  {0, 1, 1, unit[a]}], TapTestSameBROKEN[OwnValues[r], 
  {HoldPattern[r] :> Random[]}], TapTestSameBROKEN[DownValues[f], 
  {HoldPattern[f[x_]] :> x^2}], TapTestSameBROKEN[SubValues[derivative], 
  {HoldPattern[derivative[1][f][x_]] :> fg[x]}], 
 TapTestSameBROKEN[UpValues[mod], {HoldPattern[(a_mod) + (b_mod)] :> 
    modPlus[a, b]}], TapTestSameBROKEN[NValues[f], 
  {HoldPattern[N[f[x_], {MachinePrecision, MachinePrecision}]] :> 
    (1 - 1/x^10)*(1 - 1/x^9)*(1 - 1/x^8)*(1 - 1/x^7)*(1 - 1/x^6)*(1 - 1/x^5)*
     (1 - 1/x^4)*(1 - 1/x^3)*(1 - 1/x^2)}], TapTestSameBROKEN[N[f[2]], 
  0.578141], TapTestSameBROKEN[newton[5.], 2.23607], 
 TapTestSameBROKEN[pi2, 
  9.8696044010893586188344909998761511353136994072408`49.994299745388275], 
 TapTestSameBROKEN[
  pi2 = 9.8696044010893586188344909998761511353136994072408`49.99429974538827\
5, 
  pi2 = 9.8696044010893586188344909998761511353136994072408`49.99429974538827\
5], TapTestSameBROKEN[f[x, 5], 25], 
 TapComment["The global variable has been modified:"], 
 TapTestSameBROKEN[x, 25], TapTestSameBROKEN[{x, x, x}, 
  {0.446837, 0.446837, 0.446837}], TapTestSameBROKEN[{y, y, y}, 
  {0.72466, 0.646934, 0.872933}], TapTestSameBROKEN[Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, f[5] := 17], TapTestSameBROKEN[f[2], 8], 
 TapTestSameBROKEN[Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, f[x$_] := x^2], TapTestSameBROKEN[f[5], x^2], 
 TapTestSameBROKEN[{f[2], x}, {4, 5}], TapTestSameBROKEN[{g[2], x}, {25, 5}], 
 TapComment["Use a rule to do a transformation to a particular expression:"], 
 TapTestSameBROKEN[f[2*x*y] + f[x*y] //. f[(a_)*(b_)] :> f[a] + f[b], 
  f[2] + 2*f[x] + 2*f[y]], TapTestSameBROKEN[g[2*x*y] + g[x*y] + f[x*y], 
  f[x*y] + g[2] + 2*g[x] + 2*g[y]], TapTestSameBROKEN[fact[1] = $Failed, 
  fact[1] = 1*fact[n_] := n*fact[n - 1]], TapTestSameBROKEN[fact[10], 
  3628800], TapTestSameBROKEN[Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, f[x_] := x^2], TapComment["RefLink[DownValues,paclet:ref/DownValu\
es] returns a list of rules corresponding to any downvalues defined:"], 
 TapTestSameBROKEN[DownValues[f], {HoldPattern[f[x_]] :> x^2}], 
 TapTestSameBROKEN[Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, Attributes[f] = {Listable}*f[x_] := x^2], 
 TapTestSameBROKEN[Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, Attributes[f] = {Listable}], TapTestSameBROKEN[
  Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, Null], TapTestSameBROKEN[{f[x], g[x]}, {x^2, x^2}], 
 TapTestSameBROKEN[{f[2], g[2]}, {f[2], 4}], 
 TapComment["Using delayed definitions may have unexpected consequences:"], 
 TapTestSame[Expand[(x + 1)^3], 1 + 3*x + 3*x^2 + x^3], 
 TapComment["The definition actually made and its behavior: "], 
 TapTestSameBROKEN[Attributes[f] = {Listable}
 
f[5] := 17
 
f[x_] := %, f[x_] := %], TapTestSameBROKEN[f[1], f[x_] := %], 
 TapComment["Use RefLink[Evaluate,paclet:ref/Evaluate] to force evaluation of \
the right-hand side: "], TapTestSame[Expand[(x + 1)^3], 
  1 + 3*x + 3*x^2 + x^3], TapTestSameBROKEN[g[x_] := 1 + 3*x + 3*x^2 + x^3, 
  g[x_] := 1 + 3*x + 3*x^2 + x^3], TapTestSame[g[1], 8], 
 TapComment["Or use RefLink[Set,paclet:ref/Set] to force evaluation of the \
right-hand side: "], TapTestSame[Expand[(x + 1)^3], 1 + 3*x + 3*x^2 + x^3], 
 TapTestSameBROKEN[h[x_] = %, 1 + 3*x + 3*x^2 + x^3], 
 TapTestSameBROKEN[h[x_] = 1 + 3*x + 3*x^2 + x^3, 
  h[x_] = 1 + 3*x + 3*x^2 + x^3], TapTestSame[h[1], 8], 
 TapTestSameBROKEN[f[1], Hold[f[4096 + 1]]], TapTestSameBROKEN[g[1], 10], 
 TapTestSameBROKEN[f[10], 255 + Hold[Hold[f[Floor[0/2]]]]], 
 TapTestSameBROKEN[g[10], 3], TapTestSameBROKEN[fib[5], 5], 
 TapComment["New definitions have been added during the calculation:"], 
 TapTestSameBROKEN[fib[1] = $Failed, 
  fib[1] = 1*fib[2] = 1*fib[3] = 2*fib[4] = 3*fib[5] = 
       5*fib[n_] := fib[n] = fib[n - 1] + fib[n - 2]]]
