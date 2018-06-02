(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Use RefLink[SeedRandom,paclet:ref/SeedRandom] to make \
random numbers repeatable:"], TapTestSameBROKEN[
  SeedRandom[1234]; RandomReal[], 0.918946], 
 TapTestSameBROKEN[SeedRandom[1234]; RandomReal[], 0.918946], 
 TapComment["The seed can be a string:"], 
 TapTestSameBROKEN[SeedRandom["password"]; RandomReal[], 0.42532], 
 TapComment[
  "RefLink[SeedRandom,paclet:ref/SeedRandom] affects all random generators:"]\
, TapTestSameBROKEN[SeedRandom[4567]; {RandomInteger[10], RandomReal[]}, 
  {5, 0.352724}], TapTestSameBROKEN[SeedRandom[4567]; 
   {RandomReal[], RandomInteger[10]}, {0.334545, 8}], 
 TapComment["Random numbers are now generated using it:"], 
 TapTestSameBROKEN[RandomReal[1, 5], {0.192304, 0.30695, 0.0295638, 0.358881, 
   0.0340693}], TapComment[
  "A specific seed will affect the current Mersenne twister generator:"], 
 TapTestSameBROKEN[SeedRandom[4321]; RandomReal[1, 5], 
  {0.448897, 0.199816, 0.907441, 0.277851, 0.348082}], 
 TapComment["Reproduce a part of a computation that uses randomness:"], 
 TapTestSameBROKEN[SeedRandom[1234]; Eigenvalues[RandomReal[1, {100, 100}], 
    1], {50.0846}], TapTestSameBROKEN[SeedRandom[1234]; 
   Eigenvalues[RandomReal[1, {100, 100}], -1], {0.149017 - 0.119666*I}], 
 TapTestSameBROKEN[SeedRandom[1234]; Eigenvalues[RandomReal[1, {100, 100}]][[
    {1, -1}]], {50.0846, 0.149017 - 0.119666*I}], 
 TapTestSameBROKEN[HoldComplete[p100 = rplot[Sin[x], {x, 0, 10*Pi}]], 
  $Failed], TapComment["Using the function again with more points just adds \
the additional points:"], TapTestSameBROKEN[
  HoldComplete[rplot[Sin[x], {x, 0, 10*Pi}, PlotPoints -> 125]], $Failed]]
