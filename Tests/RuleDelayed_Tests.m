(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment[":> holds its right-hand side unevaluated:"], 
 ESameTest[x :> RandomReal[], x :> RandomReal[]], 
 EComment[
  "The right-hand side is evaluated separately each time it is used:"], 
 ESameTestBROKEN[{x, x, x} /. x :> RandomReal[], 
  {0.378563, 0.0598703, 0.504099}], 
 EComment["Increment n each time x is replaced:"], 
 ESameTest[n = 1; {x, x, a, b, x, x, c, d} /. x :> n++, 
  {1, 2, a, b, 3, 4, c, d}], EComment["Evaluate the \
RefLink[StepMonitor,paclet:ref/StepMonitor] expression separately each time \
it is to be used:"], ESameTestBROKEN[FindRoot[Cos[x] == x, {x, 1}, 
   StepMonitor :> Print[x]], {x -> 0.739085}], 
 EComment["Generate a diagonal matrix with random elements:"], 
 ESameTestBROKEN[MatrixForm[SparseArray[{{i_, i_} :> RandomReal[]}, {4, 4}]], 
  0.655978*0*0*0*0*0.339171*0*0*0*0*0.163612*0*0*0*0*0.371782], 
 EComment["-> evaluates when it is first entered; :> when it is used:"], 
 ESameTestBROKEN[{x, x, x, x} /. x -> RandomReal[], 
  {0.526621, 0.526621, 0.526621, 0.526621}], 
 ESameTestBROKEN[{x, x, x, x} /. x :> RandomReal[], 
  {0.123567, 0.815383, 0.768442, 0.930826}], EComment["RefLink[Module,paclet:\
ref/Module] and RefLink[With,paclet:ref/With] do not affect local variables \
of RefLink[RuleDelayed,paclet:ref/RuleDelayed]:"], 
 ESameTest[With[{x = 1}, a /. x_ :> x + 1], 1 + a], 
 EComment["RefLink[Module,paclet:ref/Module] effectively uses a renamed \
instance of y: "], ESameTest[{incr[x], incr[y]} /. 
   incr[x_] :> Module[{y = 1}, x + y], {1 + x, 1 + y}], 
 EComment["By evaluating the arguments to \
RefLink[RuleDelayed,paclet:ref/RuleDelayed], local scoping is avoided: "], 
 ESameTest[Module[{expr = x^2}, a /. RuleDelayed @@ {x_, expr}], a^2]]
