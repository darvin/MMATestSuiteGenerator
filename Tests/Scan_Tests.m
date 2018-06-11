(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "RefLink[Throw,paclet:ref/Throw] works inside \
RefLink[Scan,paclet:ref/Scan]:"], 
 TapTestSame[Catch[Scan[If[#1 > 5, Throw[#1]] & , {2, 4, 6, 8}]], 6], 
 TapComment["Make assignments based on data:"], 
 TapTestSame[Scan[(u[#1] = x) & , {55, 11, 77, 88}]; {u[76], u[77], u[78]}, 
  {u[76], x, u[78]}], TapComment["Find all leaves in an expression:"], 
 TapTestSameBROKEN[Integrate[1/(x^3 - 1), x], 
  -(ArcTan[(1 + 2*x)/Sqrt[3]]/Sqrt[3]) + (1/3)*Log[-1 + x] - 
   (1/6)*Log[1 + x + x^2]], TapTestSameBROKEN[Reap[Scan[Sow, %, {-1}]][[2,
   1]], {-1, 3, -(1/2), 3, -(1/2), 1, 2, x, 1/3, -1, x, -(1/6), 1, x, x, 2}], 
 TapComment["RefLink[Scan,paclet:ref/Scan] does the same as \
RefLink[Map,paclet:ref/Map], but without returning a result:"], 
 TapTestSame[Print /@ {a, b, c}, {Null, Null, Null}], 
 TapComment["Use RefLink[Sow,paclet:ref/Sow] and \
RefLink[Reap,paclet:ref/Reap] to collect results:"], 
 TapTestSame[Reap[Scan[If[#1 > 0, Sow[#1]] & , {1, {-2, Pi}, -Sqrt[3]}, 
     Infinity]][[2,1]], {1, Pi, 3, 1/2, Sqrt[3]}]]
