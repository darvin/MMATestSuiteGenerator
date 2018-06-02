(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Prepend[{a, b, c, d}, x], {x, a, b, c, d}], 
 EComment["Prepend to an RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[Prepend[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   3 -> d], \[LeftAssociation] 3 -> d, 1 -> a, 2 -> b \[RightAssociation]], 
 EComment[
  "Prepend several rules to an RefLink[Association,paclet:ref/Association]:"]\
, ESameTest[Prepend[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   {3 -> d, 4 -> e}], \[LeftAssociation] 4 -> e, 3 -> d, 1 -> a, 
   2 -> b \[RightAssociation]], 
 EComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 ESameTest[Prepend[f[a, b, c], x + y], f[x + y, a, b, c]], 
 EComment["Prepend a row to a matrix:"], 
 ESameTestBROKEN[MatrixForm[Prepend[{{a, b}, {c, d}}, {x, y}]], x*y*a*b*c*d], 
 EComment["Prepend to each row in a matrix:"], 
 ESameTestBROKEN[MatrixForm[(Prepend[#1, x] & ) /@ {{a, b}, {c, d}}], 
  x*a*b*x*c*d], EComment["Prepend a vector to a matrix:"], 
 ESameTestBROKEN[MatrixForm[MapThread[Prepend, {{{a, b}, {c, d}}, {x, y}}]], 
  x*a*b*y*c*d], EComment["Successively prepend to a list:"], 
 ESameTest[NestList[Prepend[#1, x] & , {a}, 5], 
  {{a}, {x, a}, {x, x, a}, {x, x, x, a}, {x, x, x, x, a}, 
   {x, x, x, x, x, a}}], ESameTest[Prepend[{a, b, c}, {x, y}], 
  {{x, y}, a, b, c}], ESameTestBROKEN[Flatten[%], {x, y, a, b, c}]]
