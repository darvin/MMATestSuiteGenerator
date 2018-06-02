(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Set up a pattern whose left-hand side is kept unevaluated:"], 
 TapTestSame[HoldPattern[_ + _] -> 0, HoldPattern[_ + _] -> 0], 
 TapComment["Use the pattern:"], TapTestSameBROKEN[a + b /. %, 0], 
 TapTestSameBROKEN[f[a + b], 0], TapComment["RefLink[Log,paclet:ref/Log][a,b] \
autoevaluates to \
RefLink[Log,paclet:ref/Log][b]/RefLink[Log,paclet:ref/Log][a], so there is a \
match: "], TapTestSame[MatchQ[Log[a, b], HoldPattern[Log[_]/Log[_]]], True], 
 TapComment["RefLink[Cases,paclet:ref/Cases][e,patt->rhs] finds elements that \
match patt; use RefLink[HoldPattern,paclet:ref/HoldPattern] to find rules: "]\
, TapTestSame[Cases[{a -> b, c -> d}, HoldPattern[a -> _]], {a -> b}]]
