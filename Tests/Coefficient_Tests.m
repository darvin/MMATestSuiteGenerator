(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Find coefficients of polynomials:"], 
 ESameTest[Coefficient[(x + 1)^3, x, 2], 3], 
 ESameTest[Coefficient[(x + y)^4, x*y^3], 4], 
 EComment["Find a coefficient at x:"], 
 ESameTest[Coefficient[a*x + b*y + c, x], a], 
 EComment["Find a coefficient at a power of x:"], 
 ESameTest[Coefficient[a*x^3 + b*x^2 + c*x + d, x, 2], b], 
 EComment["Find the free term in a polynomial:"], 
 ESameTest[Coefficient[(x + 2)^2 + (x + 3)^3, x, 0], 31], 
 EComment["Find a coefficient at a multivariate monomial:"], 
 ESameTest[Coefficient[(x + y)*(x + 2*y)*(3*x + 4*y + 5), x*y^2], 18], 
 EComment["Find a coefficient over the integers modulo 2:"], 
 ESameTest[Coefficient[(x + 1)^3, x, 2, Modulus -> 2], 1], 
 ESameTestBROKEN[CoefficientList[f, x], {243, 405, 270, 90, 15, 1}], 
 EComment["The same list of coefficients obtained using \
RefLink[Coefficient,paclet:ref/Coefficient] and \
RefLink[Exponent,paclet:ref/Exponent]:"], 
 ESameTestBROKEN[(Coefficient[f, x, #1] & ) /@ Range[0, Exponent[f, x]], 
  {243, 405, 270, 90, 15, 1}], ESameTestBROKEN[
  cl = CoefficientList[f, {x, y}], {{0, 0, 0, 0, 625}, {0, 0, 0, 1500, 0}, 
   {0, 0, 1350, 0, 0}, {0, 540, 0, 0, 0}, {81, 0, 0, 0, 0}}], 
 EComment["RefLink[CoefficientArrays,paclet:ref/CoefficientArrays] gives the \
list of arrays of polynomial coefficients ordered by total degree:"], 
 ESameTestBROKEN[HoldComplete[ca = CoefficientArrays[f, {x, y}]], $Failed], 
 EComment["The coefficient of x y^3:"], 
 ESameTestBROKEN[Coefficient[f, x*y^3], 1500], 
 EComment[
  "In cl the coefficient of x^a y^b is the element at position {a+1,b+1}:"], 
 ESameTestBROKEN[cl[[1 + 1,1 + 3]], 1500], EComment["In ca the position of \
tis coefficient is a+b+1 followed by a 1s and b 2s (1 and 2 indicate the \
first and second variables):"], ESameTestBROKEN[ca[[5,1,2,2,2]], 1500]]
