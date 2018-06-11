(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Results are in radians:"], TapTestSame[ArcTan[1], Pi/4], 
 TapComment[
  "Divide by RefLink[Degree,paclet:ref/Degree] to get results in degrees:"], 
 TapTestSame[N[ArcTan[1]/Degree], 45.], 
 TapComment[
  "RefLink[ArcTan,paclet:ref/ArcTan][x,y] gives the angle of the point \
{x,y}:"], TapTestSame[ArcTan[1, 1], Pi/4], TapTestSame[ArcTan[-1, -1], 
  -((3*Pi)/4)], TapTestSame[HoldComplete[Plot[ArcTan[x], {x, -5, 5}]], 
  $Failed], TapTestSame[Series[ArcTan[x], {x, 0, 15}], 
  x - x^3/3 + x^5/5 - x^7/7 + x^9/9 - x^11/11 + x^13/13 - x^15/15 + O[x]^16], 
 TapComment["Evaluate for complex arguments:"], 
 TapTestSame[ArcTan[2.5 + I], 1.23343 + 0.123674*I], 
 TapComment["Evaluate to high precision:"], 
 TapTestSameBROKEN[N[ArcTan[1/2], 50], 
  0.46364760900080611621425623146121440202853705428612`49.66618802449766], 
 TapComment[
  "The precision of the output tracks the precision of the input:"], 
 TapTestSameBROKEN[ArcTan[0.5`40.698970004336026], 
  0.46364760900080611621425623146121440202854`40.66618802449765], 
 TapComment[
  "RefLink[ArcTan,paclet:ref/ArcTan] threads element-wise over lists:"], 
 TapTestSame[ArcTan[{0.1, 0.2, 0.3}], {0.0996687, 0.197396, 0.291457}], 
 TapComment["Simple exact values are generated automatically:"], 
 TapTestSame[{ArcTan[0], ArcTan[1]}, {0, Pi/4}], 
 TapComment["Parity transformations are automatically applied:"], 
 TapTestSame[ArcTan[-x], -ArcTan[x]], TapTestSame[ArcTan[I*x], I*ArcTanh[x]], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[
     -1
  tan  (x), x/tan], TapTestSameBROKEN[HoldComplete[
      -1
   tan  (x, y)], $Failed], 
 TapComment["Infinite arguments give symbolic results:"], 
 TapTestSame[ArcTan[{Infinity, I*Infinity, -Infinity, (-I)*Infinity}], 
  {Pi/2, Pi/2, -(Pi/2), -(Pi/2)}], TapTestSame[ArcTan[Infinity, 1], 0], 
 TapTestSame[ArcTan[-1, Infinity], Pi/2], 
 TapComment[
  "RefLink[ArcTan,paclet:ref/ArcTan] can be applied to a power series:"], 
 TapTestSame[Tan[x] + O[x]^10, x + x^3/3 + (2*x^5)/15 + (17*x^7)/315 + 
   (62*x^9)/2835 + O[x]^10], TapTestSame[ArcTan[%], x + O[x]^10], 
 TapComment[
  "RefLink[ArcTan,paclet:ref/ArcTan] can deal with real-valued intervals:"], 
 TapTestSame[ArcTan[Interval[{-1, 3}]], Interval[{-(Pi/4), ArcTan[3]}]], 
 TapComment[
  "Find angles of the right triangle with sides 3, 4 and hypotenuse 5:"], 
 TapTestSame[N[{ArcTan[4, 3], ArcTan[3, 4]}/Degree], {36.8699, 53.1301}], 
 TapComment["They total to 90\\[Degree]:"], TapTestSameBROKEN[Total[%], 90.], 
 TapComment["Find integrals of rational functions in terms of \
RefLink[ArcTan,paclet:ref/ArcTan]: "], TapTestSame[Integrate[1/(x^2 + 1), x], 
  ArcTan[x]], TapComment["Addition theorem for tangent function:"], 
 TapTestSame[Simplify[TrigExpand[Tan[ArcTan[x] + ArcTan[y]]]], 
  (x + y)/(1 - x*y)], TapComment["Solve a differential equation:"], 
 TapTestSame[DSolve[{(1 + x^2)*Derivative[1][Derivative[1][y]][x] + 
      2*x*Derivative[1][y][x] == 1, y[0] == 0, Derivative[1][y][0] == 1}, 
   y[x], x], {{y[x] -> (1/2)*(2*ArcTan[x] + Log[1 + x^2])}}], 
 TapComment["Branch cuts of RefLink[ArcTan,paclet:ref/ArcTan] run along the \
imaginary axis:"], TapTestSameBROKEN[
  HoldComplete[Plot3D[Re[ArcTan[x + I*y]], {y, -2, 2}, {x, -2.5, 2.5}]], 
  $Failed], TapComment["Use RefLink[TrigToExp,paclet:ref/TrigToExp] to \
express RefLink[ArcTan,paclet:ref/ArcTan] using RefLink[Log,paclet:ref/Log]:"]\
, TapTestSame[TrigToExp[ArcTan[z]], (1/2)*I*Log[1 - I*z] - 
   (1/2)*I*Log[1 + I*z]], TapTestSameBROKEN[ExpToTrig[%], ArcTan[z]], 
 TapComment["Use RefLink[FullSimplify,paclet:ref/FullSimplify] to simplify \
expressions with RefLink[ArcTan,paclet:ref/ArcTan]:"], 
 TapTestSame[FullSimplify[16*ArcTan[1/5] - 4*ArcTan[1/239]], Pi], 
 TapComment["RefLink[ArcTan,paclet:ref/ArcTan] is a special case of some \
special functions: "], TapTestSame[x*Hypergeometric2F1[1/2, 1, 3/2, -x^2], 
  ArcTan[x]], TapComment["Use RefLink[Reduce,paclet:ref/Reduce] to solve \
inequalities involving RefLink[ArcTan,paclet:ref/ArcTan]:"], 
 TapTestSame[Reduce[ArcTan[x] > Pi/3, x], x > Sqrt[3]], 
 TapComment["Because RefLink[ArcTan,paclet:ref/ArcTan] is a multivalued \
function, tan^-1(tan(x))!=x"], TapTestSame[ArcTan[Tan[4.]], 0.858407], 
 TapComment[
  "This differs from the original argument by a factor of \\[Pi]:"], 
 TapTestSame[(% - 4)/Pi, -1.], 
 TapComment["Expansion about the branch point x==I:"], 
 TapTestSameBROKEN[Series[ArcTan[x], {x, I, 3}], 
  Pi*Floor[(Pi/2 - Arg[-I + x])/(2*Pi)] + 
   ((1/4)*(Pi + 2*I*Log[2] - 2*I*Log[-I + x]) + (x - I)/4 + 
    (1/16)*I*(x - I)^2 - (1/48)*(x - I)^3 + O[x - I]^4)]]
