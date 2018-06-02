(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Addition in held form:"], 
 ESameTestBROKEN[HoldForm[1 + 1], 1 + 1], 
 EComment["An unevaluated assignment:"], ESameTestBROKEN[HoldForm[x = 3], 
  x = 3], EComment["An unevaluated power:"], ESameTestBROKEN[HoldForm[34^78], 
  34^78], EComment["Evaluate the expression by applying \
RefLink[ReleaseHold,paclet:ref/ReleaseHold]:"], 
 ESameTestBROKEN[ReleaseHold[%], 28533531705848602741140532416646474446336046\
0002598071329967949465250689557820764970048082035633315075321399848988573696]\
, EComment["Show a formula and its evaluation: "], 
 ESameTestBROKEN[HoldForm[Integrate[x^2/E^x^2, x]] == 
   Integrate[x^2/E^x^2, x], Integrate[x^2/E^x^2, x] == 
   ((-(1/2))*x)/E^x^2 + (1/4)*Sqrt[Pi]*Erf[x]], 
 EComment["Display a sum of squares in unevaluated form:"], 
 ESameTestBROKEN[$Failed, HoldComplete[1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 
    7^2 + 8^2 + 9^2 + 10^2]], 
 EComment[
  "RefLink[HoldForm,paclet:ref/HoldForm] displays without a wrapper:"], 
 ESameTestBROKEN[HoldForm[1 + 1], 1 + 1], 
 EComment["See the RefLink[FullForm,paclet:ref/FullForm] expression:"], 
 ESameTestBROKEN[FullForm[%], HoldForm[1 + 1]], 
 EComment[
  "RefLink[Hold,paclet:ref/Hold] gives the held expression with a wrapper:"], 
 ESameTest[Hold[1 + 1], Hold[1 + 1]]]
