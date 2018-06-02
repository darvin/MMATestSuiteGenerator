(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Use RefLink[SeedRandom,paclet:ref/SeedRandom] to \
make random numbers repeatable:"], ESameTestBROKEN[
  SeedRandom[1234]; RandomReal[], 0.918946], 
 ESameTestBROKEN[SeedRandom[1234]; RandomReal[], 0.918946], 
 EComment["The seed can be a string:"], 
 ESameTestBROKEN[SeedRandom["password"]; RandomReal[], 0.42532], 
 EComment[
  "RefLink[SeedRandom,paclet:ref/SeedRandom] affects all random generators:"]\
, ESameTestBROKEN[SeedRandom[4567]; {RandomInteger[10], RandomReal[]}, 
  {5, 0.352724}], ESameTestBROKEN[SeedRandom[4567]; 
   {RandomReal[], RandomInteger[10]}, {0.334545, 8}], 
 EComment["Random numbers are now generated using it:"], 
 ESameTestBROKEN[RandomReal[1, 5], {0.192304, 0.30695, 0.0295638, 0.358881, 
   0.0340693}], EComment[
  "A specific seed will affect the current Mersenne twister generator:"], 
 ESameTestBROKEN[SeedRandom[4321]; RandomReal[1, 5], 
  {0.448897, 0.199816, 0.907441, 0.277851, 0.348082}], 
 EComment["Reproduce a part of a computation that uses randomness:"], 
 ESameTestBROKEN[SeedRandom[1234]; Eigenvalues[RandomReal[1, {100, 100}], 1], 
  {50.0846}], ESameTestBROKEN[SeedRandom[1234]; 
   Eigenvalues[RandomReal[1, {100, 100}], -1], {0.149017 - 0.119666*I}], 
 ESameTestBROKEN[SeedRandom[1234]; Eigenvalues[RandomReal[1, {100, 100}]][[
    {1, -1}]], {50.0846, 0.149017 - 0.119666*I}], 
 ESameTestBROKEN[HoldComplete[p100 = rplot[Sin[x], {x, 0, 10*Pi}]], $Failed], 
 EComment[
  "Using the function again with more points just adds the additional \
points:"], ESameTestBROKEN[HoldComplete[rplot[Sin[x], {x, 0, 10*Pi}, 
    PlotPoints -> 125]], $Failed]]
