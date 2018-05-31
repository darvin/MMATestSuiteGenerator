(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Table[n!, {n, 10}], {1, 2, 6, 24, 120, 720, 5040, 
   40320, 362880, 3628800}], ESameTest[50!, 
  30414093201713378043612608166064768844377641568960512000000000000], 
 EComment["Evaluate for large arguments:"], 
 ESameTestBROKEN[HoldComplete[Short[10000!]], $Failed], 
 ESameTestBROKEN[N[%], 2.846259680917055*10^35659], 
 EComment["Evaluate for half-integer arguments:"], 
 ESameTest[(1/2)!, Sqrt[Pi]/2], EComment["Plot the factorial function:"], 
 ESameTestBROKEN[HoldComplete[Plot[n!, {n, -2.5, 3}]], $Failed], 
 EComment["Evaluate numerically for complex arguments:"], 
 ESameTestBROKEN[(1.5 + I)!, 0.774762 + 0.707631*I], 
 EComment[
  "RefLink[Factorial,paclet:ref/Factorial] threads element-wise over lists:"]\
, ESameTest[{2, 3, 5, 7, 11}!, {2, 6, 120, 5040, 39916800}], 
 EComment["Series expansion at infinity (Stirling's approximation):"], 
 ESameTestBROKEN[Series[n!, {n, Infinity, 2}], 
  E^(-1 - Log[1/n])*n + O[1/n]^3*(Sqrt[2*Pi]*Sqrt[n] + 
     Sqrt[Pi/2]/(6*Sqrt[n]) + Sqrt[Pi/2]/(144*n^(3/2)) + O[1/n]^(5/2))], 
 ESameTestBROKEN[Simplify[Normal[%]], 
  ((1/144)*(1/n)^(3/2 - n)*(1 + 24*n + 288*n^2)*Sqrt[Pi/2])/E^n], 
 EComment["Series at n=1:"], ESameTestBROKEN[Series[n!, {n, 1, 2}], 
  1 + (1 - EulerGamma)*(n - 1) + (1/12)*(-12*EulerGamma + 6*EulerGamma^2 + 
     Pi^2)*(n - 1)^2 + O[n - 1]^3], EComment["Evaluate to high precision:"], 
 ESameTest[N[(22/10)!, 50], 
  2.4239654799353680120921123696905922578132100790989`49.384526430683884], 
 EComment["The precision of the output tracks the precision of the input:"], 
 ESameTest[2.2`23.342422680822207!, 
  2.4239654799353680120921`22.38452643068388], 
 ESameTest[Infinity!, Infinity], ESameTest[(-Infinity)!, Indeterminate], 
 EComment["RefLink[Factorial,paclet:ref/Factorial] allows derivatives:"], 
 ESameTest[D[n!, n], Gamma[1 + n]*PolyGamma[0, 1 + n]], 
 EComment["Make a table of half-integer factorials:"], 
 ESameTest[Table[(n - 1/2)!, {n, 10}], {Sqrt[Pi]/2, (3*Sqrt[Pi])/4, 
   (15*Sqrt[Pi])/8, (105*Sqrt[Pi])/16, (945*Sqrt[Pi])/32, 
   (10395*Sqrt[Pi])/64, (135135*Sqrt[Pi])/128, (2027025*Sqrt[Pi])/256, 
   (34459425*Sqrt[Pi])/512, (654729075*Sqrt[Pi])/1024}], 
 ESameTest[Length[Permutations[Range[6]]], 720], ESameTest[6!, 720], 
 EComment["Plot of the absolute value of \
RefLink[Factorial,paclet:ref/Factorial] in the complex plane:"], 
 ESameTestBROKEN[HoldComplete[Plot3D[Abs[(x + I*y)!], {x, -5, 2}, 
    {y, -1, 1}]], $Failed], ESameTestBROKEN[
  Simplify[Series[(n + \[Alpha])!/(n + \[Beta])!, {n, Infinity, 2}]], 
  (1/n)^(-\[Alpha] + \[Beta])*
   (1 + (\[Alpha] + \[Alpha]^2 - \[Beta]*(1 + \[Beta]))/(2*n) + 
    (1/(24*n^2))*(2*\[Alpha]^3 + 3*\[Alpha]^4 - 
      3*\[Alpha]^2*(1 + 2*\[Beta] + 2*\[Beta]^2) - 
      2*\[Alpha]*(1 + 3*\[Beta] + 3*\[Beta]^2) + 
      \[Beta]*(2 + 9*\[Beta] + 10*\[Beta]^2 + 3*\[Beta]^3)) + O[1/n]^3)], 
 ESameTest[Pi^(n/2)/(n/2)!, Pi^(n/2)/(n/2)!], 
 ESameTestBROKEN[Table[%*r^n, {n, 1, 4}], {2*r, Pi*r^2, (4*Pi*r^3)/3, 
   (Pi^2*r^4)/2}], ESameTestBROKEN[HoldComplete[
   ListPlot[Table[%%, {n, 0, 25}]]], $Failed], 
 EComment["Find the series expansion at -\\[Infinity]:"], 
 ESameTestBROKEN[Series[n!, {n, -Infinity, 3}], 
  E^(-1 + I*Pi - Log[1/n])*n + O[1/n]^4*Csc[(1 + n)*Pi]*
    (I*Sqrt[Pi/2]*Sqrt[n] + (I*Sqrt[Pi/2])/(12*Sqrt[n]) + 
     (I*Sqrt[Pi/2])/(288*n^(3/2)) - (139*I*Sqrt[Pi/2])/(51840*n^(5/2)) + 
     O[1/n]^(7/2))], ESameTestBROKEN[Simplify[Normal[%]], 
  -((I*E^(I*n*(I + Pi))*(1/n)^(5/2 - n)*(-139 + 180*n + 4320*n^2 + 51840*n^3)*
     Sqrt[Pi/2]*Csc[n*Pi])/51840)], ESameTest[FullSimplify[(n + 3)!/n!], 
  (1 + n)*(2 + n)*(3 + n)], EComment["Compute a generating function sum \
involving RefLink[Factorial,paclet:ref/Factorial]:"], 
 ESameTest[Sum[x^n/n!, {n, Infinity}], -1 + E^x], 
 ESameTestBROKEN[$Failed, HoldComplete[-Subfactorial[-1] - 
    (-1)^n*Gamma[2 + n]*Subfactorial[-2 - n]]], 
 ESameTestBROKEN[$Failed, HoldComplete[(-1 - n + (1 + n)!)/(1 + n)!]], 
 EComment["The generating function is divergent:"], 
 ESameTest[$Failed, $Failed], 
 EComment["Use regularization to obtain a closed-form generating function:"], 
 ESameTest[Sum[k!*x^k, {k, 0, Infinity}, Regularization -> "Borel"], 
  -(Gamma[0, -(1/x)]/E^x^(-1)/x)], ESameTestBROKEN[Series[%, {x, 0, 12}], 
  1 + x + 2*x^2 + 6*x^3 + 24*x^4 + 120*x^5 + 720*x^6 + 5040*x^7 + 40320*x^8 + 
   362880*x^9 + 3628800*x^10 + 39916800*x^11 + 479001600*x^12 + O[x]^13], 
 EComment["Generating function as a formal series:"], 
 ESameTest[Series[HypergeometricPFQ[{1, 1}, {}, x], {x, 0, 12}], 
  1 + x + 2*x^2 + 6*x^3 + 24*x^4 + 120*x^5 + 720*x^6 + 5040*x^7 + 40320*x^8 + 
   362880*x^9 + 3628800*x^10 + 39916800*x^11 + 479001600*x^12 + O[x]^13], 
 EComment["Some integrals can be done:"], 
 ESameTest[Integrate[Log[n!], {n, 0, 1}], (1/2)*(-2 + Log[2*Pi])], 
 EComment["Product of factorials:"], ESameTest[Product[(3*k + 1)!, {k, n}], 
  3^((1/2)*n*(-1 + 3*n))*(BarnesG[5/3]*BarnesG[7/3])^(-1 + n)*
   (8/(BarnesG[8/3]*BarnesG[10/3]))^n*BarnesG[5/3 + n]*BarnesG[2 + n]*
   BarnesG[7/3 + n]], ESameTestBROKEN[Round[% /. n -> 10], 304070441538593700\
64391343182173286748353618228473064952911100923000075950200412399139497689383\
9700728512593582441843858666946560000000000000000000000000000000000], 
 ESameTest[Product[(3*k + 1)!, {k, 10}], 304070441538593700643913431821732867\
48353618228473064952911100923000075950200412399139497689383970072851259358244\
1843858666946560000000000000000000000000000000000], 
 ESameTest[(10^8.)!, Overflow[]], EComment["Smaller values work:"], 
 ESameTest[(10.^6)!, 8.2639317*10^5565708], 
 ESameTest[(10.^3)!, 4.02387260077*10^2567], ESameTest[MachineNumberQ[%], 
  False], EComment["Find the numbers of digits 0 through 9 in 100000!:"], 
 ESameTest[DigitCount[100000!], {43238, 43275, 43003, 42990, 42935, 43184, 
   43470, 42777, 43082, 68620}], ESameTestBROKEN[
  HoldComplete[Histogram[IntegerDigits[100000!]]], $Failed], 
 ESameTestBROKEN[HoldComplete[
   Quiet[DensityPlot[Arg[Nest[Factorial, x + I*y, 3]], {x, -1, -0.65}, 
     {y, -0.2, 0.2}, Exclusions -> {}]]], $Failed], 
 ESameTestBROKEN[HoldComplete[Quiet[DensityPlot[Arg[(1/(x + I*y))!], 
     {x, -0.4, 0.4}, {y, -0.4, 0.4}, Exclusions -> {}]]], $Failed]]
