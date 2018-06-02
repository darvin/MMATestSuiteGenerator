(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[ESameTest[Append[{a, b, c, d}, x], {a, b, c, d, x}], 
 EComment["Append to an RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[Append[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   3 -> d], \[LeftAssociation] 1 -> a, 2 -> b, 3 -> d \[RightAssociation]], 
 EComment[
  "Append several rules to an RefLink[Association,paclet:ref/Association]:"], 
 ESameTest[Append[\[LeftAssociation] 1 -> a, 2 -> b \[RightAssociation], 
   {3 -> d, 4 -> e}], \[LeftAssociation] 1 -> a, 2 -> b, 3 -> d, 
   4 -> e \[RightAssociation]], 
 EComment["Use a head other than RefLink[List,paclet:ref/List]:"], 
 ESameTest[Append[f[a, b, c], x + y], f[a, b, c, x + y]], 
 EComment["Append a row to a matrix:"], 
 ESameTestBROKEN[MatrixForm[Append[{{a, b}, {c, d}}, {x, y}]], a*b*c*d*x*y], 
 EComment["Append to each row in a matrix:"], 
 ESameTestBROKEN[MatrixForm[(Append[#1, x] & ) /@ {{a, b}, {c, d}}], 
  a*b*x*c*d*x], EComment["Append a vector to a matrix:"], 
 ESameTestBROKEN[MatrixForm[MapThread[Append, {{{a, b}, {c, d}}, {x, y}}]], 
  a*b*x*c*d*y], EComment["Successively append to a list:"], 
 ESameTest[NestList[Append[#1, x] & , {a}, 5], {{a}, {a, x}, {a, x, x}, 
   {a, x, x, x}, {a, x, x, x, x}, {a, x, x, x, x, x}}], 
 ESameTest[Append[{a, b, c}, {x, y}], {a, b, c, {x, y}}], 
 ESameTestBROKEN[Flatten[%], {a, b, c, x, y}]]
