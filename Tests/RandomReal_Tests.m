(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["A random real number in the range 0 to 1:"], 
 TapTestSameBROKEN[RandomReal[], 0.097196], 
 TapComment["A random real number in the range -10 to 10:"], 
 TapTestSameBROKEN[RandomReal[{-10, 10}], 0.669505], 
 TapComment["A random real number in the range 0 to 10:"], 
 TapTestSameBROKEN[RandomReal[10], 2.23927], 
 TapComment["5 random reals in the range 0 to 1:"], 
 TapTestSameBROKEN[RandomReal[1, 5], {0.971496, 0.659645, 0.345808, 0.5159, 
   0.928815}], TapComment[
  "A 3*2 array of random reals in the range -1 to 1:"], 
 TapTestSameBROKEN[RandomReal[{-1, 1}, {3, 2}], 
  {{-0.913821, -0.0781397}, {0.367039, -0.49319}, {-0.684801, -0.803185}}], 
 TapComment["Random coordinates for 4 points in 3 dimensions:"], 
 TapTestSameBROKEN[RandomReal[1, {4, 3}], {{0.929469, 0.362773, 0.111376}, 
   {0.529108, 0.648414, 0.700633}, {0.850732, 0.413317, 0.402985}, 
   {0.38005, 0.45334, 0.137688}}], 
 TapComment["Generate random reals of any magnitude:"], 
 TapTestSameBROKEN[RandomReal[10^1000], 9.90193466468388*10^999], 
 TapComment["Generate random reals of any precision:"], 
 TapTestSameBROKEN[RandomReal[WorkingPrecision -> 30], 
  0.0705492899593844370044527140925`29.848492647172254], 
 TapTestSameBROKEN[RandomReal[10^1000, WorkingPrecision -> 50], 
  2.8422489673854466618683632870228088809936807219465`49.45366211737256*
   10^999], TapComment["Generate low-precision reals:"], 
 TapTestSameBROKEN[RandomReal[{-1, 1}, 5, WorkingPrecision -> 5], 
  {-0.91953, -0.76353, 0.99562, -0.25249, 0.88878}], 
 TapComment["Generate a random real with 50-digit precision:"], 
 TapTestSameBROKEN[RandomReal[WorkingPrecision -> 50], 
  0.31918832523749509908670507276463385641549235623071`49.504046998036905], 
 TapTestSameBROKEN[RandomReal[{-1, 1}, WorkingPrecision -> 50], 
  -0.47915048778086224644991844244514281568096945072073`49.680471934601414], 
 TapComment["A random walk:"], 
 TapTestSame[HoldComplete[ListLinePlot[Accumulate[RandomReal[{-1, 1}, 
      100]]]], $Failed], TapComment["Circles at random positions:"], 
 TapTestSame[HoldComplete[Graphics[Circle /@ RandomReal[10, {40, 2}]]], 
  $Failed], TapComment["Random array of gray levels:"], 
 TapTestSameBROKEN[HoldComplete[ArrayPlot[RandomReal[1, {30, 40}]]], 
  $Failed], TapComment["Spheres at random positions:"], 
 TapTestSame[HoldComplete[Graphics3D[Sphere /@ RandomReal[10, {50, 3}]]], 
  $Failed], TapComment["2D random walk:"], 
 TapTestSame[HoldComplete[Graphics[
    Line[Accumulate[RandomReal[{-1, 1}, {500, 2}]]]]], $Failed], 
 TapComment["3D random walk:"], TapTestSameBROKEN[
  HoldComplete[Graphics3D[Line[Accumulate[RandomReal[{-1, 1}, {500, 3}]]]]], 
  $Failed], TapComment["Determinants of random 100*100 matrices:"], 
 TapTestSameBROKEN[Table[Det[RandomReal[1, {100, 100}]], {10}], 
  {-5.92492*10^25, -1.08144*10^24, 5.3019*10^25, 1.81258*10^25, 
   -2.80605*10^26, -6.23121*10^24, -1.05716*10^25, -4.32509*10^24, 
   -1.99173*10^25, -2.50089*10^25}], 
 TapComment["Generate a complex number in the unit square:"], 
 TapTestSameBROKEN[Complex @@ RandomReal[1, 2], 0.0182069 + 0.059136*I], 
 TapComment["Generate 5 complex numbers:"], 
 TapTestSameBROKEN[Apply[Complex, RandomReal[1, {5, 2}], {1}], 
  {0.742297 + 0.66322*I, 0.736816 + 0.457873*I, 0.557258 + 0.194895*I, 
   0.377257 + 0.364522*I, 0.709416 + 0.668859*I}], 
 TapComment["Use RefLink[SeedRandom,paclet:ref/SeedRandom] to get repeatable \
random values:"], TapTestSameBROKEN[{RandomReal[], RandomReal[]}, 
  {0.199285, 0.662607}], TapTestSame[{SeedRandom[1234]; RandomReal[], 
   SeedRandom[1234]; RandomReal[]}, {0.876608, 0.876608}], 
 TapComment["Use RefLink[BlockRandom,paclet:ref/BlockRandom] to block one use \
of RefLink[RandomReal,paclet:ref/RandomReal] from affecting others:"], 
 TapTestSame[{BlockRandom[RandomReal[]], RandomReal[]}, 
  {0.521964, 0.521964}], TapComment["With the same seed, \
RefLink[RandomReal,paclet:ref/RandomReal] generates the \"same\" number, \
regardless of precision:"], TapTestSameBROKEN[
  Table[SeedRandom[4567]; RandomReal[WorkingPrecision -> p], {p, 10}], 
  {0.5, 0.52, 0.521, 0.522, 0.52199, 0.521992, 0.521992, 0.521992, 
   0.521992002, 0.5219920025}], TapComment["RefLink[RandomReal,paclet:ref/Ran\
domReal] generates a uniform distribution, here with mean 0.5:"], 
 TapTestSame[Mean[RandomReal[1, 10000]], 0.497923], 
 TapComment["RefLink[RandomReal,paclet:ref/RandomReal] generates white \
noise:"], TapTestSame[HoldComplete[ListLinePlot[
    Abs[Fourier[RandomReal[{-1, 1}, 1000]]]]], $Failed], 
 TapComment["Construct a surface from random heights:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot3D[Log[RandomReal[1, {50, 50}]]]], 
  $Failed]]
