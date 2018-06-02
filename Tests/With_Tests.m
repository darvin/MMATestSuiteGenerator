(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[f[a], 2 + a + (1 + a)^2], 
 TapComment[
  "Use RefLink[With,paclet:ref/With] to insert values into held expressions:"]\
, TapTestSame[With[{x = y}, Hold[x]], Hold[y]], 
 TapTestSame[Table[With[{i = j}, Hold[i]], {j, 5}], 
  {Hold[1], Hold[2], Hold[3], Hold[4], Hold[5]}], 
 TapComment["The variable names can be the same:"], 
 TapTestSame[x = 5; With[{x = x}, Hold[x]], Hold[5]], 
 TapComment["Use a constant for a value that is needed more than once:"], 
 TapTestSameBROKEN[With[{y = Sin[1.]}, Sum[y^i, {i, 0, 10}]], 5.36323], 
 TapComment["RefLink[With,paclet:ref/With] allows inserting values into \
unevaluated expressions:"], TapTestSame[With[{v = {a, b, c}, w = {x, y, z}}, 
   Thread[Unevaluated[v . w]]], {a . x, b . y, c . z}], 
 TapTestSame[Thread[{a, b, c} . {x, y, z}], a*x + b*y + c*z], 
 TapComment["RefLink[Module,paclet:ref/Module] introduces local variables to \
which you can assign values:"], TapTestSameBROKEN[
  Module[{x = 2.}, While[x > 0, x = Log[x]]; x], -0.366513], 
 TapComment["RefLink[With,paclet:ref/With] is faster than \
RefLink[Module,paclet:ref/Module]:"], TapTestSameBROKEN[
  Timing[Do[Module[{x = 5}, x; ], {10^5}]], {0.312, Null}], 
 TapTestSameBROKEN[Timing[Do[With[{x = 5}, x; ], {10^5}]], {0.093, Null}], 
 TapComment["RefLink[Block,paclet:ref/Block] localizes values only; it does \
not substitute values. RefLink[Module,paclet:ref/Module] creates new \
symbols:"], TapTestSameBROKEN[{Block[{x = 5}, Hold[x]], 
   With[{x = 5}, Hold[x]], Module[{x = 5}, Hold[x]]}, 
  {Hold[x], Hold[5], Hold[x$100433]}], TapTestSameBROKEN[ReleaseHold[%], 
  {x, 5, 5}], TapComment["RefLink[With,paclet:ref/With] allows substitution \
inside an unevaluated expression, preserving nested scopes:"], 
 TapTestSameBROKEN[With[{e = x}, Function[x, e]], Function[x$, x]], 
 TapComment["Ordinary substitution does not preserve scoping:"], 
 TapTestSame[Function[x, e] /. e :> x, Function[x, x]], 
 TapComment["RefLink[With,paclet:ref/With] is a scoping construct; variables \
are renamed in nested scopes:"], TapTestSameBROKEN[
  With[{e = Expand[(1 + x)^5]}, Function[x, e]], 
  Function[x$, 1 + 5*x + 10*x^2 + 10*x^3 + 5*x^4 + x^5]], 
 TapTestSameBROKEN[%[10], 1 + 5*x + 10*x^2 + 10*x^3 + 5*x^4 + x^5], 
 TapComment["Build the function from its elements to avoid the renaming:"], 
 TapTestSameBROKEN[With[{e = Expand[(1 + x)^5]}, Function @@ {x, e}], 
  Function[x, 1 + 5*x + 10*x^2 + 10*x^3 + 5*x^4 + x^5]], 
 TapTestSameBROKEN[%[10], 161051], TapTestSameBROKEN[newton[Cos, 1.`20.], 
  1.570796326794896619`18.196119877030153], 
 TapComment["Find a fixed point:"], TapTestSameBROKEN[
  newton[Cos[#1] - #1 & , 1.`20.], 0.739085133215160642`17.868694466481546], 
 TapTestSameBROKEN[letrec[{f = Function[n, If[n == 0, 1, n*f[n - 1]]]}, 
   f[10]], 3628800], TapComment[
  "Here the f inside the function definition is not inside its own scope:"], 
 TapTestSame[With[{f = Function[n, If[n == 0, 1, n*f[n - 1]]]}, f[10]], 
  10*f[9]]]
