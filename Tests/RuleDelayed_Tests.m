(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment[":> holds its right-hand side unevaluated:"], 
 TapTestSame[x :> RandomReal[], x :> RandomReal[]], 
 TapComment[
  "The right-hand side is evaluated separately each time it is used:"], 
 TapTestSameBROKEN[{x, x, x} /. x :> RandomReal[], 
  {0.378563, 0.0598703, 0.504099}], 
 TapComment["Increment n each time x is replaced:"], 
 TapTestSame[n = 1; {x, x, a, b, x, x, c, d} /. x :> n++, 
  {1, 2, a, b, 3, 4, c, d}], TapComment["Evaluate the \
RefLink[StepMonitor,paclet:ref/StepMonitor] expression separately each time \
it is to be used:"], TapTestSame[FindRoot[Cos[x] == x, {x, 1}, 
   StepMonitor :> Print[x]], {x -> 0.739085}], 
 TapComment["Generate a diagonal matrix with random elements:"], 
 TapTestSameBROKEN[MatrixForm[SparseArray[{{i_, i_} :> RandomReal[]}, 
    {4, 4}]], 0.655978*0*0*0*0*0.339171*0*0*0*0*0.163612*0*0*0*0*0.371782], 
 TapComment["-> evaluates when it is first entered; :> when it is used:"], 
 TapTestSameBROKEN[{x, x, x, x} /. x -> RandomReal[], 
  {0.526621, 0.526621, 0.526621, 0.526621}], 
 TapTestSameBROKEN[{x, x, x, x} /. x :> RandomReal[], 
  {0.123567, 0.815383, 0.768442, 0.930826}], TapComment["RefLink[Module,pacle\
t:ref/Module] and RefLink[With,paclet:ref/With] do not affect local variables \
of RefLink[RuleDelayed,paclet:ref/RuleDelayed]:"], 
 TapTestSame[With[{x = 1}, a /. x_ :> x + 1], 1 + a], 
 TapComment["RefLink[Module,paclet:ref/Module] effectively uses a renamed \
instance of y: "], TapTestSame[{incr[x], incr[y]} /. 
   incr[x_] :> Module[{y = 1}, x + y], {1 + x, 1 + y}], 
 TapComment["By evaluating the arguments to \
RefLink[RuleDelayed,paclet:ref/RuleDelayed], local scoping is avoided: "], 
 TapTestSame[Module[{expr = x^2}, a /. RuleDelayed @@ {x_, expr}], a^2]]
