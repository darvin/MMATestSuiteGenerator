(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find coefficients of polynomials:"], 
 TapTestSame[Coefficient[(x + 1)^3, x, 2], 3], 
 TapTestSame[Coefficient[(x + y)^4, x*y^3], 4], 
 TapComment["Find a coefficient at x:"], 
 TapTestSame[Coefficient[a*x + b*y + c, x], a], 
 TapComment["Find a coefficient at a power of x:"], 
 TapTestSame[Coefficient[a*x^3 + b*x^2 + c*x + d, x, 2], b], 
 TapComment["Find the free term in a polynomial:"], 
 TapTestSame[Coefficient[(x + 2)^2 + (x + 3)^3, x, 0], 31], 
 TapComment["Find a coefficient at a multivariate monomial:"], 
 TapTestSame[Coefficient[(x + y)*(x + 2*y)*(3*x + 4*y + 5), x*y^2], 18], 
 TapComment["Find a coefficient over the integers modulo 2:"], 
 TapTestSame[Coefficient[(x + 1)^3, x, 2, Modulus -> 2], 1], 
 TapComment["RefLink[CoefficientList,paclet:ref/CoefficientList] gives a list \
of all polynomial coefficients:"], TapTestSameBROKEN[
  f = (x + 3)^5 ;; CoefficientList[f, x], {243, 405, 270, 90, 15, 1}], 
 TapComment["The same list of coefficients obtained using \
RefLink[Coefficient,paclet:ref/Coefficient] and \
RefLink[Exponent,paclet:ref/Exponent]:"], 
 TapTestSameBROKEN[(Coefficient[f, x, #1] & ) /@ Range[0, Exponent[f, x]], 
  {243, 405, 270, 90, 15, 1}], TapComment["For multivariate polynomials \
RefLink[CoefficientList,paclet:ref/CoefficientList] gives a tensor of the \
coefficients:"], TapTestSameBROKEN[
  f = (3*x + 5*y)^4 ;; cl = CoefficientList[f, {x, y}], 
  {{0, 0, 0, 0, 625}, {0, 0, 0, 1500, 0}, {0, 0, 1350, 0, 0}, 
   {0, 540, 0, 0, 0}, {81, 0, 0, 0, 0}}], TapComment["RefLink[CoefficientArra\
ys,paclet:ref/CoefficientArrays] gives the list of arrays of polynomial \
coefficients ordered by total degree:"], TapTestSameBROKEN[
  HoldComplete[ca = CoefficientArrays[f, {x, y}]], $Failed], 
 TapComment["The coefficient of x y^3:"], 
 TapTestSameBROKEN[Coefficient[f, x*y^3], 1500], 
 TapComment[
  "In cl the coefficient of x^a y^b is the element at position {a+1,b+1}:"], 
 TapTestSameBROKEN[cl[[1 + 1,1 + 3]], 1500], TapComment["In ca the position \
of tis coefficient is a+b+1 followed by a 1s and b 2s (1 and 2 indicate the \
first and second variables):"], TapTestSameBROKEN[ca[[5,1,2,2,2]], 1500]]
