(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["The function definition can no longer be changed: "], 
 TapTestSameBROKEN[f[x_, y_] := x + y, $Failed], 
 TapComment["Protect several symbols:"], TapTestSame[Protect[f, g, h], 
  {f, g, h}], TapComment["Protect all symbols matching a string pattern:"], 
 TapTestSameBROKEN[f1[x_] := x^2; f2[x_] := x^3 ;; Protect["f*"], {f1, f2}], 
 TapComment["Protect all symbols in the current context:"], 
 TapTestSameBROKEN[f[x_] := x^2; g[x_] := x^3 ;; Protect["`*"] ;; 
     Attributes[{f, g}], {{Protected}, {Protected}}], 
 TapComment["Protecting a symbol is equivalent to setting the \
RefLink[Protected,paclet:ref/Protected] attribute:"], 
 TapTestSameBROKEN[Protect[f]; SetAttributes[g, Protected] ;; 
    Attributes[{f, g}], {{Protected}, {Protected}}], 
 TapTestSameBROKEN[Unprotect[f]; ClearAttributes[g, Protected] ;; 
    Attributes[{f, g}], {{}, {}}], TapComment["RefLink[Protect,paclet:ref/Pro\
tect] returns the list of symbols actually protected:"], 
 TapTestSame[Protect[f, g], {f, g}], 
 TapComment["If a symbol is already protected, it is not protected again:"], 
 TapTestSame[Protect[f], {}], 
 TapComment["No more definitions can be made for a protected symbol:"], 
 TapTestSame[f[x_] := x^3; Protect[f] ;; f[x_] := x^2, $Failed], 
 TapComment["To protect all symbols given in a variable, use \
RefLink[Evaluate,paclet:ref/Evaluate]:"], 
 TapTestSameBROKEN[syms = {f, g, h} ;; Protect[Evaluate[syms]], {f, g, h}], 
 TapTestSame[Attributes[f], {Protected}]]
