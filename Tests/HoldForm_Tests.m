(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Addition in held form:"], 
 TapTestSameBROKEN[HoldForm[1 + 1], 1 + 1], 
 TapComment["An unevaluated assignment:"], TapTestSameBROKEN[HoldForm[x = 3], 
  x = 3], TapComment["An unevaluated power:"], 
 TapTestSameBROKEN[HoldForm[34^78], 34^78], TapComment["Evaluate the \
expression by applying RefLink[ReleaseHold,paclet:ref/ReleaseHold]:"], 
 TapTestSame[ReleaseHold[%], 285335317058486027411405324166464744463360460002\
598071329967949465250689557820764970048082035633315075321399848988573696], 
 TapComment["Show a formula and its evaluation: "], 
 TapTestSameBROKEN[HoldForm[Integrate[x^2/E^x^2, x]] == 
   Integrate[x^2/E^x^2, x], Integrate[x^2/E^x^2, x] == 
   ((-(1/2))*x)/E^x^2 + (1/4)*Sqrt[Pi]*Erf[x]], 
 TapComment["Display a sum of squares in unevaluated form:"], 
 TapTestSameBROKEN[$Failed, HoldComplete[1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 
    7^2 + 8^2 + 9^2 + 10^2]], 
 TapComment[
  "RefLink[HoldForm,paclet:ref/HoldForm] displays without a wrapper:"], 
 TapTestSameBROKEN[HoldForm[1 + 1], 1 + 1], 
 TapComment["See the RefLink[FullForm,paclet:ref/FullForm] expression:"], 
 TapTestSameBROKEN[FullForm[%], HoldForm[1 + 1]], 
 TapComment[
  "RefLink[Hold,paclet:ref/Hold] gives the held expression with a wrapper:"], 
 TapTestSame[Hold[1 + 1], Hold[1 + 1]]]
