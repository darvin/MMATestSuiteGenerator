(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "Set up a pattern whose left-hand side is kept unevaluated:"], 
 ESameTest[HoldPattern[_ + _] -> 0, HoldPattern[_ + _] -> 0], 
 EComment["Use the pattern:"], ESameTestBROKEN[a + b /. %, 0], 
 ESameTestBROKEN[f[a + b], 0], EComment["RefLink[Log,paclet:ref/Log][a,b] \
autoevaluates to \
RefLink[Log,paclet:ref/Log][b]/RefLink[Log,paclet:ref/Log][a], so there is a \
match: "], ESameTest[MatchQ[Log[a, b], HoldPattern[Log[_]/Log[_]]], True], 
 EComment["RefLink[Cases,paclet:ref/Cases][e,patt->rhs] finds elements that \
match patt; use RefLink[HoldPattern,paclet:ref/HoldPattern] to find rules: "]\
, ESameTest[Cases[{a -> b, c -> d}, HoldPattern[a -> _]], {a -> b}]]
