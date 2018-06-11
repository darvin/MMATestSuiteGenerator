(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[-0.366513]], 
 TapComment["Dynamic programming with a local function:"], 
 TapTestSame[fib[n_] := Module[{f}, f[1] = f[2] = 1; 
      f[i_] := f[i] = f[i - 1] + f[i - 2]; f[n]]; fib[5], 5], 
 TapComment[
  "Euclid's algorithm for the GCD using initialized local variables:"], 
 TapTestSame[gcd[m0_, n0_] := Module[{m = m0, n = n0}, 
     While[n != 0, {m, n} = {n, Mod[m, n]}]; m]; gcd[18, 21], 3], 
 TapComment[
  "Every time a module is evaluated, a new temporary symbol is created:"], 
 TapTestSameBROKEN[{Module[{x}, x], Module[{x}, x]}, {x$100, x$101}], 
 TapComment["Module symbols are temporary and are removed if they are no \
longer referenced:"], TapTestSame[Module[{x}, Print[x]; Attributes[x]], 
  {Temporary}], TapTestSameBROKEN[Names["x$*"], {}], 
 TapComment["Each use of RefLink[Module,paclet:ref/Module] increments \
RefLink[$ModuleNumber,paclet:ref/$ModuleNumber]:"], 
 TapTestSameBROKEN[{$ModuleNumber, Module[{x}, x], $ModuleNumber}, 
  {37, x$37, 38}], TapComment["If there is no need to assign to a local \
variable, a constant should be used instead:"], 
 TapTestSame[With[{x = 2.}, Sqrt[x] + 1], 2.41421], 
 TapComment["RefLink[With,paclet:ref/With] is faster than \
RefLink[Module,paclet:ref/Module]:"], TapTestSameBROKEN[
  Timing[Do[Module[{x = 5}, x; ], {10^5}]], {0.312, Null}], 
 TapTestSameBROKEN[Timing[Do[With[{x = 5}, x; ], {10^5}]], {0.093, Null}], 
 TapComment["RefLink[Block,paclet:ref/Block] localizes values only; it does \
not create new symbols:"], TapTestSame[x = 7; Block[{x = 5}, Print[x]]; x, 
  7], TapComment["RefLink[Unique,paclet:ref/Unique] creates new variables in \
a way similar to RefLink[Module,paclet:ref/Module]:"], 
 TapTestSameBROKEN[{Unique[x], Module[{x}, x]}, {x$949, x$950}], 
 TapComment["Local variables are not affected by global ones, and vice \
versa:"], TapTestSame[x = 17; Module[{x = x}, x = x + 1; x], 18], 
 TapTestSame[x, 17], TapComment["A symbol brought into the scope of \
RefLink[Module,paclet:ref/Module] is not affected by naming conflicts:"], 
 TapTestSameBROKEN[y = x^2 ;; Module[{x = 5}, x + y], 5 + x^2], 
 TapComment["Variables are renamed in nested scopes:"], 
 TapTestSameBROKEN[Module[{e = Expand[(1 + x)^5]}, Function[x, e]], 
  Function[x$, e$100477]], TapTestSameBROKEN[%[10], 
  1 + 5*x + 10*x^2 + 10*x^3 + 5*x^4 + x^5], 
 TapComment["Build the function from its parts to avoid the renaming:"], 
 TapTestSameBROKEN[Module[{e = Expand[(1 + x)^5]}, Function @@ {x, e}], 
  Function[x, 1 + 5*x + 10*x^2 + 10*x^3 + 5*x^4 + x^5]], 
 TapTestSame[%[10], 161051], TapComment["Parallel assignment is not available \
for RefLink[Module,paclet:ref/Module] variables:"], 
 TapTestSameBROKEN[v = {a, b} ;; Module[{{x, y} = v}, x^2 + y^2], 
  Module[{{x, y} = v}, x^2 + y^2]], TapTestSameBROKEN[
  Module[{x = v[[1]], y = v[[2]]}, x^2 + y^2], a^2 + b^2]]
