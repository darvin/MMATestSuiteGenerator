(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Inverse of a 2*2 matrix:"], 
 ESameTestBROKEN[Inverse[{{1.4, 2}, {3, -6.7}}], 
  {{0.435631, 0.130039}, {0.195059, -0.0910273}}], 
 EComment["Enter the matrix in a grid:"], 
 ESameTestBROKEN[Inverse[1*2*3*4*2*2*5*1*7], {{-(2/7), 11/42, 1/21}, 
   {3/7, 4/21, -(5/21)}, {1/7, -(3/14), 1/7}}], 
 EComment["Inverse of a symbolic matrix:"], 
 ESameTest[Inverse[{{u, v}, {v, u}}], {{u/(u^2 - v^2), -(v/(u^2 - v^2))}, 
   {-(v/(u^2 - v^2)), u/(u^2 - v^2)}}], 
 EComment["Exact inverse of a Hilbert matrix:"], 
 ESameTestBROKEN[MatrixForm[Inverse[HilbertMatrix[5]]], 
  25 - 300*1050 - 1400*630 - 300*4800 - 18900*26880 - 12600*1050 - 
   18900*79380 - 117600*56700 - 1400*26880 - 117600*179200 - 88200*630 - 
   12600*56700 - 88200*44100], ESameTestBROKEN[
  HoldComplete[ArrayPlot[Inverse[HilbertMatrix[15]], Mesh -> True]], 
  $Failed], EComment["Plot the imaginary parts of a Vandermonde matrix for a \
discrete Fourier transform: "], ESameTestBROKEN[
  HoldComplete[ArrayPlot[Im[Inverse[Table[Exp[2*Pi*I*i*(j/26.)], {i, 25}, 
       {j, 25}]]]]], $Failed], 
 EComment["Plot the inverse of a matrix, shading according to absolute \
value:"], ESameTestBROKEN[HoldComplete[
   ArrayPlot[Inverse[Table[(1 + Mod[i*j, 19])/(i + j), {i, 20}, {j, 20}]]]], 
  $Failed], ESameTestBROKEN[Inverse[m] . m, 
  {{-((b*c)/((-b)*c + a*d)) + (a*d)/((-b)*c + a*d), 0}, 
   {0, -((b*c)/((-b)*c + a*d)) + (a*d)/((-b)*c + a*d)}}], 
 ESameTestBROKEN[Simplify[%], {{1, 0}, {0, 1}}], 
 EComment["The inverse may not exist: "], ESameTestBROKEN[Inverse[1*2*1*2], 
  Inverse[{{1, 2}, {1, 2}}]], EComment["Typically a pseudo inverse does:"], 
 ESameTestBROKEN[PseudoInverse[1*2*1*2], {{1/10, 1/10}, {1/5, 1/5}}], 
 EComment["Full inverses do not exist for rectangular matrices: "], 
 ESameTestBROKEN[Inverse[1*2*2*3*1*4], Inverse[{{1, 2, 2}, {3, 1, 4}}]], 
 ESameTestBROKEN[PseudoInverse[1*2*2*3*1*4], 
  {{-(1/5), 14/65}, {3/5, -(17/65)}, {0, 2/13}}], 
 EComment["Accurate inverses cannot be found for ill-conditioned \
machine-precision numerical matrices:"], 
 ESameTestBROKEN[Inverse[N[HilbertMatrix[15]]][[1,1]], 160.681], 
 EComment["Exact result:"], ESameTest[Inverse[HilbertMatrix[15]][[1,1]], 
  225], EComment["Arbitrary-precision result:"], 
 ESameTestBROKEN[Inverse[N[HilbertMatrix[15], 30]][[1,1]], 
  225.`29.352182518111363]]
