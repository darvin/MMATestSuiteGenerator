(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[
  "RefLink[Throw,paclet:ref/Throw] works inside \
RefLink[Scan,paclet:ref/Scan]:"], 
 ESameTest[Catch[Scan[If[#1 > 5, Throw[#1]] & , {2, 4, 6, 8}]], 6], 
 ESameTestBROKEN[{u[76], u[77], u[78]}, {u[76], x, u[78]}], 
 EComment["Find all leaves in an expression:"], 
 ESameTestBROKEN[Integrate[1/(x^3 - 1), x], 
  -(ArcTan[(1 + 2*x)/Sqrt[3]]/Sqrt[3]) + (1/3)*Log[-1 + x] - 
   (1/6)*Log[1 + x + x^2]], ESameTestBROKEN[Reap[Scan[Sow, %, {-1}]][[2,1]], 
  {-1, 3, -(1/2), 3, -(1/2), 1, 2, x, 1/3, -1, x, -(1/6), 1, x, x, 2}], 
 EComment["RefLink[Scan,paclet:ref/Scan] does the same as \
RefLink[Map,paclet:ref/Map], but without returning a result:"], 
 ESameTest[Print /@ {a, b, c}, {Null, Null, Null}], 
 EComment["Use RefLink[Sow,paclet:ref/Sow] and RefLink[Reap,paclet:ref/Reap] \
to collect results:"], 
 ESameTest[Reap[Scan[If[#1 > 0, Sow[#1]] & , {1, {-2, Pi}, -Sqrt[3]}, 
     Infinity]][[2,1]], {1, Pi, 3, 1/2, Sqrt[3]}]]
