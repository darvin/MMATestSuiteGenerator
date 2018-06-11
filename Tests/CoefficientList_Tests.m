(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the coefficients in a polynomial:"], 
 TapTestSame[CoefficientList[1 + 6*x - x^4, x], {1, 6, 0, 0, -1}], 
 TapComment["RefLink[CoefficientList,paclet:ref/CoefficientList] works even \
when the polynomial has not been expanded out:"], 
 TapTestSame[CoefficientList[(1 + x)^10, x], {1, 10, 45, 120, 210, 252, 210, 
   120, 45, 10, 1}], TapComment[
  "Matrix of coefficients for a quadratic form:"], 
 TapTestSame[CoefficientList[1 + a*x^2 + b*x*y + c*y^2, {x, y}], 
  {{1, 0, c}, {0, b, 0}, {a, 0, 0}}], 
 TapComment["Univariate polynomial coefficient lists:"], 
 TapTestSame[CoefficientList[(2*x + 3)^5, x], {243, 810, 1080, 720, 240, 
   32}], TapTestSame[CoefficientList[a*x^4 + b*x^3 + c*x^2 + d*x + e, x], 
  {e, d, c, b, a}], TapComment["Multivariate polynomial coefficient lists:"], 
 TapTestSame[CoefficientList[(3*x + 4*y + 1)^3, {x, y}], 
  {{1, 12, 48, 64}, {9, 72, 144, 0}, {27, 108, 0, 0}, {27, 0, 0, 0}}], 
 TapTestSame[CoefficientList[(x + y + z + 1)*(2*x + 3*y^2 + 4*z^3 + 5), 
   {x, y, z}], {{{5, 5, 0, 4, 4}, {5, 0, 0, 4, 0}, {3, 3, 0, 0, 0}, 
    {3, 0, 0, 0, 0}}, {{7, 2, 0, 4, 0}, {2, 0, 0, 0, 0}, {3, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0}}, {{2, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0}}}], TapComment[
  "Coefficient list over the integers modulo 2:"], 
 TapTestSame[CoefficientList[(x + 1)^5, x, Modulus -> 2], 
  {1, 1, 0, 0, 1, 1}], TapComment["Use \
RefLink[Coefficient,paclet:ref/Coefficient] to get a coefficient at a \
specified power of the variable:"], TapTestSameBROKEN[
  f = (2*x + 3)^3 ;; Coefficient[f, x, 2], 36], 
 TapComment["The list of coefficients can be obtained using \
RefLink[Coefficient,paclet:ref/Coefficient] and \
RefLink[Exponent,paclet:ref/Exponent]:"], 
 TapTestSameBROKEN[(Coefficient[f, x, #1] & ) /@ Range[0, Exponent[f, x]], 
  {27, 54, 36, 8}], TapTestSameBROKEN[CoefficientList[f, x], 
  {27, 54, 36, 8}], TapComment["RefLink[FromDigits,paclet:ref/FromDigits] can \
reconstruct a univariate polynomial from the list of its coefficients:"], 
 TapTestSame[CoefficientList[a + b*x + c*x^2, x], {a, b, c}], 
 TapTestSameBROKEN[FromDigits[Reverse[%], x], a + b*x + c*x^2], 
 TapComment["Fold the operation for multivariate polynomials:"], 
 TapTestSame[CoefficientList[(x + 2*y)^3, {x, y}], 
  {{0, 0, 0, 8}, {0, 0, 12, 0}, {0, 6, 0, 0}, {1, 0, 0, 0}}], 
 TapTestSameBROKEN[Fold[FromDigits[Reverse[#1], #2] & , %, {x, y}], 
  x^3 + 6*x^2*y + y^2*(12*x + 8*y)], TapTestSameBROKEN[
  Expand[(x + 2*y)^3 - %], 0], TapComment["Polynomial multiplication is \
convolution as performed by RefLink[ListConvolve,paclet:ref/ListConvolve]:"], 
 TapTestSame[CoefficientList[(a + b*x + c*x^2)*(1 + 2*x + 3*x^2 + 4*x^3), x], 
  {a, 2*a + b, 3*a + 2*b + c, 4*a + 3*b + 2*c, 4*b + 3*c, 4*c}], 
 TapTestSame[ListConvolve[{a, b, c}, {1, 2, 3, 4}, {1, -1}, 0], 
  {a, 2*a + b, 3*a + 2*b + c, 4*a + 3*b + 2*c, 4*b + 3*c, 4*c}], 
 TapComment["For multivariate polynomials \
RefLink[CoefficientList,paclet:ref/CoefficientList] gives a tensor of the \
coefficients:"], TapTestSameBROKEN[
  f = (3*x + 5*y)^4 ;; cl = CoefficientList[f, {x, y}], 
  {{0, 0, 0, 0, 625}, {0, 0, 0, 1500, 0}, {0, 0, 1350, 0, 0}, 
   {0, 540, 0, 0, 0}, {81, 0, 0, 0, 0}}], TapComment["RefLink[CoefficientArra\
ys,paclet:ref/CoefficientArrays] gives the list of arrays of polynomial \
coefficients ordered by total degrees:"], 
 TapTestSameBROKEN[HoldComplete[ca = CoefficientArrays[f, {x, y}]], $Failed], 
 TapComment["The coefficient of xy^3:"], TapTestSameBROKEN[
  Coefficient[f, x*y^3], 1500], 
 TapComment[
  "In cl the coefficient of x^a y^b is the element at position {a+1,b+1}:"], 
 TapTestSameBROKEN[cl[[1 + 1,1 + 3]], 1500], TapComment["In ca the position \
of this coefficient is a+b+1 followed by a 1s and b 2s (1 and 2 indicate the \
first and second variables):"], TapTestSameBROKEN[ca[[5,1,2,2,2]], 1500]]
