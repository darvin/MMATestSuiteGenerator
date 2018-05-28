ESimpleExamples[ESameTest[Sqrt[2], Sqrt[2]], 
 EComment["Evaluate numerically to any precision:"], 
 ESameTest[N[Sqrt[2], 50], 
  1.4142135623730950488016887242096980785696718753769`49.150514997832], 
 EComment["Negative numbers have imaginary square roots:"], 
 ESameTest[Sqrt[-25], 5*I], 
 EComment["RefLink[Sqrt,paclet:ref/Sqrt] threads element-wise over lists:"], 
 ESameTest[Sqrt[{2, 3, 4, 5}], {Sqrt[2], Sqrt[3], 2, Sqrt[5]}], 
 ESameTestBROKEN[HoldComplete[Plot[Sqrt[x], {x, 0, 10}]], $Failed], 
 EComment["Sqrt[x^2] is not automatically replaced by x:"], 
 ESameTest[Sqrt[x^2], Sqrt[x^2]], 
 EComment["It can be simplified to x if one assumes x>0:"], 
 ESameTestBROKEN[Simplify[%, x > 0], x], 
 EComment["Enter Sqrt[x] using Ctrl+2:"], ESameTest[Sqrt[100], 10], 
 EComment["Exact roots are factored out when possible:"], 
 ESameTest[Sqrt[8], 2*Sqrt[2]], 
 EComment["Find square roots of complex numbers:"], 
 ESameTestBROKEN[Sqrt[2.5 + I], 1.6113 + 0.310308*I], 
 EComment["Roots of a quadratic polynomial:"], 
 ESameTestBROKEN[Reduce[a*x^2 + b*x + c == 0, x], 
  (a != 0 && (x == (-b - Sqrt[b^2 - 4*a*c])/(2*a) || 
     x == (-b + Sqrt[b^2 - 4*a*c])/(2*a))) || (a == 0 && b != 0 && 
    x == -(c/b)) || (c == 0 && b == 0 && a == 0)], 
 EComment["Generate periodic continued fractions:"], 
 ESameTest[ContinuedFraction[Sqrt[19]], {4, {2, 1, 3, 1, 2, 8}}], 
 ESameTest[ContinuedFraction[Sqrt[19], 20], {4, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 
   2, 8, 2, 1, 3, 1, 2, 8, 2}], ESameTestBROKEN[
  HoldComplete[ListPlot[%, Filling -> Axis]], $Failed], 
 EComment["Reduce combinations of square roots:"], 
 ESameTest[RootReduce[Sqrt[2] + Sqrt[3]], Root[1 - 10*#1^2 + #1^4 & , 4]], 
 EComment["Evaluate power series involving square roots:"], 
 ESameTest[Series[Sqrt[Sin[x]], {x, 0, 5}], Sqrt[x] - x^(5/2)/12 + 
   x^(9/2)/1440 + O[x]^(11/2)], ESameTest[ComplexExpand[Sqrt[x + I*y]], 
  (x^2 + y^2)^(1/4)*Cos[(1/2)*Arg[x + I*y]] + I*(x^2 + y^2)^(1/4)*
    Sin[(1/2)*Arg[x + I*y]]], 
 EComment["Factor polynomials with square roots in coefficients:"], 
 ESameTest[Expand[(x + Sqrt[2])^2], 2 + 2*Sqrt[2]*x + x^2], 
 ESameTestBROKEN[Factor[%, Extension -> Automatic], (Sqrt[2] + x)^2], 
 EComment["RefLink[Simplify,paclet:ref/Simplify] handles expressions \
involving square roots:"], ESameTest[Simplify[Sqrt[1 + Sqrt[x^2]], x > 0], 
  Sqrt[1 + x]], EComment["There are many subtle issues in handling square \
roots for arbitrary complex arguments:"], 
 ESameTest[FunctionExpand[Sqrt[-z^2]], Sqrt[-z]*Sqrt[z]], 
 EComment["RefLink[PowerExpand,paclet:ref/PowerExpand] expands forms \
involving square roots:"], ESameTest[PowerExpand[Sqrt[x*y], 
   Assumptions -> True], E^(I*Pi*Floor[1/2 - Arg[x]/(2*Pi) - Arg[y]/(2*Pi)])*
   Sqrt[x]*Sqrt[y]], 
 EComment["It generically assumes that all variables are positive:"], 
 ESameTest[PowerExpand[Sqrt[x*y]], Sqrt[x]*Sqrt[y]], 
 ESameTest[Element[{1, Sqrt[2], 3 + Sqrt[5]}, Algebraics], True], 
 EComment["Take limits accounting for branch cuts:"], 
 ESameTest[Limit[Sqrt[-1 + I*x], x -> 0, Direction -> 1], -I], 
 ESameTest[Limit[Sqrt[-1 + I*x], x -> 0, Direction -> -1], I], 
 EComment["Square root is discontinuous across its branch cut along the \
negative real axis:"], ESameTestBROKEN[{Sqrt[-1 + 0.01*I], 
   Sqrt[-1 - 0.01*I]}, {0.00499994 + 1.00001*I, 0.00499994 - 1.00001*I}], 
 ESameTestBROKEN[HoldComplete[Plot3D[Im[Sqrt[x + I*y]], {x, -1, 1}, 
    {y, -1, 1}]], $Failed], EComment["RefLink[Sqrt,paclet:ref/Sqrt][x^2] \
cannot automatically be reduced to x:"], ESameTest[Sqrt[x^2], Sqrt[x^2]], 
 ESameTest[Sqrt[(-4)^2], 4], 
 EComment["With x assumed positive, the simplification can be done:"], 
 ESameTest[Simplify[Sqrt[x^2], x > 0], x], 
 EComment["Use RefLink[PowerExpand,paclet:ref/PowerExpand] to do the formal \
reduction:"], ESameTest[PowerExpand[Sqrt[x^2]], x], 
 EComment["Along the branch cut, these are not the same:"], 
 ESameTest[{1/Sqrt[z], Sqrt[1/z]} /. z -> -1, {-I, I}], 
 EComment["Approximation to RefLink[GoldenRatio,paclet:ref/GoldenRatio]:"], 
 ESameTest[Nest[Sqrt[1 + #1] & , 1, 10], 
  Sqrt[
   1 + 
    Sqrt[
     1 + Sqrt[1 + Sqrt[1 + Sqrt[1 + Sqrt[1 + Sqrt[1 + Sqrt[
                 1 + Sqrt[1 + Sqrt[2]]]]]]]]]]], 
 ESameTestBROKEN[N[%], 1.61803], 
 EComment["Riemann surface for square root:"], 
 ESameTestBROKEN[HoldComplete[ParametricPlot3D[{x^2 - y^2, 2*x*y, x}, 
    {x, -1, 1}, {y, -1, 1}]], $Failed]]
