(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Minimum of two numbers:"], TapTestSame[Min[9, 2], 2], 
 TapComment["Minimum of a list:"], TapTestSame[Min[{4, 1, 7, 2}], 1], 
 TapComment[
  "RefLink[Min,paclet:ref/Min] works with exact numeric quantities:"], 
 TapTestSame[Min[{Pi, E, Sqrt[2]}], Sqrt[2]], 
 TapComment[
  "RefLink[Min,paclet:ref/Min] effectively flattens out all lists:"], 
 TapTestSame[Min[{3, 4, 1}, {2, 2}, 7], 1], 
 TapComment["The minimum of all elements of a matrix:"], 
 TapTestSameBROKEN[mat = {{-1, 0, 1, 2}, {0, 2, 4, 6}, {-3, -2, -1, 0}} ;; 
    Min[mat], -3], TapComment["The minima of all rows:"], 
 TapTestSameBROKEN[Min /@ mat, {-1, 0, -3}], 
 TapComment["The minima of all columns:"], 
 TapTestSameBROKEN[Min /@ Transpose[mat], {-3, -2, -1, 0}], 
 TapComment["Basic symbolic simplification is done automatically:"], 
 TapTestSame[Min[x, y, Min[x, z]], Min[x, y, z]], 
 TapComment["Simplify a symbolic RefLink[Min,paclet:ref/Min]:"], 
 TapTestSame[Simplify[Min[1 - x, x, 1 + x]], Min[1 - x, x]], 
 TapComment["Integrate expressions involving RefLink[Min,paclet:ref/Min]:"], 
 TapTestSame[FullSimplify[Integrate[Min[Sin[x], Cos[x]], {x, 0, Pi}]], 
  1 - Sqrt[2]], TapTestSameBROKEN[Integrate[Exp[Min[x, a - x]], {x, 0, 1}], 
  Inequality[Piecewise[-1] + E*a, GreaterEqual, 2*(-1 + E)*E^(-1 + a)*a, 
   LessEqual, 0*((-E + 2*E^(1 + a/2) - E^a)/E)*True]], 
 TapTestSameBROKEN[HoldComplete[Plot[Min[Sin[x], Cos[x]], {x, 0, 2*Pi}, 
    PlotRange -> All]], $Failed], 
 TapComment["Reduce inequalities involving RefLink[Min,paclet:ref/Min]:"], 
 TapTestSame[Reduce[{Min[Sin[x], Cos[x]] > 0, 0 < x < 20}, x], 
  0 < x < Pi/2 || 2*Pi < x < (5*Pi)/2 || 4*Pi < x < (9*Pi)/2 || 
   6*Pi < x < 20], TapComment[
  "RefLink[Min,paclet:ref/Min] works on sparse arrays:"], 
 TapTestSame[Min[SparseArray[{1 -> x, 2 -> y}, 10]], Min[0, x, y]], 
 TapComment["Use in bounds of iterator variables:"], 
 TapTestSame[Table[i*j*k, {i, 3}, {j, 3}, {k, Min[i, j], 3}], 
  {{{1, 2, 3}, {2, 4, 6}, {3, 6, 9}}, {{2, 4, 6}, {8, 12}, {12, 18}}, 
   {{3, 6, 9}, {12, 18}, {27}}}], TapComment["Cumulative minima:"], 
 TapTestSame[Rest[FoldList[Min, Infinity, {10, 18, 16, 22, 12, 30, 6, 24, 24, 
     2}]], {10, 10, 10, 10, 10, 10, 6, 6, 6, 2}], 
 TapComment["Find the lowest point of a plotted curve:"], 
 TapTestSameBROKEN[HoldComplete[Plot[Sin[x] + Sin[Sqrt[3]*x], 
    {x, 0, 20*Pi}]], $Failed], TapTestSameBROKEN[
  Min[Last /@ Level[Cases[%, _Line, Infinity], {-2}]], -1.99914], 
 TapComment["Mean of the length ratio of a randomly broken stick:"], 
 TapTestSame[Integrate[Min[x, 1 - x]/Max[x, 1 - x], {x, 0, 1}], 
  -1 + 2*Log[2]], TapComment["R-function-based solid modeling:"], 
 TapTestSameBROKEN[HoldComplete[RegionPlot3D[Min[x - y*z, y - z, x + z^2] > 
     0, {x, -3, 3}, {y, -3, 3}, {z, -3, 3}]], $Failed], 
 TapTestSame[Min[], Infinity], TapComment["RefLink[Min,paclet:ref/Min] is \
RefLink[Flat,paclet:ref/Flat] and RefLink[Orderless,paclet:ref/Orderless]:"], 
 TapTestSame[Min[Min[z, y], x], Min[x, y, z]], 
 TapTestSameBROKEN[PiecewiseExpand[Max[Min[x, y], z]], 
  Piecewise[x]*x - y <= 0 && x - z > 0*y*x - y > 0 && y - z > 0*z*True], 
 TapComment["Use RefLink[FullSimplify,paclet:ref/FullSimplify] to simplify \
RefLink[Min,paclet:ref/Min] expressions:"], 
 TapTestSameBROKEN[FullSimplify[Max[x, y] - Min[-x, -y]], 
  Piecewise[2]*x*x >= y*2*y*True], 
 TapTestSame[FullSimplify[Min[x, y] - (x + 2*y - Sqrt[(x - y)^2])/2, 
   Element[{x, y}, Reals]], -(y/2)], 
 TapComment["Minimize a function containing RefLink[Min,paclet:ref/Min]:"], 
 TapTestSame[Minimize[Min[x^2 + 2*x + 2, x^4 - 3*x + 2], x], 
  {2 - (9*3^(1/3))/(4*2^(2/3)), {x -> 3^(1/3)/2^(2/3)}}], 
 TapComment["RefLink[Min,paclet:ref/Min] can be differentiated:"], 
 TapTestSame[Derivative[1][Min][x], 1], TapTestSameBROKEN[
  Derivative[1, 0][Min], Piecewise[1]*#1 - #2 <= 0*0*True & ], 
 TapComment["RefLink[Min,paclet:ref/Min] flattens lists, rather than being \
RefLink[Listable,paclet:ref/Listable]:"], TapTestSame[Min[{a, b}, {c, d}], 
  Min[a, b, c, d]], TapComment[
  "One-argument form evaluates for any argument:"], TapTestSame[Min[I], I], 
 TapComment["Two-dimensional sublevel sets: "], 
 TapTestSameBROKEN[HoldComplete[Table[RegionPlot[Min[x, y] < t, {x, -2, 2}, 
     {y, -2, 2}, PlotLabel -> Min[x, y] < t], {t, {-1, 0, 1}}]], $Failed], 
 TapTestSameBROKEN[$Failed, $Failed], 
 TapComment["Three-dimensional sublevel sets: "], 
 TapTestSameBROKEN[HoldComplete[Table[RegionPlot3D[Min[x, y, z] < t, 
     {x, -2, 2}, {y, -2, 2}, {z, -2, 2}, PlotLabel -> Min[x, y, z] < t], 
    {t, {-1, 0, 1}}]], $Failed], TapTestSameBROKEN[
  HoldComplete[Table[RegionPlot3D[Min[x, y, z] > t, {x, -2, 2}, {y, -2, 2}, 
     {z, -2, 2}, PlotLabel -> Min[x, y, z] > t], {t, {-1, 0, 1}}]], $Failed]]
