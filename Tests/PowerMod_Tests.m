(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[PowerMod[2, 10, 3], 1], ESameTest[Mod[2^10, 3], 1], 
 EComment["Compute the multiplicative inverse of 3 modulo 7:"], 
 ESameTest[PowerMod[3, -1, 7], 5], EComment["Check the result:"], 
 ESameTest[Mod[3*5, 7], 1], EComment["RefLink[PowerMod,paclet:ref/PowerMod] \
works with numbers of any size, and does not need to compute the explicit \
power:"], ESameTest[PowerMod[2, 10^9, 18], 16], 
 EComment["RefLink[PowerMod,paclet:ref/PowerMod] automatically threads itself \
over lists:"], ESameTest[PowerMod[2, {10, 11, 12, 13, 14}, 5], 
  {4, 3, 1, 2, 4}], 
 EComment["Compute the modular square root of 6 modulo 10:"], 
 ESameTest[PowerMod[6, 1/2, 10], 4], 
 EComment[
  "Build an RSA-like toy encryption scheme. Start with the modulus:"], 
 ESameTestBROKEN[{p, q} = Prime[RandomInteger[{10^4, 10^5}, {2}]]; n = p*q, 
  441596560183], EComment[
  "Find the universal exponent of the multiplication group modulo n:"], 
 ESameTestBROKEN[\[Lambda] = CarmichaelLambda[n], 73599183960], 
 EComment["Private key:"], ESameTestBROKEN[
  d = NestWhile[#1 + 1 & , Round[n/3], GCD[\[Lambda], #1] =!= 1 & ], 
  147198853397], EComment["Public key:"], 
 ESameTestBROKEN[e = PowerMod[d, -1, \[Lambda]], 43827926933], 
 EComment["Encrypt a message:"], ESameTestBROKEN[
  PowerMod[ToCharacterCode["RSA in Mathematica"], e, n], 
  {370588429072, 31547009034, 13929388044, 384734377610, 162556565179, 
   299295617632, 384734377610, 75741462274, 285710361035, 176224883944, 
   85403059458, 342434320296, 188016646930, 285710361035, 176224883944, 
   162556565179, 65047462332, 285710361035}], EComment["Decrypt it:"], 
 ESameTestBROKEN[FromCharacterCode[PowerMod[%, d, n]], RSA*in*Mathematica], 
 EComment["Modular square roots may not exist: "], 
 ESameTest[PowerMod[2, 1/2, 5], PowerMod[2, 1/2, 5]]]
