(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Exit to the enclosing RefLink[Catch,paclet:ref/Catch] as \
soon as the RefLink[Throw,paclet:ref/Throw] is evaluated:"], 
 TapTestSame[Catch[a; b; Throw[c]; d; e], c], TapComment["The result of the \
RefLink[Catch,paclet:ref/Catch] is just what is thrown by \
RefLink[Throw,paclet:ref/Throw]:"], TapTestSameBROKEN[Catch[f[2] + f[11]], 
  overflow], TapTestSameBROKEN[Catch[f[2] + f[3]], 8], 
 TapComment["Use RefLink[Throw,paclet:ref/Throw] to exit a loop when a \
criterion is satisfied:"], TapTestSame[
  Catch[Do[If[i! > 10^10, Throw[i]], {i, 100}]], 14], 
 TapComment["RefLink[Catch,paclet:ref/Catch] can catch a \
RefLink[Throw,paclet:ref/Throw] from inside essentially any function:"], 
 TapTestSame[Catch[(If[#1 < 0, Throw[#1]] & ) /@ {1, 2, 0, -1, 5, 6}], -1], 
 TapTestSame[Catch[{a, Throw[b], c}], b], 
 TapTestSame[Catch[a^2 + b^2 + c^2 /. b :> Throw[bbb]], bbb], 
 TapComment["The nearest enclosing RefLink[Catch,paclet:ref/Catch] catches \
the RefLink[Throw,paclet:ref/Throw]:"], 
 TapTestSame[Catch[{Catch[{a, Throw[b], c}], d, e}], {b, d, e}], 
 TapComment["RefLink[Catch,paclet:ref/Catch] picks up the first \
RefLink[Throw,paclet:ref/Throw] that is evaluated:"], 
 TapTestSame[Catch[{Throw[a], Throw[b], Throw[c]}], a], 
 TapTestSame[Catch[Throw /@ {a, b, c}], a], 
 TapTestSameBROKEN[Catch[Sum[f[i], {i, 5, -5, -1}]], negative], 
 TapTestSameBROKEN[ff /@ {-1, 0, 1}, {Indeterminate, Infinity, 1}], 
 TapComment["Catch the RefLink[Throw,paclet:ref/Throw] with tag u:"], 
 TapTestSame[Catch[Throw[a, u], u], a], TapComment["The inner \
RefLink[Catch,paclet:ref/Catch] catches the RefLink[Throw,paclet:ref/Throw]:"]\
, TapTestSame[Catch[f[Catch[Throw[a, u], u]], v], f[a]], 
 TapComment["The outer RefLink[Catch,paclet:ref/Catch] catches the \
RefLink[Throw,paclet:ref/Throw]:"], 
 TapTestSame[Catch[f[Catch[Throw[a, u], v]], u], a], 
 TapComment["Keep the tag local:"], 
 TapTestSame[Module[{u}, Catch[Throw[a, u], u]], a], 
 TapComment["Find the next prime after 10^10:"], 
 TapTestSame[Catch[Do[If[PrimeQ[i], Throw[i]], {i, 10^10, 10^10 + 1000}]], 
  10000000019], TapComment["Find the first power of 17 equal to 1 mod 19:"], 
 TapTestSame[Catch[Do[If[Mod[17^i, 19] == 1, Throw[i]], {i, 19}]], 9], 
 TapComment["Stop if an iteration gets too large:"], 
 TapTestSame[NestList[#1^2 + 1 & , 2, 6], {2, 5, 26, 677, 458330, 
   210066388901, 44127887745906175987802}], 
 TapTestSame[Catch[NestList[If[#1 > 1000, Throw[#1], #1^2 + 1] & , 2, 6]], 
  458330], TapComment["Use RefLink[Check,paclet:ref/Check] to throw an \
exception if a message is generated:"], 
 TapTestSame[Catch[2 + Check[1/(1 + 1/0), Throw[error]]], error], 
 TapTestSame[Catch[2 + Check[1/(1 + 1/2), Throw[error]]], 8/3]]
