(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Assume both x and y are real:"], 
 ESameTest[ComplexExpand[Sin[x + I*y]], Cosh[y]*Sin[x] + I*Cos[x]*Sinh[y]], 
 EComment["Take x to be complex:"], ESameTest[ComplexExpand[Sin[x], x], 
  Cosh[Im[x]]*Sin[Re[x]] + I*Cos[Re[x]]*Sinh[Im[x]]], 
 EComment["Polynomials:"], ESameTest[ComplexExpand[Re[z^5 - 2*z^3 - z + 1], 
   z], 1 - Re[z] + 6*Im[z]^2*Re[z] + 5*Im[z]^4*Re[z] - 2*Re[z]^3 - 
   10*Im[z]^2*Re[z]^3 + Re[z]^5], 
 EComment["Trigonometric and hyperbolic functions:"], 
 ESameTest[ComplexExpand[Cos[x + I*y] + Tanh[z], {z}], 
  Cos[x]*Cosh[y] + I*(Sin[2*Im[z]]/(Cos[2*Im[z]] + Cosh[2*Re[z]]) - 
     Sin[x]*Sinh[y]) + Sinh[2*Re[z]]/(Cos[2*Im[z]] + Cosh[2*Re[z]])], 
 EComment["Inverse trigonometric and inverse hyperbolic functions:"], 
 ESameTest[ComplexExpand[Re[ArcCot[x + I*y]] + Im[ArcSinh[x - I*y]]], 
  (-(1/2))*Arg[1 - I/(x + I*y)] + (1/2)*Arg[1 + I/(x + I*y)] + 
   Arg[x + Sqrt[1 + (x - I*y)^2] - I*y]], 
 EComment["Exponential and logarithmic functions:"], 
 ESameTest[ComplexExpand[Abs[2^z*Log[2*z]], z], 
  2^Re[z]*Sqrt[Arg[z]^2 + (Log[2] + (1/2)*Log[Im[z]^2 + Re[z]^2])^2]], 
 EComment["Composition of functions:"], 
 ESameTest[ComplexExpand[Re[Log[Sin[Exp[x + I*y]^2]]]], 
  (1/2)*Log[Cosh[E^(2*x)*Sin[2*y]]^2*Sin[E^(2*x)*Cos[2*y]]^2 + 
     Cos[E^(2*x)*Cos[2*y]]^2*Sinh[E^(2*x)*Sin[2*y]]^2]], 
 EComment["This gives an answer in terms of RefLink[Re,paclet:ref/Re][z] and \
RefLink[Im,paclet:ref/Im][z]:"], ESameTest[ComplexExpand[Re[Tan[z]], z], 
  Sin[2*Re[z]]/(Cos[2*Re[z]] + Cosh[2*Im[z]])], 
 EComment["With \
RefLink[TargetFunctions,paclet:ref/TargetFunctions]->{RefLink[Abs,paclet:ref/\
Abs], RefLink[Arg,paclet:ref/Arg]}, the answer is given in terms of \
RefLink[Abs,paclet:ref/Abs][z] and RefLink[Arg,paclet:ref/Arg][z]:"], 
 ESameTest[ComplexExpand[Re[Tan[z]], z, TargetFunctions -> {Abs, Arg}], 
  Sin[2*Abs[z]*Cos[Arg[z]]]/(Cos[2*Abs[z]*Cos[Arg[z]]] + 
    Cosh[2*Abs[z]*Sin[Arg[z]]])], 
 EComment[
  "Use RefLink[Conjugate,paclet:ref/Conjugate] as the target function:"], 
 ESameTest[ComplexExpand[Re[Tan[z]], z, TargetFunctions -> Conjugate], 
  Sin[z + Conjugate[z]]/(Cos[z - Conjugate[z]] + Cos[z + Conjugate[z]])], 
 EComment["This computes \
RefLink[Re,paclet:ref/Re][RefLink[Sin,paclet:ref/Sin][x+RefLink[I,paclet:ref/\
I] y]] assuming that x and y are real:"], 
 ESameTest[ComplexExpand[Re[Sin[x + I*y]]], Cosh[y]*Sin[x]], 
 EComment["The same computation can be done using \
RefLink[TrigExpand,paclet:ref/TrigExpand] and \
RefLink[Refine,paclet:ref/Refine]:"], ESameTest[TrigExpand[Sin[x + I*y]], 
  Cosh[y]*Sin[x] + I*Cos[x]*Sinh[y]], ESameTestBROKEN[
  Refine[Re[%], Element[x | y, Reals]], Cosh[y]*Sin[x]]]
