(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find prime factors and their exponents:"], 
 TapTestSame[FactorInteger[2434500], {{2, 2}, {3, 2}, {5, 3}, {541, 1}}], 
 TapTestSame[FactorInteger[10^100 + 1], {{73, 1}, {137, 1}, {401, 1}, 
   {1201, 1}, {1601, 1}, {1676321, 1}, {5964848081, 1}, 
   {129694419029057750551385771184564274499075700947656757821537291527196801, 
    1}}], TapComment["RefLink[FactorInteger,paclet:ref/FactorInteger] threads \
itself element-wise over lists:"], 
 TapTestSame[FactorInteger[{123, 1234, 12345, 123456}], 
  {{{3, 1}, {41, 1}}, {{2, 1}, {617, 1}}, {{3, 1}, {5, 1}, {823, 1}}, 
   {{2, 6}, {3, 1}, {643, 1}}}], TapComment["RefLink[FactorInteger,paclet:ref\
/FactorInteger] works with rational numbers:"], 
 TapTestSame[FactorInteger[3/8], {{2, -3}, {3, 1}}], 
 TapTestSame[FactorInteger[2345354/2424245], {{2, 1}, {5, -1}, {11, 1}, 
   {17, 1}, {311, -1}, {1559, -1}, {6271, 1}}], 
 TapComment["Factor over Gaussian integers:"], 
 TapTestSame[FactorInteger[5, GaussianIntegers -> True], 
  {{-I, 1}, {1 + 2*I, 1}, {2 + I, 1}}], 
 TapComment["Find factorizations of numbers of the form 2^2^n+1:"], 
 TapTestSameBROKEN[Column[Table[FactorInteger[2^2^n + 1], {n, 7}]], 
  {{5, 1}}*{{17, 1}}*{{257, 1}}*{{65537, 1}}*{{641, 1}, {6700417, 1}}*
   {{274177, 1}, {67280421310721, 1}}*{{59649589127497217, 1}, 
    {5704689200685129054721, 1}}], 
 TapComment["Display as an explicit product of factors:"], 
 TapTestSame[FactorInteger[20!], {{2, 18}, {3, 8}, {5, 4}, {7, 2}, {11, 1}, 
   {13, 1}, {17, 1}, {19, 1}}], TapTestSameBROKEN[
  CenterDot @@ Apply[Superscript, %, {1}], 2^18 \[CenterDot] 3^8 \[CenterDot] 
   5^4 \[CenterDot] 7^2 \[CenterDot] 11^1 \[CenterDot] 13^1 \[CenterDot] 
   17^1 \[CenterDot] 19^1], TapComment["Find primes that appear in prime \
factorization of n! only to the first power:"], 
 TapTestSame[FactorInteger[20!], {{2, 18}, {3, 8}, {5, 4}, {7, 2}, {11, 1}, 
   {13, 1}, {17, 1}, {19, 1}}], TapTestSameBROKEN[Cases[%, {p_, 1} -> p], 
  {11, 13, 17, 19}], TapComment[
  "Find all natural numbers up to 100 that are primes or prime powers:"], 
 TapTestSame[Select[Range[100], Length[FactorInteger[#1]] == 1 & ], 
  {1, 2, 3, 4, 5, 7, 8, 9, 11, 13, 16, 17, 19, 23, 25, 27, 29, 31, 32, 37, 
   41, 43, 47, 49, 53, 59, 61, 64, 67, 71, 73, 79, 81, 83, 89, 97}], 
 TapComment["The number of distinct factors of successive numbers:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot[Table[Length[FactorInteger[n]], 
     {n, 100}]]], $Failed], 
 TapComment["The highest power of a prime in numbers up to 100: "], 
 TapTestSame[Table[Max[Last /@ FactorInteger[n]], {n, 2, 100}], 
  {1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 2, 1, 1, 1, 4, 1, 2, 1, 2, 1, 1, 1, 3, 2, 1, 
   3, 2, 1, 1, 1, 5, 1, 1, 1, 2, 1, 1, 1, 3, 1, 1, 1, 2, 2, 1, 1, 4, 2, 2, 1, 
   2, 1, 3, 1, 3, 1, 1, 1, 2, 1, 1, 2, 6, 1, 1, 1, 2, 1, 1, 1, 3, 1, 1, 2, 2, 
   1, 1, 1, 4, 4, 1, 1, 2, 1, 1, 1, 3, 1, 2, 1, 2, 1, 1, 1, 5, 1, 2, 2, 2}], 
 TapComment["The number of factors with Gaussian integers allowed:"], 
 TapTestSameBROKEN[HoldComplete[
   ListPlot[Table[Length[FactorInteger[n, GaussianIntegers -> True]], 
     {n, 100}]]], $Failed], TapComment["Timings can increase rapidly and \
unpredictably with the size of the input:"], 
 TapTestSameBROKEN[Table[Timing[FactorInteger[2^n - 1]; n], 
   {n, 50, 300, 50}], {{4.41314/10^15, 50}, {4.41314/10^15, 100}, 
   {0.031, 150}, {0.016, 200}, {0.656, 250}, {0.031, 300}}]]
