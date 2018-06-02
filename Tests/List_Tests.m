(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[{a, b, c, d}, {a, b, c, d}], 
 TapTestSameBROKEN[FullForm[{a, b, c, d}], {a, b, c, d}], 
 TapTestSameBROKEN[VectorQ[v], True], TapComment["Many operations work on \
vectors, like RefLink[Dot,paclet:ref/Dot] and RefLink[Norm,paclet:ref/Norm]:"]\
, TapTestSameBROKEN[v . v, 6.29 + (4 + x)^2], TapTestSameBROKEN[MatrixQ[m], 
  True], TapComment["Many operations work with matrices, like \
RefLink[Dot,paclet:ref/Dot], RefLink[Transpose,paclet:ref/Transpose], and \
RefLink[Det,paclet:ref/Det]:"], TapTestSameBROKEN[m . Transpose[m], 
  {{14, 36}, {36, 98}}], TapTestSameBROKEN[Det[Transpose[m] . m], 0], 
 TapTestSameBROKEN[ArrayQ[ra], True], TapComment["Many operations work on \
arrays of any depth, like RefLink[Dot,paclet:ref/Dot] and \
RefLink[Fourier,paclet:ref/Fourier]:"], TapTestSameBROKEN[ra . {1, 2, 3}, 
  {{14, 32}, {50, 68}, {86, 104}, {122, 140}}], 
 TapComment["The three-dimensional discrete Fourier transform:"], 
 TapTestSameBROKEN[Fourier[ra], 
  {{{61.2372 + 0.*I, -2.44949 - 1.41421*I, -2.44949 + 1.41421*I}, 
    {-7.34847 + 0.*I, 0. + 0.*I, 0. + 0.*I}}, 
   {{-14.6969 - 14.6969*I, 0. + 0.*I, 0. + 0.*I}, {0. + 0.*I, 0. + 0.*I, 
     0. + 0.*I}}, {{-14.6969 + 0.*I, 0. + 0.*I, 0. + 0.*I}, 
    {0. + 0.*I, 0. + 0.*I, 0. + 0.*I}}, 
   {{-14.6969 + 14.6969*I, 0. + 0.*I, 0. + 0.*I}, {0. + 0.*I, 0. + 0.*I, 
     0. + 0.*I}}}], TapComment[
  "Many structural functions will work with ragged arrays:"], 
 TapTestSameBROKEN[ragged[[All,1]], {1, 4, 6}], 
 TapTestSameBROKEN[Total /@ ragged, {6, 9, 6}], 
 TapComment["If the elements are at the same depth, you can use \
RefLink[PadRight,paclet:ref/PadRight] to make a rectangular array:"], 
 TapTestSameBROKEN[PadRight[ragged], {{1, 2, 3}, {4, 5, 0}, {6, 0, 0}}], 
 TapComment["RefLink[Range,paclet:ref/Range] constructs a list consisting of \
a range of values:"], TapTestSame[Range[4], {1, 2, 3, 4}], 
 TapTestSame[Range[4, -4, -2], {4, 2, 0, -2, -4}], 
 TapTestSame[Range[0., 1., 0.1], {0., 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 
   0.9, 1.}], TapComment[
  "RefLink[Array,paclet:ref/Array] constructs lists using a function:"], 
 TapTestSame[Array[f, 4], {f[1], f[2], f[3], f[4]}], 
 TapTestSame[Array[2^#1 & , 4], {2, 4, 8, 16}], 
 TapComment[
  "When given multiple dimensions, matrices or deeper arrays are \
constructed:"], TapTestSame[h[i_, j_] := 1/(i + j - 1); Array[h, {4, 3}], 
  {{1, 1/2, 1/3}, {1/2, 1/3, 1/4}, {1/3, 1/4, 1/5}, {1/4, 1/5, 1/6}}], 
 TapComment["RefLink[Table,paclet:ref/Table] constructs lists using an \
expression and an iterator:"], TapTestSame[Table[f[i], {i, 4}], 
  {f[1], f[2], f[3], f[4]}], TapTestSame[Table[2^i, {i, -4, 4}], 
  {1/16, 1/8, 1/4, 1/2, 1, 2, 4, 8, 16}], 
 TapTestSame[Table[h[i, j], {i, 4}, {j, 3}], {{1, 1/2, 1/3}, {1/2, 1/3, 1/4}, 
   {1/3, 1/4, 1/5}, {1/4, 1/5, 1/6}}], 
 TapTestSame[Table[h[i, j], {i, 4}, {j, i}], 
  {{1}, {1/2, 1/3}, {1/3, 1/4, 1/5}, {1/4, 1/5, 1/6, 1/7}}], 
 TapComment["Functional commands like RefLink[NestList,paclet:ref/NestList] \
create lists of the results:"], TapTestSameBROKEN[
  NestList[(3*#1)*(1 - #1) & , 0.1, 20], {0.1, 0.27, 0.5913, 0.724993, 
   0.598135, 0.721109, 0.603333, 0.717967, 0.607471, 0.71535, 0.610873, 
   0.713121, 0.613738, 0.711191, 0.616195, 0.709496, 0.618334, 0.707991, 
   0.620219, 0.706642, 0.621897}], TapTestSameBROKEN[
  HoldComplete[ListPlot[%, Filling -> Axis]], $Failed], 
 TapComment["Some trials of rolling a die until the same number comes up \
twice in a row:"], TapTestSameBROKEN[rolls, {5, 3, 2}], 
 TapTestSameBROKEN[rolls, {5, 1}], TapTestSameBROKEN[rolls, 
  {5, 1, 2, 4, 5, 1, 2}], TapComment["Add two vectors:"], 
 TapTestSame[{1, 2, 3} + {a, b, c}, {1 + a, 2 + b, 3 + c}], 
 TapComment["Scalar multiple:"], TapTestSame[2*{1, 2, 3}, {2, 4, 6}], 
 TapComment["Sine of a vector:"], TapTestSameBROKEN[
  Sin[2*Pi*Range[0., 1., 1/13]], {0., 0.464723, 0.822984, 0.992709, 0.935016, 
   0.663123, 0.239316, -0.239316, -0.663123, -0.935016, -0.992709, -0.822984, 
   -0.464723, -2.44929/10^16}], TapComment["Scalar multiple of a matrix:"], 
 TapTestSame[a*{{1, 2}, {3, 4}}, {{a, 2*a}, {3*a, 4*a}}], 
 TapComment["Matrix plus a vector adds the component of the vector to the \
rows of the matrix:"], TapTestSame[{{1, 2}, {3, 4}} + {a, b}, 
  {{1 + a, 2 + a}, {3 + b, 4 + b}}], 
 TapComment["Function applied element-wise to a matrix:"], 
 TapTestSameBROKEN[Exp[{{1., 2., 3.}, {4., 5., 6.}}], 
  {{2.71828, 7.38906, 20.0855}, {54.5982, 148.413, 403.429}}], 
 TapTestSameBROKEN[f[{1, 2, 3, 4}], {f[1], f[2], f[3], f[4]}], 
 TapComment["RefLink[Apply,paclet:ref/Apply] makes the elements of a list the \
arguments of a function: "], TapTestSame[f @@ {1, 2, 3}, f[1, 2, 3]], 
 TapComment["If you have a nested list, applying at level 1 gives a list f \
applied to the sublists:"], TapTestSame[Apply[f, {{1, 2}, {3, 4}, {5, 6}}, 
   {1}], {f[1, 2], f[3, 4], f[5, 6]}], TapComment["RefLink[Map,paclet:ref/Map\
] applies a function to the elements of a list:"], 
 TapTestSame[f /@ {1, 2, 3, 4}, {f[1], f[2], f[3], f[4]}], 
 TapComment["For a nested list, RefLink[Map,paclet:ref/Map] can apply f at \
any level or multiple levels:"], TapTestSame[Map[f, {{1, 2}, {3, 4}, {5, 6}}, 
   {2}], {{f[1], f[2]}, {f[3], f[4]}, {f[5], f[6]}}], 
 TapTestSame[Map[f, {{1, 2}, {3, 4}, {5, 6}}, 2], 
  {f[{f[1], f[2]}], f[{f[3], f[4]}], f[{f[5], f[6]}]}], 
 TapTestSameBROKEN[Table[Log[2, i], {i, list}], {0, 1, 2, 3}], 
 TapTestSameBROKEN[Sum[k, {k, list}], 15], TapTestSameBROKEN[list[[3]], 4], 
 TapComment["You can get multiple parts by specifying a list of parts:"], 
 TapTestSameBROKEN[list[[{1, -1}]], {1, 8}], 
 TapComment["Or by using RefLink[Span,paclet:ref/Span]:"], 
 TapTestSameBROKEN[list[[1 ;; -1 ;; 2]], {1, 4}], 
 TapComment["Use RefLink[Outer,paclet:ref/Outer] to apply a function to \
elements of multiple lists: "], TapTestSame[Outer[f, {1, 2}, {a, b, c}], 
  {{f[1, a], f[1, b], f[1, c]}, {f[2, a], f[2, b], f[2, c]}}], 
 TapTestSameBROKEN[Complement[s1, s2], {a, b}], 
 TapTestSameBROKEN[Union[s1, s2], {a, b, c, d, e}], 
 TapTestSameBROKEN[Intersection[s1, s2], {c}], 
 TapComment["Construct various combinatorial structures using \
RefLink[Subsets,paclet:ref/Subsets], RefLink[Tuples,paclet:ref/Tuples], and \
RefLink[IntegerPartitions,paclet:ref/IntegerPartitions]:"], 
 TapTestSame[Subsets[{1, 2, 3}], {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, 
   {1, 2, 3}}], TapTestSame[Tuples[{{0, 1}, {a, b}}], 
  {{0, a}, {0, b}, {1, a}, {1, b}}], TapTestSame[IntegerPartitions[5], 
  {{5}, {4, 1}, {3, 2}, {3, 1, 1}, {2, 2, 1}, {2, 1, 1, 1}, 
   {1, 1, 1, 1, 1}}], TapComment["Many commands use {var, vmin, vmax} as a \
specification of variable range:"], 
 TapTestSame[Integrate[Sin[x], {x, 0, Pi/2}], 1], 
 TapTestSameBROKEN[HoldComplete[NDSolve[{Derivative[1][x][t] == x[t], 
     x[0] == 1}, x, {t, 0, 1}]], $Failed], 
 TapTestSame[Table[var^2, {var, -1, 3}], {1, 0, 1, 4, 9}], 
 TapComment["Many commands use {Subscript[v, 1],Subscript[v, 2],\\[Ellipsis]} \
for a collection of variables:"], 
 TapTestSame[Solve[{x + y + z == 0, x + y == 1, y + z == 2}, {x, y, z}], 
  {{x -> -2, y -> 3, z -> -1}}], TapTestSameBROKEN[
  DSolve[{Derivative[1][x][t] == y[t], Derivative[1][y][t] == -x[t]}, {x, y}, 
   t], {{x -> Function[{t}, C[1]*Cos[t] + C[2]*Sin[t]], 
    y -> Function[{t}, C[2]*Cos[t] - C[1]*Sin[t]]}}], 
 TapComment[
  "A list of rules is returned as a solution by many solving commands:"], 
 TapTestSameBROKEN[r = FindRoot[{Cos[x^2 + y], x - 2*y}, {{x, 1}, {y, 2}}], 
  {x -> -1.528, y -> -0.764002}], TapComment["You can use the values of the \
results with RefLink[ReplaceAll,paclet:ref/ReplaceAll]:"], 
 TapTestSameBROKEN[{x, y} /. r, {-1.528, -0.764002}], 
 TapTestSameBROKEN[{Cos[x^2 + y], x - 2*y} /. r, {-5.26784/10^15, 0.}], 
 TapComment[
  "When multiple solutions are possible, the result is a list of rule lists:"]\
, TapTestSame[s2 = Solve[{x^2 + y^2 == 1, x + y == 0}, {x, y}], 
  {{x -> -(1/Sqrt[2]), y -> 1/Sqrt[2]}, {x -> 1/Sqrt[2], 
    y -> -(1/Sqrt[2])}}], TapComment["When a list of rule lists is used in \
RefLink[ReplaceAll,paclet:ref/ReplaceAll], you get a list of results:"], 
 TapTestSame[{x, y} /. s2, {{-(1/Sqrt[2]), 1/Sqrt[2]}, 
   {1/Sqrt[2], -(1/Sqrt[2])}}], TapTestSame[x^2 + y^2 == 1 && x + y == 0 /. 
   s2, {True, True}], TapComment["Even if there is only one solution, the \
extra RefLink[List,paclet:ref/List] is used for consistent structure:"], 
 TapTestSame[Solve[{x - y == 1, x + y == 0}, {x, y}], 
  {{x -> 1/2, y -> -(1/2)}}], TapComment["Sine of successive squares:"], 
 TapTestSameBROKEN[ssq = N[Sin[Range[10]^2]], {0.841471, -0.756802, 0.412118, 
   -0.287903, -0.132352, -0.991779, -0.953753, 0.920026, -0.629888, 
   -0.506366}], TapComment["Plot the data:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot[ssq]], $Failed], 
 TapComment["Data from a function sampled at points in two dimensions:"], 
 TapTestSameBROKEN[HoldComplete[f[x_, y_] := Sin[2*Pi*x*y]; 
    Short[data = Flatten[Table[{{x, y}, f[x, y]}, {x, 0., 1., 0.1}, 
        {y, 0., 1., 0.1}], 1]]], $Failed], 
 TapComment["A piecewise polynomial that interpolates the data:"], 
 TapTestSameBROKEN[HoldComplete[ifun = Interpolation[data]], $Failed], 
 TapComment[
  "Plot the RefLink[InterpolatingFunction,paclet:ref/InterpolatingFunction]:"]\
, TapTestSameBROKEN[HoldComplete[Plot3D[ifun[x, y], {x, 0, 1}, {y, 0, 1}]], 
  $Failed], TapComment["Plot the data directly:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot3D[Flatten /@ data]], $Failed], 
 TapTestSameBROKEN[HoldComplete[slist = SparseArray[list]], $Failed], 
 TapComment["They are RefLink[Equal,paclet:ref/Equal]:"], 
 TapTestSameBROKEN[slist == list, True], 
 TapComment["They can be equivalently used in many commands:"], 
 TapTestSameBROKEN[slist + 3 == list + 3, True], 
 TapTestSameBROKEN[Sin[N[slist]] == Sin[N[list]], True], 
 TapComment[
  "They are not identical because the representation is different:"], 
 TapTestSame[slist === list, False], TapComment["RefLink[Normal,paclet:ref/No\
rmal][slist] gives the RefLink[List,paclet:ref/List] representation:"], 
 TapTestSameBROKEN[Normal[slist], {1, 0, 1, 0, 0, 1, 0, 0, 0, 1}], 
 TapTestSameBROKEN[% === list, True]]
