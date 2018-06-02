(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[Unique["x"], x1], TapTestSameBROKEN[Unique[sym], 
  sym$149], TapComment["Create a unique symbol with no particular name:"], 
 TapTestSameBROKEN[Unique[], $1], 
 TapComment["Create a unique symbol whose name begins with x:"], 
 TapTestSameBROKEN[Unique["x"], x1], 
 TapComment[
  "Create a unique symbol in the way RefLink[Module,paclet:ref/Module] does:"]\
, TapTestSameBROKEN[Unique[x], x$160], TapComment["Each use of \
RefLink[Unique,paclet:ref/Unique][symbol] increments \
RefLink[$ModuleNumber,paclet:ref/$ModuleNumber]:"], 
 TapTestSameBROKEN[{$ModuleNumber, Unique[x], $ModuleNumber}, 
  {171, x$171, 172}], TapComment["RefLink[Unique,paclet:ref/Unique][symbol] \
creates symbols in the same way RefLink[Module,paclet:ref/Module] does:"], 
 TapTestSameBROKEN[{Module[{x}, x], Unique[x]}, {x$1672, x$1673}], 
 TapComment["RefLink[Unique,paclet:ref/Unique][\"x\"] uses the first unused \
symbol of the form xnnn:"], TapTestSameBROKEN[{x1, x2, x4}; Unique["x"], x3]]
