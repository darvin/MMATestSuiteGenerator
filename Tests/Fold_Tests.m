(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapTestSame[Fold[f, x, {a, b, c, d}], f[f[f[f[x, a], b], c], d]], 
 TapTestSame[Fold[List, x, {a, b, c, d}], {{{{x, a}, b}, c}, d}], 
 TapTestSame[Fold[Times, 1, {a, b, c, d}], a*b*c*d], 
 TapTestSame[Fold[#1^#2 & , x, {a, b, c, d}], (((x^a)^b)^c)^d], 
 TapComment["The head need not be RefLink[List,paclet:ref/List]:"], 
 TapTestSame[Fold[f, x, p[a, b, c, d]], f[f[f[f[x, a], b], c], d]], 
 TapComment["Use RefLink[Throw,paclet:ref/Throw] to exit a \
RefLink[Fold,paclet:ref/Fold]:"], 
 TapTestSame[FoldList[#1^2 + #1 & , 2, Range[6]], 
  {2, 6, 42, 1806, 3263442, 10650056950806, 113423713055421844361000442}], 
 TapTestSame[Catch[Fold[If[#1 > 10^6, Throw[#1], #1^2 + #1] & , 2, 
    Range[6]]], 3263442], TapComment["Fold to the right:"], 
 TapTestSame[Fold[g[#2, #1] & , x, {a, b, c, d}], g[d, g[c, g[b, g[a, x]]]]], 
 TapComment["Create a nested polynomial (Horner form):"], 
 TapTestSame[Fold[x*#1 + #2 & , 0, {a, b, c, d, e}], 
  e + x*(d + x*(c + x*(b + a*x)))], 
 TapComment[
  "RefLink[HornerForm,paclet:ref/HornerForm] directly produces this output:"]\
, TapTestSame[HornerForm[Reverse[{a, b, c, d, e}] . x^Range[0, 4], x], 
  e + x*(d + x*(c + x*(b + a*x)))], TapComment["Form a continued fraction:"], 
 TapTestSame[Fold[1/(#2 + #1) & , x, Reverse[{a, b, c, d}]], 
  1/(a + 1/(b + 1/(c + 1/(d + x))))], 
 TapComment["Form a number from digits:"], 
 TapTestSame[Fold[10*#1 + #2 & , 0, {4, 5, 1, 6, 7, 8}], 451678], 
 TapComment["Form an alternating sum:"], 
 TapTestSame[Fold[#2 - #1 & , 0, Reverse[{a, b, c, d, e}]], 
  a - b + c - d + e], TapComment["Form a binary tree:"], 
 TapTestSame[Fold[List, x, {a, b, c, d}], {{{{x, a}, b}, c}, d}], 
 TapComment["Form a left-branching binary tree:"], 
 TapTestSame[Fold[{#2, #1} & , x, {a, b, c, d}], {d, {c, {b, {a, x}}}}], 
 TapComment["Form a function composition:"], 
 TapTestSame[Fold[#2[#1] & , x, {a, b, c, d}], d[c[b[a[x]]]]], 
 TapComment["Apply an indexed sequence of functions:"], 
 TapTestSame[Fold[{f[#1, #1], g[#1]}[[#2]] & , e, {1, 1, 2, 1, 2}], 
  g[f[g[f[f[e, e], f[e, e]]], g[f[f[e, e], f[e, e]]]]]], 
 TapComment["Successively partition a list:"], 
 TapTestSame[Fold[Partition, Range[30], {2, 4, 3}], 
  {{{{1, 2}, {3, 4}, {5, 6}, {7, 8}}, {{9, 10}, {11, 12}, {13, 14}, 
     {15, 16}}, {{17, 18}, {19, 20}, {21, 22}, {23, 24}}}}], 
 TapTestSameBROKEN[Dimensions[%], {1, 3, 4, 2}], 
 TapComment[
  "Folding with an empty list does not apply the function at all:"], 
 TapTestSame[Fold[f, x, {}], x], TapComment["RefLink[Fold,paclet:ref/Fold] \
returns the last element of RefLink[FoldList,paclet:ref/FoldList]:"], 
 TapTestSame[Fold[f, x, {a, b, c}], f[f[f[x, a], b], c]], 
 TapTestSame[FoldList[f, x, {a, b, c}], {x, f[x, a], f[f[x, a], b], 
   f[f[f[x, a], b], c]}], TapComment["Functions that ignore their second \
argument give the same result as in RefLink[Nest,paclet:ref/Nest]:"], 
 TapTestSame[Fold[f[#1] & , x, Range[5]], f[f[f[f[f[x]]]]]], 
 TapComment["An explicit form of the primitive recursive function \
r[z,r[s,r[s,r[s,p[2]]]]] [WebLink[more \
info,http://www.wolframscience.com/nksonline/page-907b-text]]:"], 
 TapTestSame[
  Array[Fold[Fold[2^Ceiling[Log[2, Ceiling[(#1 + 2)/(#2 + 2)]]]*(#2 + 2) - 
         2 - #1 & , #2, Range[#1]] & , 0, Range[#1]] & , 100], 
  {1, 2, 1, 0, 5, 2, 3, 3, 2, 2, 3, 4, 1, 8, 5, 4, 2, 2, 3, 3, 2, 2, 7, 2, 9, 
   5, 2, 12, 9, 7, 5, 4, 2, 2, 3, 4, 1, 8, 5, 4, 2, 2, 3, 3, 2, 2, 15, 8, 5, 
   1, 43, 20, 13, 10, 3, 14, 7, 3, 11, 8, 3, 8, 5, 4, 2, 2, 3, 4, 1, 24, 13, 
   5, 4, 2, 11, 4, 5, 5, 4, 1, 13, 6, 5, 5, 4, 2, 7, 5, 3, 1, 3, 3, 2, 2, 31, 
   14, 10, 3, 3, 2}], TapComment["Generate all subsets of a set:"], 
 TapTestSame[Fold[Function[{s, e}, Join[s, (Append[#1, e] & ) /@ s]], {{}}, 
   {a, b, c}], {{}, {a}, {b}, {a, b}, {c}, {a, c}, {b, c}, {a, b, c}}], 
 TapComment[
  "Find all possible sums of any of the elements of a list of numbers:"], 
 TapTestSame[Fold[Union[#1, #1 + #2] & , {0}, {1, 2, 2, 8}], 
  {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13}], 
 TapComment["The fourth Swinnerton-Dyer polynomial [WebLink[more \
info,http://mathworld.wolfram.com/Swinnerton-DyerPolynomial.html]]:"], 
 TapTestSame[Fold[Expand[(#1 /. x -> x + #2)*(#1 /. x -> x - #2)] & , x, 
   Sqrt[Prime[Range[4]]]], 46225 - 5596840*x^2 + 13950764*x^4 - 7453176*x^6 + 
   1513334*x^8 - 141912*x^10 + 6476*x^12 - 136*x^14 + x^16]]
