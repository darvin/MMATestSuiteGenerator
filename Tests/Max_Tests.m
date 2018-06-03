(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Maximum of two numbers:"], TapTestSame[Max[9, 2], 9], 
 TapComment["Maximum of a list:"], TapTestSame[Max[{4, 1, 7, 2}], 7], 
 TapComment[
  "RefLink[Max,paclet:ref/Max] works with exact numeric quantities:"], 
 TapTestSame[Max[{Pi, E, Sqrt[2]}], Pi], 
 TapComment[
  "RefLink[Max,paclet:ref/Max] effectively flattens out all lists:"], 
 TapTestSame[Max[{3, 4, 1}, {2, 2}, 7], 7], TapTestSameBROKEN[Max[mat], 6], 
 TapComment["The maxima of all rows:"], TapTestSameBROKEN[Max /@ mat, 
  {2, 6, 0}], TapComment["The maxima of all columns:"], 
 TapTestSameBROKEN[Max /@ Transpose[mat], {0, 2, 4, 6}], 
 TapComment["Basic symbolic simplification is done automatically:"], 
 TapTestSame[Max[x, y, Max[x, z]], Max[x, y, z]], 
 TapComment["Simplify a symbolic RefLink[Max,paclet:ref/Max]:"], 
 TapTestSame[Simplify[Max[1 - x, x, 1 + x]], Max[1 - x, 1 + x]], 
 TapComment["Integrate expressions involving RefLink[Max,paclet:ref/Max]:"], 
 TapTestSameBROKEN[Integrate[Max[Sin[x], Cos[x]], {x, 0, Pi}], 1 + Sqrt[2]], 
 TapTestSameBROKEN[Integrate[Exp[Max[x, a - x]], {x, 0, 1}], 
  Inequality[Piecewise[-1] + E*a, LessEqual, 0*(-1 + E)*E^(-1 + a)*a, 
   GreaterEqual, 2*E - 2*E^(a/2) + E^a*True]], 
 TapTestSameBROKEN[HoldComplete[Plot[Max[Sin[x], Cos[x]], {x, 0, 2*Pi}, 
    PlotRange -> All]], $Failed], 
 TapComment["Reduce inequalities involving RefLink[Max,paclet:ref/Max]:"], 
 TapTestSameBROKEN[Reduce[{Max[Sin[x], Cos[x]] > 0, 0 < x < 20}, x], 
  0 < x < Pi || (3*Pi)/2 < x < 3*Pi || (7*Pi)/2 < x < 5*Pi || 
   (11*Pi)/2 < x < 20], TapComment[
  "RefLink[Max,paclet:ref/Max] works on sparse arrays:"], 
 TapTestSame[Max[SparseArray[{1 -> x, 2 -> y}, 10]], Max[0, x, y]], 
 TapComment["Use in bounds of iterator variables:"], 
 TapTestSame[Table[i*j*k, {i, 3}, {j, 3}, {k, Max[i, j], 3}], 
  {{{1, 2, 3}, {4, 6}, {9}}, {{4, 6}, {8, 12}, {18}}, {{9}, {18}, {27}}}], 
 TapComment["Cumulative maxima:"], 
 TapTestSame[Rest[FoldList[Max, 0, {4, 2, 8, 3, 9, 12, 11, 18, 10}]], 
  {4, 4, 8, 8, 9, 12, 12, 18, 18}], 
 TapComment["Find the highest point of a plotted curve:"], 
 TapTestSameBROKEN[HoldComplete[Plot[Sin[x] + Sin[Sqrt[3]*x], 
    {x, 0, 20*Pi}]], $Failed], TapTestSameBROKEN[
  Max[Last /@ Level[Cases[%, _Line, Infinity], {-2}]], 1.9922], 
 TapComment["Mean of the length ratio of a randomly broken stick:"], 
 TapTestSame[Integrate[Min[x, 1 - x]/Max[x, 1 - x], {x, 0, 1}], 
  -1 + 2*Log[2]], TapComment["R-function-based solid modeling:"], 
 TapTestSameBROKEN[HoldComplete[RegionPlot3D[
    Max[y^3 + y*z - x^2, x*z + y*(y^2 - z)] > 0, {x, -3, 3}, {y, -3, 3}, 
    {z, -3, 3}]], $Failed], TapTestSame[Max[], -Infinity], 
 TapComment["RefLink[Max,paclet:ref/Max] is RefLink[Flat,paclet:ref/Flat] and \
RefLink[Orderless,paclet:ref/Orderless]:"], TapTestSame[Max[Max[z, y], x], 
  Max[x, y, z]], TapTestSameBROKEN[PiecewiseExpand[Max[Min[x, y], z]], 
  Piecewise[x]*x - y <= 0 && x - z > 0*y*x - y > 0 && y - z > 0*z*True], 
 TapComment["Use RefLink[FullSimplify,paclet:ref/FullSimplify] to simplify \
RefLink[Max,paclet:ref/Max] expressions:"], 
 TapTestSameBROKEN[FullSimplify[Max[x, y] - Max[-x, -y]], 
  Piecewise[2]*y*x == y*x + y*True], 
 TapTestSame[FullSimplify[Min[x, y] - (x + 2*y - Sqrt[(x - y)^2])/2, 
   Element[{x, y}, Reals]], -(y/2)], 
 TapComment["Maximize a function containing RefLink[Max,paclet:ref/Max]:"], 
 TapTestSame[Maximize[Max[-x^2 + 2*x + 2, -x^4 + 3*x + 2], x], 
  {2 + (9*3^(1/3))/(4*2^(2/3)), {x -> 3^(1/3)/2^(2/3)}}], 
 TapComment["RefLink[Max,paclet:ref/Max] can be differentiated:"], 
 TapTestSame[Derivative[1][Max][x], 1], TapTestSameBROKEN[
  Derivative[1, 0][Max], Piecewise[1]*#1 - #2 >= 0*0*True & ], 
 TapComment["RefLink[Max,paclet:ref/Max] flattens lists, rather than being \
RefLink[Listable,paclet:ref/Listable]:"], TapTestSame[Max[{a, b}, {c, d}], 
  Max[a, b, c, d]], TapComment[
  "The one-argument form evaluates for any argument:"], 
 TapTestSame[Max[I], I], TapComment["Two-dimensional sublevel sets: "], 
 TapTestSameBROKEN[HoldComplete[Table[RegionPlot[Max[x, y] < t, {x, -2, 2}, 
     {y, -2, 2}, PlotLabel -> Max[x, y] < t], {t, {-1, 0, 1}}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Table[RegionPlot[Max[x, y] > t, {x, -2, 2}, 
     {y, -2, 2}, PlotLabel -> Max[x, y] > t], {t, {-1, 0, 1}}]], $Failed], 
 TapComment["Three-dimensional sublevel sets: "], 
 TapTestSameBROKEN[HoldComplete[Table[RegionPlot3D[Max[x, y, z] < t, 
     {x, -2, 2}, {y, -2, 2}, {z, -2, 2}, PlotLabel -> Max[x, y, z] < t], 
    {t, {-1, 0, 1}}]], $Failed], TapTestSameBROKEN[
  HoldComplete[Table[RegionPlot3D[Max[x, y, z] > t, {x, -2, 2}, {y, -2, 2}, 
     {z, -2, 2}, PlotLabel -> Max[x, y, z] > t], {t, {-1, 0, 1}}]], $Failed]]
