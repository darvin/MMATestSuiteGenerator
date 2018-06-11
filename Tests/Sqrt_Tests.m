(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[Sqrt[2]]], 
 TapComment["Evaluate numerically to any precision:"], 
 TapTestSameBROKEN[N[Sqrt[2], 50], 
  1.4142135623730950488016887242096980785696718753769`49.150514997832], 
 TapComment["Negative numbers have imaginary square roots:"], 
 TapTestSame[Sqrt[-25], 5*I], 
 TapComment[
  "RefLink[Sqrt,paclet:ref/Sqrt] threads element-wise over lists:"], 
 TapTestSame[Sqrt[{2, 3, 4, 5}], {Sqrt[2], Sqrt[3], 2, Sqrt[5]}], 
 TapTestSame[HoldComplete[Plot[Sqrt[x], {x, 0, 10}]], $Failed], 
 TapComment["Sqrt[x^2] is not automatically replaced by x:"], 
 TapTestSame[Sqrt[x^2], Sqrt[x^2]], 
 TapComment["It can be simplified to x if one assumes x>0:"], 
 TapTestSameBROKEN[Simplify[%, x > 0], x], 
 TapComment["Enter Sqrt[x] using Ctrl+2:"], TapTestSame[Sqrt[100], 10], 
 TapComment["Exact roots are factored out when possible:"], 
 TapTestSame[Sqrt[8], 2*Sqrt[2]], 
 TapComment["Find square roots of complex numbers:"], 
 TapTestSame[Sqrt[2.5 + I], 1.6113 + 0.310308*I], 
 TapComment["Roots of a quadratic polynomial:"], 
 TapTestSame[Reduce[a*x^2 + b*x + c == 0, x], 
  (a != 0 && (x == (-b - Sqrt[b^2 - 4*a*c])/(2*a) || 
     x == (-b + Sqrt[b^2 - 4*a*c])/(2*a))) || (a == 0 && b != 0 && 
    x == -(c/b)) || (c == 0 && b == 0 && a == 0)], 
 TapComment["Generate periodic continued fractions:"], 
 TapTestSame[ContinuedFraction[Sqrt[19]], {4, {2, 1, 3, 1, 2, 8}}], 
 TapTestSame[ContinuedFraction[Sqrt[19], 20], {4, 2, 1, 3, 1, 2, 8, 2, 1, 3, 
   1, 2, 8, 2, 1, 3, 1, 2, 8, 2}], 
 TapTestSame[HoldComplete[ListPlot[%, Filling -> Axis]], $Failed], 
 TapComment["Reduce combinations of square roots:"], 
 TapTestSame[RootReduce[Sqrt[2] + Sqrt[3]], Root[1 - 10*#1^2 + #1^4 & , 4]], 
 TapComment["Evaluate power series involving square roots:"], 
 TapTestSame[Series[Sqrt[Sin[x]], {x, 0, 5}], Sqrt[x] - x^(5/2)/12 + 
   x^(9/2)/1440 + O[x]^(11/2)], TapTestSame[ComplexExpand[Sqrt[x + I*y]], 
  (x^2 + y^2)^(1/4)*Cos[(1/2)*Arg[x + I*y]] + I*(x^2 + y^2)^(1/4)*
    Sin[(1/2)*Arg[x + I*y]]], 
 TapComment["Factor polynomials with square roots in coefficients:"], 
 TapTestSame[Expand[(x + Sqrt[2])^2], 2 + 2*Sqrt[2]*x + x^2], 
 TapTestSameBROKEN[Factor[%, Extension -> Automatic], (Sqrt[2] + x)^2], 
 TapComment["RefLink[Simplify,paclet:ref/Simplify] handles expressions \
involving square roots:"], TapTestSame[Simplify[Sqrt[1 + Sqrt[x^2]], x > 0], 
  Sqrt[1 + x]], TapComment["There are many subtle issues in handling square \
roots for arbitrary complex arguments:"], 
 TapTestSame[FunctionExpand[Sqrt[-z^2]], Sqrt[-z]*Sqrt[z]], 
 TapComment["RefLink[PowerExpand,paclet:ref/PowerExpand] expands forms \
involving square roots:"], TapTestSame[PowerExpand[Sqrt[x*y], 
   Assumptions -> True], E^(I*Pi*Floor[1/2 - Arg[x]/(2*Pi) - Arg[y]/(2*Pi)])*
   Sqrt[x]*Sqrt[y]], TapComment[
  "It generically assumes that all variables are positive:"], 
 TapTestSame[PowerExpand[Sqrt[x*y]], Sqrt[x]*Sqrt[y]], 
 TapTestSame[Element[{1, Sqrt[2], 3 + Sqrt[5]}, Algebraics], True], 
 TapComment["Take limits accounting for branch cuts:"], 
 TapTestSame[Limit[Sqrt[-1 + I*x], x -> 0, Direction -> 1], -I], 
 TapTestSame[Limit[Sqrt[-1 + I*x], x -> 0, Direction -> -1], I], 
 TapComment["Square root is discontinuous across its branch cut along the \
negative real axis:"], TapTestSame[{Sqrt[-1 + 0.01*I], Sqrt[-1 - 0.01*I]}, 
  {0.00499994 + 1.00001*I, 0.00499994 - 1.00001*I}], 
 TapTestSameBROKEN[HoldComplete[Plot3D[Im[Sqrt[x + I*y]], {x, -1, 1}, 
    {y, -1, 1}]], $Failed], TapComment["RefLink[Sqrt,paclet:ref/Sqrt][x^2] \
cannot automatically be reduced to x:"], TapTestSame[Sqrt[x^2], Sqrt[x^2]], 
 TapTestSame[Sqrt[(-4)^2], 4], 
 TapComment["With x assumed positive, the simplification can be done:"], 
 TapTestSame[Simplify[Sqrt[x^2], x > 0], x], 
 TapComment["Use RefLink[PowerExpand,paclet:ref/PowerExpand] to do the formal \
reduction:"], TapTestSame[PowerExpand[Sqrt[x^2]], x], 
 TapComment["Along the branch cut, these are not the same:"], 
 TapTestSame[{1/Sqrt[z], Sqrt[1/z]} /. z -> -1, {-I, I}], 
 TapComment["Approximation to RefLink[GoldenRatio,paclet:ref/GoldenRatio]:"], 
 TapTestSame[Nest[Sqrt[1 + #1] & , 1, 10], 
  Sqrt[
   1 + 
    Sqrt[
     1 + Sqrt[1 + Sqrt[1 + Sqrt[1 + Sqrt[1 + Sqrt[1 + Sqrt[
                 1 + Sqrt[1 + Sqrt[2]]]]]]]]]]], 
 TapTestSameBROKEN[N[%], 1.61803], 
 TapComment["Riemann surface for square root:"], 
 TapTestSameBROKEN[HoldComplete[ParametricPlot3D[{x^2 - y^2, 2*x*y, x}, 
    {x, -1, 1}, {y, -1, 1}]], $Failed]]
