(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Exit to the enclosing \
RefLink[Catch,paclet:ref/Catch] as soon as the \
RefLink[Throw,paclet:ref/Throw] is evaluated:"], 
 ESameTest[Catch[a; b; Throw[c]; d; e], c], EComment["The result of the \
RefLink[Catch,paclet:ref/Catch] is just what is thrown by \
RefLink[Throw,paclet:ref/Throw]:"], ESameTestBROKEN[Catch[f[2] + f[11]], 
  overflow], ESameTestBROKEN[Catch[f[2] + f[3]], 8], 
 EComment["Use RefLink[Throw,paclet:ref/Throw] to exit a loop when a \
criterion is satisfied:"], 
 ESameTest[Catch[Do[If[i! > 10^10, Throw[i]], {i, 100}]], 14], 
 EComment["RefLink[Catch,paclet:ref/Catch] can catch a \
RefLink[Throw,paclet:ref/Throw] from inside essentially any function:"], 
 ESameTest[Catch[(If[#1 < 0, Throw[#1]] & ) /@ {1, 2, 0, -1, 5, 6}], -1], 
 ESameTest[Catch[{a, Throw[b], c}], b], 
 ESameTest[Catch[a^2 + b^2 + c^2 /. b :> Throw[bbb]], bbb], 
 EComment["The nearest enclosing RefLink[Catch,paclet:ref/Catch] catches the \
RefLink[Throw,paclet:ref/Throw]:"], 
 ESameTest[Catch[{Catch[{a, Throw[b], c}], d, e}], {b, d, e}], 
 EComment["RefLink[Catch,paclet:ref/Catch] picks up the first \
RefLink[Throw,paclet:ref/Throw] that is evaluated:"], 
 ESameTest[Catch[{Throw[a], Throw[b], Throw[c]}], a], 
 ESameTest[Catch[Throw /@ {a, b, c}], a], 
 ESameTestBROKEN[Catch[Sum[f[i], {i, 5, -5, -1}]], negative], 
 ESameTestBROKEN[ff /@ {-1, 0, 1}, {Indeterminate, Infinity, 1}], 
 EComment["Catch the RefLink[Throw,paclet:ref/Throw] with tag u:"], 
 ESameTest[Catch[Throw[a, u], u], a], EComment["The inner \
RefLink[Catch,paclet:ref/Catch] catches the RefLink[Throw,paclet:ref/Throw]:"]\
, ESameTest[Catch[f[Catch[Throw[a, u], u]], v], f[a]], 
 EComment["The outer RefLink[Catch,paclet:ref/Catch] catches the \
RefLink[Throw,paclet:ref/Throw]:"], 
 ESameTest[Catch[f[Catch[Throw[a, u], v]], u], a], 
 EComment["Keep the tag local:"], 
 ESameTest[Module[{u}, Catch[Throw[a, u], u]], a], 
 EComment["Find the next prime after 10^10:"], 
 ESameTest[Catch[Do[If[PrimeQ[i], Throw[i]], {i, 10^10, 10^10 + 1000}]], 
  10000000019], EComment["Find the first power of 17 equal to 1 mod 19:"], 
 ESameTest[Catch[Do[If[Mod[17^i, 19] == 1, Throw[i]], {i, 19}]], 9], 
 EComment["Stop if an iteration gets too large:"], 
 ESameTest[NestList[#1^2 + 1 & , 2, 6], {2, 5, 26, 677, 458330, 210066388901, 
   44127887745906175987802}], 
 ESameTest[Catch[NestList[If[#1 > 1000, Throw[#1], #1^2 + 1] & , 2, 6]], 
  458330], EComment["Use RefLink[Check,paclet:ref/Check] to throw an \
exception if a message is generated:"], 
 ESameTest[Catch[2 + Check[1/(1 + 1/0), Throw[error]]], error], 
 ESameTest[Catch[2 + Check[1/(1 + 1/2), Throw[error]]], 8/3]]
