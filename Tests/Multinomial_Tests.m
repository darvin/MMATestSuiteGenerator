(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Multinomial[1, 2, 1], 12], 
 EComment[
  "The 1, 2, 1 multinomial coefficient appears as the coefficient of x y^2 \
z:"], ESameTest[Expand[(x + y + z)^4], x^4 + 4*x^3*y + 6*x^2*y^2 + 4*x*y^3 + 
   y^4 + 4*x^3*z + 12*x^2*y*z + 12*x*y^2*z + 4*y^3*z + 6*x^2*z^2 + 
   12*x*y*z^2 + 6*y^2*z^2 + 4*x*z^3 + 4*y*z^3 + z^4], 
 EComment["Special cases evaluate for symbolic arguments:"], 
 ESameTest[Multinomial[k, 2, 3], (1/12)*(1 + k)*(2 + k)*(3 + k)*(4 + k)*
   (5 + k)], ESameTestBROKEN[Multinomial[k, 2, 3, 4], 
  (1/288)*(1 + k)*(2 + k)*(3 + k)*(4 + k)*(5 + k)*(6 + k)*(7 + k)*(8 + k)*
   (9 + k)], EComment["Evaluate with any number of arguments:"], 
 ESameTest[Multinomial[1, 1, 1, 1, 1, 1], 720], ESameTest[Multinomial[1], 1], 
 EComment["Evaluate for large integer arguments:"], 
 ESameTestBROKEN[HoldComplete[Short[Multinomial[10000, 10000, 10000]]], 
  $Failed], EComment["Evaluate for half-integer arguments:"], 
 ESameTest[Multinomial[7/2, 5/2, 3/2], 858/Pi], 
 EComment["Numerical generalization:"], 
 ESameTestBROKEN[Multinomial[3.4, 5.6, -6.2], 0.0425836], 
 EComment["Evaluate for complex arguments:"], 
 ESameTestBROKEN[Multinomial[2 + I, -1 + 2*I, 4.5 - 3*I], 
  71.4198 - 72.6792*I], EComment["Series expansion at a generic point:"], 
 ESameTestBROKEN[Simplify[Series[Multinomial[n, k, j], {k, 2, 1}]], 
  Multinomial[2, j, n] + (1/2)*(-3 + 2*HarmonicNumber[2 + j + n])*
    Multinomial[2, j, n]*(k - 2) + O[k - 2]^2], 
 EComment["RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 ESameTestBROKEN[HoldComplete[(m + n + p ; n, m, p)], $Failed], 
 EComment["RefLink[Multinomial,paclet:ref/Multinomial] threads element-wise \
over lists:"], ESameTest[Multinomial[{2, 3, 5, 7, 11}, 3, 5], 
  {2520, 9240, 72072, 360360, 4232592}], 
 EComment["Illustrate the multinomial theorem: "], 
 ESameTest[Sum[KroneckerDelta[4 - (n1 + n2 + n3)]*Multinomial[n1, n2, n3]*
    x^n1*y^n2*z^n3, {n1, 0, 4}, {n2, 0, 4}, {n3, 0, 4}], 
  x^4 + 4*x^3*y + 6*x^2*y^2 + 4*x*y^3 + y^4 + 4*x^3*z + 12*x^2*y*z + 
   12*x*y^2*z + 4*y^3*z + 6*x^2*z^2 + 12*x*y*z^2 + 6*y^2*z^2 + 4*x*z^3 + 
   4*y*z^3 + z^4], ESameTestBROKEN[Factor[%], (x + y + z)^4], 
 EComment["Plot isosurfaces of the number of ways to put Subscript[n, \
1]+Subscript[n, 2]+Subscript[n, 3] elements in three boxes:"], 
 ESameTestBROKEN[HoldComplete[ContourPlot3D[Log[Multinomial[n1, n2, n3]], 
    {n1, 1, 6}, {n2, 1, 6}, {n3, 1, 6}]], $Failed], 
 ESameTestBROKEN[HoldComplete[ListPlot3D[
    Flatten[Table[{n1, n2, p[20, {n1, n2, 20 - n1 - n2}, {0.4, 0.3, 0.3}]}, 
      {n1, 0, 20}, {n2, 0, 20}], 1], PlotRange -> All]], $Failed], 
 EComment["Volume of a hyper-super-ellipsoid \
\\!\\(\n\\*SubsuperscriptBox[\\(\\[Sum]\\), \\(k = 1\\), \
\\(d\\)]\n\\*SuperscriptBox[\\(\\[LeftBracketingBar]\n\\*SubscriptBox[\\(x\\)\
, \\(k\\)]\\[RightBracketingBar]\\), \nSubscriptBox[\\(p\\), \\(k\\)]]\\)<1 \
is 2^d/(\\!\\(\n\\*SubsuperscriptBox[\\(\\[Sum]\\), \\(k = 1\\), \
\\(d\\)]\n\\*SubsuperscriptBox[\\(p\\), \\(k\\), \
\\(-1\\)]\\);Subsuperscript[p, 1, -1],\\[Ellipsis],Subsuperscript[p, d, \
-1]):"], ESameTestBROKEN[2^4/Multinomial[1/4, 1/2, 1/2, 1/2], 
  (2*Pi^(3/2)*Gamma[5/4])/Gamma[11/4]], 
 EComment["Compare with direct integration:"], 
 ESameTestBROKEN[$Failed, HoldComplete[0]], 
 ESameTestBROKEN[FullSimplify[% == %%], False], 
 EComment["With two arguments, RefLink[Multinomial,paclet:ref/Multinomial] \
gives binomial coefficients:"], ESameTest[Binomial[10, 3], 120], 
 ESameTest[Multinomial[7, 3], 120], 
 EComment["Use RefLink[FullSimplify,paclet:ref/FullSimplify] to simplify \
expressions involving multinomial coefficients:"], 
 ESameTest[FullSimplify[Multinomial[n1, n2, n3]/Multinomial[n2 - 1, n1 + 1, 
     n3]], (1 + n1)/n2], EComment["Use \
RefLink[FunctionExpand,paclet:ref/FunctionExpand] to expand into \
RefLink[Gamma,paclet:ref/Gamma] functions:"], 
 ESameTest[FunctionExpand[Multinomial[n1, n2, n3, n4]], 
  Gamma[1 + n1 + n2 + n3 + n4]/(Gamma[1 + n1]*Gamma[1 + n2]*Gamma[1 + n3]*
    Gamma[1 + n4])], EComment["RefLink[Multinomial,paclet:ref/Multinomial] is \
RefLink[Orderless,paclet:ref/Orderless]:"], 
 ESameTest[Multinomial[b, a, c, d], Multinomial[a, b, c, d]], 
 EComment[
  "Large arguments can give results too large to be computed explicitly:"], 
 ESameTestBROKEN[Multinomial[10.^10, 10.^10, 10.^10], Indeterminate], 
 EComment["Machine-number inputs can give high-precision results:"], 
 ESameTestBROKEN[Multinomial[10.^6, 10.^5, 10.^4], 1.70188741*10^170303], 
 ESameTest[MachineNumberQ[%], False], EComment["As a multivariate function, \
RefLink[Multinomial,paclet:ref/Multinomial] is not continuous in all \
variables at negative integers:"], ESameTestBROKEN[Multinomial[-5, 3], 
  Indeterminate], ESameTestBROKEN[Multinomial[-5.000001, 3.000000000001], 
  -4.00001], ESameTestBROKEN[Multinomial[-5.000000000001, 3.000000000001], 
  0], ESameTest[Multinomial[-5.000000001, 3.000000001], ComplexInfinity], 
 EComment["Trinomials mod 2:"], ESameTestBROKEN[
  HoldComplete[Graphics3D[Cuboid /@ 
     Position[Table[Mod[Multinomial[i, j, k], 2], {i, 30}, {j, 30}, {k, 30}], 
      1]]], $Failed], ESameTestBROKEN[
  HoldComplete[Graphics3D[Cuboid /@ 
     Position[Table[Mod[Multinomial[30 - i, 30 - j, 30 - k], 2], {i, 30}, 
       {j, 30}, {k, 30}], 1]]], $Failed], EComment["Modulo 3:"], 
 ESameTestBROKEN[HoldComplete[Graphics3D[
    Cuboid /@ Position[Table[Mod[Multinomial[i, j, k], 3], {i, 30}, {j, 30}, 
       {k, 30}], 1]]], $Failed], 
 EComment["Nested multinomials over the complex plane: "], 
 ESameTestBROKEN[HoldComplete[DensityPlot[
    Arg[Nest[Multinomial[#1, #1] & , x + I*y, 3]], {x, 1/2, 5/2}, 
    {y, -3/2, 3/2}, Exclusions -> {}]], $Failed], 
 EComment[
  "Plot RefLink[Multinomial,paclet:ref/Multinomial] for complex arguments: "]\
, ESameTestBROKEN[HoldComplete[DensityPlot[
    Arg[Multinomial[4.1*Exp[I*\[Phi]1], 2.2*Exp[I*\[Phi]2]]], 
    {\[Phi]1, -Pi, Pi}, {\[Phi]2, -Pi, Pi}, Exclusions -> {}]], $Failed]]
