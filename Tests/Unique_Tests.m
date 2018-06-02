(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTestBROKEN[Unique["x"], x1], 
 ESameTestBROKEN[Unique[sym], sym$149], 
 EComment["Create a unique symbol with no particular name:"], 
 ESameTestBROKEN[Unique[], $1], 
 EComment["Create a unique symbol whose name begins with x:"], 
 ESameTestBROKEN[Unique["x"], x1], 
 EComment[
  "Create a unique symbol in the way RefLink[Module,paclet:ref/Module] does:"]\
, ESameTestBROKEN[Unique[x], x$160], EComment["Each use of \
RefLink[Unique,paclet:ref/Unique][symbol] increments \
RefLink[$ModuleNumber,paclet:ref/$ModuleNumber]:"], 
 ESameTestBROKEN[{$ModuleNumber, Unique[x], $ModuleNumber}, 
  {171, x$171, 172}], EComment["RefLink[Unique,paclet:ref/Unique][symbol] \
creates symbols in the same way RefLink[Module,paclet:ref/Module] does:"], 
 ESameTestBROKEN[{Module[{x}, x], Unique[x]}, {x$1672, x$1673}], 
 EComment["RefLink[Unique,paclet:ref/Unique][\"x\"] uses the first unused \
symbol of the form xnnn:"], ESameTestBROKEN[{x1, x2, x4}; Unique["x"], x3]]
