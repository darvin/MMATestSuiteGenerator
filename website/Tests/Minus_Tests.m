ESimpleExamples[EComment[
  "RefLink[Minus,paclet:ref/Minus] automatically distributes over groupings:"]\
, ESameTest[-(1 - x + x^2), -1 + x - x^2], 
 EComment[
  "RefLink[Minus,paclet:ref/Minus] threads element-wise over lists:"], 
 ESameTest[-{1, 2, 3}, {-1, -2, -3}], 
 EComment["Explicit RefLink[FullForm,paclet:ref/FullForm]:"], 
 ESameTest[-x, -x], ESameTestBROKEN[FullForm[%], -x], 
 EComment["Pattern match both x and -x:"], ESameTest[Cases[{x, -x}, (a_.)*x], 
  {x, -x}]]
