(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[
  "Use RefLink[Part,paclet:ref/Part] to extract the first column vector: "], 
 TapTestSame[{{1, 2}, {3, 4}}[[All,1]], {1, 3}], 
 TapComment["Use RefLink[Take,paclet:ref/Take] to extract the column matrix: \
"], TapTestSame[Take[{{1, 2}, {3, 4}}, All, {1}], {{1}, {3}}], 
 TapComment["Normally, plots drop outlying points:"], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Exp[-x^2 - y^2], {x, -3, 3}, 
    {y, -3, 3}]], $Failed], 
 TapComment["Choose the range to show all the existing points:"], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Exp[-x^2 - y^2], {x, -3, 3}, 
    {y, -3, 3}, PlotRange -> All]], $Failed]]
