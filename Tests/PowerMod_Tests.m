(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[PowerMod[2, 10, 3], 1], TapTestSame[Mod[2^10, 3], 1], 
 TapComment["Compute the multiplicative inverse of 3 modulo 7:"], 
 TapTestSame[PowerMod[3, -1, 7], 5], TapComment["Check the result:"], 
 TapTestSame[Mod[3*5, 7], 1], TapComment["RefLink[PowerMod,paclet:ref/PowerMo\
d] works with numbers of any size, and does not need to compute the explicit \
power:"], TapTestSame[PowerMod[2, 10^9, 18], 16], 
 TapComment["RefLink[PowerMod,paclet:ref/PowerMod] automatically threads \
itself over lists:"], TapTestSame[PowerMod[2, {10, 11, 12, 13, 14}, 5], 
  {4, 3, 1, 2, 4}], TapComment[
  "Compute the modular square root of 6 modulo 10:"], 
 TapTestSame[PowerMod[6, 1/2, 10], 4], 
 TapComment["Build an RSA-like toy encryption scheme. Start with the \
modulus:"], TapTestSameBROKEN[
  {p, q} = Prime[RandomInteger[{10^4, 10^5}, {2}]]; n = p*q, 441596560183], 
 TapComment[
  "Find the universal exponent of the multiplication group modulo n:"], 
 TapTestSameBROKEN[\[Lambda] = CarmichaelLambda[n], 73599183960], 
 TapComment["Private key:"], TapTestSameBROKEN[
  d = NestWhile[#1 + 1 & , Round[n/3], GCD[\[Lambda], #1] =!= 1 & ], 
  147198853397], TapComment["Public key:"], 
 TapTestSameBROKEN[e = PowerMod[d, -1, \[Lambda]], 43827926933], 
 TapComment["Encrypt a message:"], TapTestSameBROKEN[
  PowerMod[ToCharacterCode["RSA in Mathematica"], e, n], 
  {370588429072, 31547009034, 13929388044, 384734377610, 162556565179, 
   299295617632, 384734377610, 75741462274, 285710361035, 176224883944, 
   85403059458, 342434320296, 188016646930, 285710361035, 176224883944, 
   162556565179, 65047462332, 285710361035}], TapComment["Decrypt it:"], 
 TapTestSameBROKEN[FromCharacterCode[PowerMod[%, d, n]], RSA*in*Mathematica], 
 TapComment["Modular square roots may not exist: "], 
 TapTestSame[PowerMod[2, 1/2, 5], PowerMod[2, 1/2, 5]]]
