(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Inverse of a 2*2 matrix:"], 
 TapTestSame[Inverse[{{1.4, 2}, {3, -6.7}}], {{0.435631, 0.130039}, 
   {0.195059, -0.0910273}}], TapComment["Enter the matrix in a grid:"], 
 TapTestSameBROKEN[Inverse[1*2*3*4*2*2*5*1*7], 
  {{-(2/7), 11/42, 1/21}, {3/7, 4/21, -(5/21)}, {1/7, -(3/14), 1/7}}], 
 TapComment["Inverse of a symbolic matrix:"], 
 TapTestSame[Inverse[{{u, v}, {v, u}}], {{u/(u^2 - v^2), -(v/(u^2 - v^2))}, 
   {-(v/(u^2 - v^2)), u/(u^2 - v^2)}}], 
 TapComment["Exact inverse of a Hilbert matrix:"], 
 TapTestSameBROKEN[MatrixForm[Inverse[HilbertMatrix[5]]], 
  25 - 300*1050 - 1400*630 - 300*4800 - 18900*26880 - 12600*1050 - 
   18900*79380 - 117600*56700 - 1400*26880 - 117600*179200 - 88200*630 - 
   12600*56700 - 88200*44100], 
 TapTestSame[HoldComplete[ArrayPlot[Inverse[HilbertMatrix[15]], 
    Mesh -> True]], $Failed], TapComment["Plot the imaginary parts of a \
Vandermonde matrix for a discrete Fourier transform: "], 
 TapTestSame[HoldComplete[ArrayPlot[
    Im[Inverse[Table[Exp[2*Pi*I*i*(j/26.)], {i, 25}, {j, 25}]]]]], $Failed], 
 TapComment[
  "Plot the inverse of a matrix, shading according to absolute value:"], 
 TapTestSame[HoldComplete[ArrayPlot[Inverse[Table[(1 + Mod[i*j, 19])/(i + j), 
      {i, 20}, {j, 20}]]]], $Failed], 
 TapComment["Show positive entries as black and others as white:"], 
 TapTestSameBROKEN[$Failed, HoldComplete[
   {{-((b*c)/((-b)*c + a*d)) + (a*d)/((-b)*c + a*d), 0}, 
    {0, -((b*c)/((-b)*c + a*d)) + (a*d)/((-b)*c + a*d)}}]], 
 TapTestSameBROKEN[Simplify[%], {{1, 0}, {0, 1}}], 
 TapComment["The inverse may not exist: "], 
 TapTestSameBROKEN[Inverse[1*2*1*2], Inverse[{{1, 2}, {1, 2}}]], 
 TapComment["Typically a pseudo inverse does:"], 
 TapTestSameBROKEN[PseudoInverse[1*2*1*2], {{1/10, 1/10}, {1/5, 1/5}}], 
 TapComment["Full inverses do not exist for rectangular matrices: "], 
 TapTestSameBROKEN[Inverse[1*2*2*3*1*4], Inverse[{{1, 2, 2}, {3, 1, 4}}]], 
 TapTestSameBROKEN[PseudoInverse[1*2*2*3*1*4], 
  {{-(1/5), 14/65}, {3/5, -(17/65)}, {0, 2/13}}], 
 TapComment["Accurate inverses cannot be found for ill-conditioned \
machine-precision numerical matrices:"], TapTestSameBROKEN[
  Inverse[N[HilbertMatrix[15]]][[1,1]], 160.681], 
 TapComment["Exact result:"], TapTestSame[Inverse[HilbertMatrix[15]][[1,1]], 
  225], TapComment["Arbitrary-precision result:"], 
 TapTestSameBROKEN[Inverse[N[HilbertMatrix[15], 30]][[1,1]], 
  225.`29.352182518111363]]
