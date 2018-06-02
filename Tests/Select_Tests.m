(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Select elements that are even:"], 
 ESameTest[Select[{1, 2, 4, 7, 6, 2}, EvenQ], {2, 4, 6, 2}], 
 EComment["Use a pure function to test each element:"], 
 ESameTest[Select[{1, 2, 4, 7, 6, 2}, #1 > 2 & ], {4, 7, 6}], 
 EComment["Return only the first expression selected:"], 
 ESameTest[Select[{1, 2, 4, 7, 6, 2}, #1 > 2 & , 1], {4}], 
 EComment["Use the operator form of RefLink[Select,paclet:ref/Select]:"], 
 ESameTest[Select[EvenQ][{1, 2, 4, 7, 6, 2}], {2, 4, 6, 2}], 
 EComment["RefLink[Select,paclet:ref/Select] operates on values in an \
RefLink[Association,paclet:ref/Association]:"], 
 ESameTestBROKEN[HoldComplete[Select[\[LeftAssociation] a -> 1, b -> 2, 
     c -> 3, d -> 4 \[RightAssociation], #1 > 2 & ]], $Failed], 
 EComment["RefLink[Select,paclet:ref/Select] picks out elements for which \
applying the criterion explicitly yields RefLink[True,paclet:ref/True]:"], 
 ESameTest[Select[{1, 2, 4, 7, x}, #1 > 2 & ], {4, 7}], 
 EComment["Applying the criterion to the symbolic object x does not \
explicitly yield RefLink[True,paclet:ref/True]:"], ESameTest[x > 2, x > 2], 
 EComment["Find pairs containing x:"], 
 ESameTest[Select[{{1, y}, {2, x}, {3, x}, {4, z}, {5, x}}, 
   MemberQ[#1, x] & ], {{2, x}, {3, x}, {5, x}}], 
 EComment["Find up to 2 pairs containing x:"], 
 ESameTest[Select[{{1, y}, {2, x}, {3, x}, {4, z}, {5, x}}, 
   MemberQ[#1, x] & , 2], {{2, x}, {3, x}}], 
 EComment["Fewer than the requested elements may be returned:"], 
 ESameTest[Select[{{1, y}, {2, x}, {3, x}, {4, z}, {5, x}}, 
   MemberQ[#1, z] & , 2], {{4, z}}], EComment["RefLink[Select,paclet:ref/Sele\
ct] works with any head, not just RefLink[List,paclet:ref/List]:"], 
 ESameTest[Select[f[1, a, 2, b, 3], IntegerQ], f[1, 2, 3]], 
 EComment["RefLink[Select,paclet:ref/Select] works with \
RefLink[SparseArray,paclet:ref/SparseArray] objects:"], 
 ESameTestBROKEN[HoldComplete[s = SparseArray[Table[2^i -> i, {i, 0, 5}]]], 
  $Failed], ESameTestBROKEN[HoldComplete[Select[s, EvenQ]], $Failed], 
 EComment["The result may be a list if it is not sparse:"], 
 ESameTest[Select[s, OddQ], {1, 3, 5}], 
 EComment["Select numbers up to 100 that equal 1 modulo both 3 and 5:"], 
 ESameTest[Select[Range[100], Mod[#1, 3] == 1 && Mod[#1, 5] == 1 & ], 
  {1, 16, 31, 46, 61, 76, 91}], 
 EComment["Select 4-tuples that read the same in reverse:"], 
 ESameTest[Select[Tuples[{a, b}, 4], #1 == Reverse[#1] & ], 
  {{a, a, a, a}, {a, b, b, a}, {b, a, a, b}, {b, b, b, b}}], 
 EComment[
  "Find the first four 3*3 matrices of 0s and 1s that have determinant 1:"], 
 ESameTest[Select[Tuples[{0, 1}, {3, 3}], Det[#1] == 1 & , 4], 
  {{{0, 0, 1}, {1, 0, 0}, {0, 1, 0}}, {{0, 0, 1}, {1, 0, 0}, {0, 1, 1}}, 
   {{0, 0, 1}, {1, 0, 0}, {1, 1, 0}}, {{0, 0, 1}, {1, 0, 0}, {1, 1, 1}}}], 
 EComment["Select eigenvalues that lie within the unit circle:"], 
 ESameTestBROKEN[Select[Eigenvalues[RandomReal[1, {5, 5}]], Abs[#1] < 1 & ], 
  {0.632848 + 0.0944893*I, 0.632848 - 0.0944893*I, -0.442441 + 0.0657295*I, 
   -0.442441 - 0.0657295*I}], EComment["Find built-in Wolfram Language \
objects whose names are less than 3 characters long:"], 
 ESameTestBROKEN[Select[Names["*"], StringLength[#1] < 3 & ], 
  {C, D, Do, Dt, E, I, If, Im, In, K, N, O, On, Or, Pi, Re, Tr, Up, $, 
   \[SpanFromAbove], \[SpanFromBoth], \[SpanFromLeft]}], 
 EComment["Select numeric quantities from a product:"], 
 ESameTest[Select[7*Pi^2*x^2*y^2, NumericQ], 7*Pi^2], 
 ESameTestBROKEN[TableForm[Table[n = 10^k; p = app[n]; {n, p, Pi - p}, 
    {k, 1, 6}], TableHeadings -> {{}, {"n", "approximation", "error"}}], 
  \[Null]*n*approximation*error*\[Null]*10*2.4*0.741593*\[Null]*100*2.92*
    0.221593*\[Null]*1000*3.216 - 0.0744073*\[Null]*10000*3.1544 - 
   0.0128073*\[Null]*100000*3.14812 - 0.00652735*\[Null]*1000000*3.14213 - 
   0.000535346], EComment["RefLink[Select,paclet:ref/Select] is similar to \
RefLink[Cases,paclet:ref/Cases] except that it uses a function instead of a \
pattern:"], ESameTestBROKEN[list = RandomInteger[9, {10, 2}], 
  {{0, 7}, {5, 9}, {8, 7}, {2, 8}, {6, 8}, {4, 1}, {1, 8}, {3, 9}, {9, 7}, 
   {8, 5}}], ESameTestBROKEN[Select[list, f], {{0, 7}, {4, 1}, {1, 8}}], 
 EComment["Use RefLink[Cases,paclet:ref/Cases] to get the same result:"], 
 ESameTestBROKEN[Cases[list, x_ /; f[x]], {{0, 7}, {4, 1}, {1, 8}}]]
