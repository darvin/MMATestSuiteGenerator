ESimpleExamples[EComment["A table of the first 10 squares:"], 
 ESameTest[Table[i^2, {i, 10}], {1, 4, 9, 16, 25, 36, 49, 64, 81, 100}], 
 EComment["A table with i running from 0 to 20 in steps of 2:"], 
 ESameTest[Table[f[i], {i, 0, 20, 2}], {f[0], f[2], f[4], f[6], f[8], f[10], 
   f[12], f[14], f[16], f[18], f[20]}], EComment["A list of 10 x's:"], 
 ESameTest[Table[x, {10}], {x, x, x, x, x, x, x, x, x, x}], 
 EComment["Make a 4*3 matrix:"], ESameTest[Table[10*i + j, {i, 4}, {j, 3}], 
  {{11, 12, 13}, {21, 22, 23}, {31, 32, 33}, {41, 42, 43}}], 
 ESameTestBROKEN[MatrixForm[%], 11*12*13*21*22*23*31*32*33*41*42*43], 
 EComment["Plot a table:"], ESameTestBROKEN[
  HoldComplete[ListPlot[Table[Prime[i], {i, 50}]]], $Failed], 
 EComment["Arrange a table in a column:"], 
 ESameTestBROKEN[Column[Table[Prime[i], {i, 5}]], 2*3*5*7*11], 
 EComment["The index in the table can run backwards:"], 
 ESameTest[Table[f[i], {i, 10, -5, -2}], {f[10], f[8], f[6], f[4], f[2], 
   f[0], f[-2], f[-4]}], EComment["Make a triangular array:"], 
 ESameTest[Table[10*i + j, {i, 5}, {j, i}], {{11}, {21, 22}, {31, 32, 33}, 
   {41, 42, 43, 44}, {51, 52, 53, 54, 55}}], ESameTestBROKEN[TableForm[%], 
  11*21*22*31*32*33*41*42*43*44*51*52*53*54*55], 
 EComment["Make a 3x2x4 array, or tensor:"], 
 ESameTest[Table[100*i + 10*j + k, {i, 3}, {j, 2}, {k, 4}], 
  {{{111, 112, 113, 114}, {121, 122, 123, 124}}, 
   {{211, 212, 213, 214}, {221, 222, 223, 224}}, 
   {{311, 312, 313, 314}, {321, 322, 323, 324}}}], 
 EComment["Iterate over an existing list:"], 
 ESameTest[Table[Sqrt[x], {x, {1, 4, 9, 16}}], {1, 2, 3, 4}], 
 EComment["Make an array from existing lists:"], 
 ESameTest[Table[j^(1/i), {i, {1, 2, 4}}, {j, {1, 4, 9}}], 
  {{1, 4, 9}, {1, 2, 3}, {1, Sqrt[2], Sqrt[3]}}], 
 EComment["The table index can have symbolic values:"], 
 ESameTest[Table[2^x + x, {x, a, a + 5*n, n}], {2^a + a, 2^(a + n) + a + n, 
   2^(a + 2*n) + a + 2*n, 2^(a + 3*n) + a + 3*n, 2^(a + 4*n) + a + 4*n, 
   2^(a + 5*n) + a + 5*n}], 
 EComment["The variables need not just be symbols:"], 
 ESameTestBROKEN[Table[a[x]!, {a[x], 6}], {1, 2, 6, 24, 120, 720}], 
 ESameTest[Table[x[1]^2 + x[2]^2, {x[1], 3}, {x[2], 3}], 
  {{2, 5, 10}, {5, 8, 13}, {10, 13, 18}}], 
 EComment["Make a table of graphics:"], 
 ESameTestBROKEN[HoldComplete[Table[Plot[BesselJ[n, x], {x, 0, 10}], 
    {n, 4}]], $Failed], EComment["Generate the corners of a polygon:"], 
 ESameTestBROKEN[HoldComplete[
   Graphics[Polygon[Table[{Sin[2*n*(Pi/5)], Cos[2*n*(Pi/5)]}, {n, 0, 5}]]]], 
  $Failed], ESameTestBROKEN[HoldComplete[
   Graphics3D[Table[Sphere[{i, Mod[i^2, 10], Mod[i^3, 12]}], {i, 40}]]], 
  $Failed], EComment["Make Pascal's triangle:"], 
 ESameTestBROKEN[Column[Table[Binomial[i, j], {i, 0, 8}, {j, 0, i}], Center], 
  {1}*{1, 1}*{1, 2, 1}*{1, 3, 3, 1}*{1, 4, 6, 4, 1}*{1, 5, 10, 10, 5, 1}*
   {1, 6, 15, 20, 15, 6, 1}*{1, 7, 21, 35, 35, 21, 7, 1}*
   {1, 8, 28, 56, 70, 56, 28, 8, 1}], ESameTestBROKEN[
  Table[Style["text", s], {s, 10, 20}], {text, text, text, text, text, text, 
   text, text, text, text, text}], ESameTestBROKEN[
  HoldComplete[ListLinePlot[Table[DigitCount[n, 2, 1], {n, 128}]]], $Failed], 
 ESameTestBROKEN[Grid[Table[{i, Prime[i]}, {i, 10}]], 
  1*2*2*3*3*5*4*7*5*11*6*13*7*17*8*19*9*23*10*29], 
 ESameTestBROKEN[HoldComplete[ArrayPlot[Table[GCD[i, j], {i, 10}, {j, 10}]]], 
  $Failed], EComment[
  "Print the values of the table index while the table is being generated:"], 
 ESameTest[Table[Print[i]; i^i^i, {i, 3}], {1, 16, 7625597484987}], 
 EComment["Monitor the values by showing them in a temporary cell:"], 
 ESameTest[Monitor[Table[Pause[1]; i^i^i, {i, 3}], i], 
  {1, 16, 7625597484987}], EComment["RefLink[Range,paclet:ref/Range] gives \
the sequence of values of a table iterator:"], 
 ESameTest[Range[1, 10, 2], {1, 3, 5, 7, 9}], 
 ESameTest[Table[i, {i, 1, 10, 2}], {1, 3, 5, 7, 9}], 
 ESameTest[Table[i^i, {i, 3}], {1, 4, 27}], EComment["RefLink[Sum,paclet:ref/\
Sum] effectively applies RefLink[Plus,paclet:ref/Plus] to results from \
RefLink[Table,paclet:ref/Table]:"], ESameTest[Sum[x^i, {i, 3}], 
  x + x^2 + x^3], ESameTest[Table[x^i, {i, 3}], {x, x^2, x^3}], 
 EComment["RefLink[Array,paclet:ref/Array] iterates over successive \
integers:"], ESameTest[Array[#1^#2 & , {3, 4}], 
  {{1, 1, 1, 1}, {2, 4, 8, 16}, {3, 9, 27, 81}}], 
 ESameTest[Array[Function[{x, y}, x^y], {3, 4}], 
  {{1, 1, 1, 1}, {2, 4, 8, 16}, {3, 9, 27, 81}}], 
 ESameTest[Table[x^y, {x, 3}, {y, 4}], {{1, 1, 1, 1}, {2, 4, 8, 16}, 
   {3, 9, 27, 81}}], EComment["RefLink[Map,paclet:ref/Map] applies a function \
to successive elements in a list:"], ESameTestBROKEN[
  list = RandomInteger[9, 10], {1, 6, 1, 0, 0, 7, 4, 7, 9, 8}], 
 ESameTestBROKEN[(Last[IntegerDigits[#1, 2]] & ) /@ list, 
  {1, 0, 1, 0, 0, 1, 0, 1, 1, 0}], EComment["RefLink[Table,paclet:ref/Table] \
can substitute successive elements in a list into an expression:"], 
 ESameTestBROKEN[Table[Last[IntegerDigits[x, 2]], {x, list}], 
  {1, 0, 1, 0, 0, 1, 0, 1, 1, 0}], EComment["Using multiple iteration \
specifications is equivalent to nesting RefLink[Table,paclet:ref/Table] \
functions: "], ESameTest[Table[i + j, {i, 3}, {j, i}], 
  {{2}, {3, 4}, {4, 5, 6}}], ESameTest[Table[Table[i + j, {j, i}], {i, 3}], 
  {{2}, {3, 4}, {4, 5, 6}}], EComment["Feed in parameters for tables:"], 
 ESameTest[(Table[i - j, {i, #1}, {j, #2}] & ) @@ {4, 5}, 
  {{0, -1, -2, -3, -4}, {1, 0, -1, -2, -3}, {2, 1, 0, -1, -2}, 
   {3, 2, 1, 0, -1}}], ESameTestBROKEN[(Table[i - j, ##1] & ) @@ 
   {{i, 4}, {j, 5}}, {{0, -1, -2, -3, -4}, {1, 0, -1, -2, -3}, 
   {2, 1, 0, -1, -2}, {3, 2, 1, 0, -1}}], 
 EComment["Use RefLink[Apply,paclet:ref/Apply] to splice a complete iterator \
specification into RefLink[Table,paclet:ref/Table]:"], 
 ESameTest[Table[{i[j], j + 1}, {j, 3}], {{i[1], 2}, {i[2], 3}, {i[3], 4}}], 
 ESameTestBROKEN[(Table[x, ##1] & ) @@ %, 
  {{{x, x, x, x}, {x, x, x, x}, {x, x, x, x}}, {{x, x, x, x}, {x, x, x, x}, 
    {x, x, x, x}}}], EComment["RefLink[With,paclet:ref/With] can insert the \
specification for a single iterator:"], 
 ESameTestBROKEN[With[{s = {i, 5}}, Table[i^2, s]], {1, 4, 9, 16, 25}], 
 EComment["For some step sizes, output from RefLink[Table,paclet:ref/Table] \
may not include the upper limit given:"], ESameTest[Table[x, {x, 0, 10, 3}], 
  {0, 3, 6, 9}], EComment["RefLink[Table,paclet:ref/Table] requires iterator \
specifications to be given explicitly:"], 
 ESameTest[Block[{p = {x, 5}}, Table[x^2, p]], Table[x^2, p]], 
 ESameTest[Block[{p = {x, 5}}, Table[x^2, Evaluate[p]]], {1, 4, 9, 16, 25}], 
 ESameTest[With[{p = {x, 5}}, Table[x^2, p]], {1, 4, 9, 16, 25}], 
 EComment["RefLink[Table,paclet:ref/Table] normally reevaluates at each \
step:"], ESameTestBROKEN[Table[RandomReal[], {5}], 
  {0.6432, 0.1499, 0.0420082, 0.696245, 0.904518}], 
 ESameTestBROKEN[Table[Evaluate[RandomReal[]], {5}], 
  {0.502914, 0.502914, 0.502914, 0.502914, 0.502914}], 
 EComment["The RefLink[Evaluate,paclet:ref/Evaluate] is needed to force \
evaluation of the table before it is fed to RefLink[Plot,paclet:ref/Plot]:"], 
 ESameTestBROKEN[HoldComplete[Plot[Evaluate[Table[BesselJ[n, x], {n, 5}]], 
    {x, 0, 15}]], $Failed], EComment["Values of \
RefLink[Table,paclet:ref/Table] variables do not get substituted inside held \
expressions:"], ESameTest[Table[Hold[i], {i, 5}], 
  {Hold[i], Hold[i], Hold[i], Hold[i], Hold[i]}], 
 EComment["Use RefLink[With,paclet:ref/With] to insert values:"], 
 ESameTest[Table[With[{i = i}, Hold[i]], {i, 5}], 
  {Hold[1], Hold[2], Hold[3], Hold[4], Hold[5]}], 
 EComment["Formatting wrappers such as RefLink[Grid,paclet:ref/Grid] give \
expressions that are no longer lists:"], 
 ESameTestBROKEN[Grid[Table[i*j, {i, 4}, {j, 4}]], 
  1*2*3*4*2*4*6*8*3*6*9*12*4*8*12*16], ESameTestBROKEN[x + %, 
  x + 1*2*3*4*2*4*6*8*3*6*9*12*4*8*12*16], ESameTestBROKEN[InputForm[%], 
  x + Grid[{{1, 2, 3, 4}, {2, 4, 6, 8}, {3, 6, 9, 12}, {4, 8, 12, 16}}]]]
