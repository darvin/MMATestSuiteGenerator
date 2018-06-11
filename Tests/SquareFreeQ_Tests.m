(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSameBROKEN[$Failed, HoldComplete[True]], 
 TapComment["12 has a factor 4, which is a square:"], 
 TapTestSame[SquareFreeQ[12], False], TapTestSame[SquareFreeQ[x^4 - 1], 
  True], TapTestSame[SquareFreeQ[x^4 - 2*x^2 + 1], False], 
 TapComment["Integers: "], TapTestSame[SquareFreeQ[20], False], 
 TapTestSame[FactorInteger[20], {{2, 2}, {5, 1}}], 
 TapComment["Gaussian integers:"], TapTestSame[SquareFreeQ[8 + 2*I], False], 
 TapTestSame[FactorInteger[8 + 2*I], {{-I, 1}, {1 + I, 2}, {4 + I, 1}}], 
 TapComment["Univariate polynomials:"], 
 TapTestSame[SquareFreeQ[9 + 6*x + x^2], False], 
 TapTestSame[FactorList[9 + 6*x + x^2], {{1, 1}, {3 + x, 2}}], 
 TapComment["Multivariate polynomials:"], 
 TapTestSame[SquareFreeQ[x^3 - x^2*y - x*y^2 + y^3], False], 
 TapTestSame[FactorList[x^3 - x^2*y - x*y^2 + y^3], 
  {{1, 1}, {x - y, 2}, {x + y, 1}}], 
 TapComment["Polynomials in specific variables:"], 
 TapTestSame[SquareFreeQ[a*x*y^2, x], True], 
 TapTestSame[SquareFreeQ[a*x*y^2, y], False], 
 TapComment["Polynomials over a finite field:"], 
 TapTestSame[SquareFreeQ[x^2 + 1, Modulus -> 2], False], 
 TapTestSame[FactorList[x^2 + 1, Modulus -> 2], {{1, 1}, {1 + x, 2}}], 
 TapComment["This is square-free over the integers:"], 
 TapTestSame[SquareFreeQ[x^2 + 1], True], 
 TapComment["Square-free Gaussian integers:"], 
 TapTestSame[SquareFreeQ[2, GaussianIntegers -> True], False], 
 TapTestSame[SquareFreeQ[2, GaussianIntegers -> False], True], 
 TapComment["Square-free polynomials over finite fields:"], 
 TapTestSame[SquareFreeQ[x^2 - 3, Modulus -> 3], False], 
 TapTestSame[SquareFreeQ[x^2 - 3, Modulus -> 0], True], 
 TapComment["The central binomial coefficients \
RefLink[Binomial,paclet:ref/Binomial][2n,n] are not square-free for n>4:"], 
 TapTestSame[Or @@ Table[SquareFreeQ[Binomial[2*n, n]], {n, 5, 2^10}], 
  False], TapComment["Square factors can be found using \
RefLink[FactorSquareFreeList,paclet:ref/FactorSquareFreeList]:"], 
 TapTestSame[SquareFreeQ[Expand[(x + 1)^3*(x + 2)^2*(x + 3)^2]], False], 
 TapTestSame[FactorSquareFreeList[Expand[(x + 1)^3*(x + 2)^2*(x + 3)^2]], 
  {{1, 1}, {1 + x, 3}, {6 + 5*x + x^2, 2}}], TapComment["The polynomial \
p[x]/RefLink[PolynomialGCD,paclet:ref/PolynomialGCD][p[x],p'[x]] is always \
square-free:"], TapTestSameBROKEN[
  p = Expand[(x + 1)^3*(x + 2)^2*(x + 3)^2] ;; 
    SquareFreeQ[Cancel[p/PolynomialGCD[p, D[p, x]]]], True], 
 TapComment["RefLink[MoebiusMu,paclet:ref/MoebiusMu] is zero for \
non-square-free integers:"], TapTestSame[MoebiusMu[12], 0], 
 TapTestSame[SquareFreeQ[12], False], TapComment["Square-free integers: "], 
 TapTestSame[HoldComplete[ArrayPlot[Partition[Table[Boole[SquareFreeQ[i]], 
      {i, 300^2}], 300]]], $Failed], 
 TapComment["Square-free Gaussian integers:"], 
 TapTestSame[HoldComplete[ArrayPlot[
    Table[Boole[SquareFreeQ[x + I*y, GaussianIntegers -> True]], {x, 300}, 
     {y, 300}]]], $Failed]]
