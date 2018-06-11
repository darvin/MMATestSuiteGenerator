(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[{1, 2, 3, 4}]], 
 TapTestSame[Range[1.2, 2.2, 0.15], {1.2, 1.35, 1.5, 1.65, 1.8, 1.95, 2.1}], 
 TapTestSame[Range[x, x + 4], {x, 1 + x, 2 + x, 3 + x, 4 + x}], 
 TapComment["Use a step of 2:"], TapTestSame[Range[1, 10, 2], 
  {1, 3, 5, 7, 9}], TapComment["Use a negative step:"], 
 TapTestSame[Range[10, 1, -1], {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}], 
 TapComment["Use an exact numeric-valued step:"], 
 TapTestSame[Range[0, 10, Pi], {0, Pi, 2*Pi, 3*Pi}], 
 TapComment["Use a machine-number step:"], TapTestSame[Range[0, 10, N[Pi]], 
  {0., 3.14159, 6.28319, 9.42478}], TapComment["Use a precision-24 step:"], 
 TapTestSameBROKEN[Range[0, 10, N[Pi, 24]], 
  {0, 3.14159265358979323846264`23.497149872694134, 
   6.28318530717958647692529`23.798179868358115, 
   9.42477796076937971538793`23.974271127413797}], 
 TapComment["Range of very large numbers:"], 
 TapTestSame[Range[2^225, 2^225 + 5], 
  {53919893334301279589334030174039261347274288845081144962207220498432, 
   53919893334301279589334030174039261347274288845081144962207220498433, 
   53919893334301279589334030174039261347274288845081144962207220498434, 
   53919893334301279589334030174039261347274288845081144962207220498435, 
   53919893334301279589334030174039261347274288845081144962207220498436, 
   53919893334301279589334030174039261347274288845081144962207220498437}], 
 TapComment["Use a symbolic step:"], TapTestSame[Range[a, b, (b - a)/4], 
  {a, a + (1/4)*(-a + b), a + (1/2)*(-a + b), a + (3/4)*(-a + b), b}], 
 TapComment["Use a list of range specifications:"], 
 TapTestSame[Range[{5, 2, 6, 3}], {{1, 2, 3, 4, 5}, {1, 2}, 
   {1, 2, 3, 4, 5, 6}, {1, 2, 3}}], 
 TapComment["Produce a geometric sequence:"], 
 TapTestSame[q^Range[5], {q, q^2, q^3, q^4, q^5}], 
 TapComment["Form a polynomial from coefficients:"], 
 TapTestSameBROKEN[coeff = {-2, 9, 5, 3, -3, -6, -7, -4, 8, 3} ;; poly = 
    coeff . x^Range[0, Length[coeff] - 1], -2 + 9*x + 5*x^2 + 3*x^3 - 3*x^4 - 
   6*x^5 - 7*x^6 - 4*x^7 + 8*x^8 + 3*x^9], 
 TapComment["Form a random permutation:"], 
 TapTestSameBROKEN[RandomSample[Range[10]], {10, 6, 8, 1, 9, 7, 3, 5, 4, 2}], 
 TapComment["Find an inverse permutation:"], 
 TapTestSameBROKEN[perm = RandomSample[Range[10]], 
  {4, 2, 8, 1, 10, 5, 3, 6, 9, 7}], TapTestSameBROKEN[
  inverse = perm; inverse[[perm]] = Range[Length[perm]]; inverse, 
  {4, 2, 7, 1, 6, 8, 10, 3, 9, 5}], TapComment["RefLink[Range,paclet:ref/Rang\
e][Subscript[i, min],Subscript[i, max],di] is equivalent to \
RefLink[Table,paclet:ref/Table][i,{Subscript[i, min],Subscript[i, max],di}]:"]\
, TapTestSame[Range[-4, 9, 3], {-4, -1, 2, 5, 8}], 
 TapTestSame[Table[i, {i, -4, 9, 3}], {-4, -1, 2, 5, 8}], 
 TapComment["Use RefLink[Range,paclet:ref/Range] or \
RefLink[Span,paclet:ref/Span] (;;) as RefLink[Part,paclet:ref/Part] \
specification: "], TapTestSameBROKEN[
  list = {a, b, c, d, e} ;; list[[Range[1, 5, 2]]], {a, c, e}], 
 TapTestSameBROKEN[list[[1 ;; 5 ;; 2]], {a, c, e}], 
 TapComment["For some step sizes, RefLink[Range,paclet:ref/Range] may not \
include the upper limit given:"], TapTestSame[Range[0, 10, 3], {0, 3, 6, 9}], 
 TapComment["Even though the lower limit was exact, the inexact step makes \
the first element inexact:"], TapTestSame[Range[0, 1, 0.1], 
  {0., 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.}], 
 TapComment["Make nested ranges:"], TapTestSame[Range[Range[5]], 
  {{1}, {1, 2}, {1, 2, 3}, {1, 2, 3, 4}, {1, 2, 3, 4, 5}}], 
 TapTestSame[Range[Range[Range[3]]], {{{1}}, {{1}, {1, 2}}, 
   {{1}, {1, 2}, {1, 2, 3}}}], TapTestSame[Nest[Range, 3, 6], 
  {{{{{{1}}}}}, {{{{{1}}}}, {{{{1}}}, {{{1}}, {{1}, {1, 2}}}}}, 
   {{{{{1}}}}, {{{{1}}}, {{{1}}, {{1}, {1, 2}}}}, 
    {{{{1}}}, {{{1}}, {{1}, {1, 2}}}, {{{1}}, {{1}, {1, 2}}, 
      {{1}, {1, 2}, {1, 2, 3}}}}}}], TapComment["Show it in tree form:"], 
 TapTestSameBROKEN[HoldComplete[TreeForm[%]], $Failed]]
