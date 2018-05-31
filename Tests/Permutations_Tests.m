(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Length-3 permutations of {a,b,c}:"], 
 ESameTest[Permutations[{a, b, c}], {{a, b, c}, {a, c, b}, {b, a, c}, 
   {b, c, a}, {c, a, b}, {c, b, a}}], 
 EComment["Length-3 permutations of {a,b,c,d}:"], 
 ESameTest[Permutations[{a, b, c, d}, {3}], {{a, b, c}, {a, b, d}, {a, c, b}, 
   {a, c, d}, {a, d, b}, {a, d, c}, {b, a, c}, {b, a, d}, {b, c, a}, 
   {b, c, d}, {b, d, a}, {b, d, c}, {c, a, b}, {c, a, d}, {c, b, a}, 
   {c, b, d}, {c, d, a}, {c, d, b}, {d, a, b}, {d, a, c}, {d, b, a}, 
   {d, b, c}, {d, c, a}, {d, c, b}}], 
 EComment["Repeated elements are treated as identical:"], 
 ESameTest[Permutations[{a, a, b}], {{a, a, b}, {a, b, a}, {b, a, a}}], 
 EComment["Use any expressions as elements:"], 
 ESameTest[Permutations[{x, x^2, x + 1}], {{x, x^2, 1 + x}, {x, 1 + x, x^2}, 
   {x^2, x, 1 + x}, {x^2, 1 + x, x}, {1 + x, x, x^2}, {1 + x, x^2, x}}], 
 EComment["Get permutations of all lengths, shortest ones first:"], 
 ESameTest[Permutations[Range[3], All], {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, 
   {2, 1}, {2, 3}, {3, 1}, {3, 2}, {1, 2, 3}, {1, 3, 2}, {2, 1, 3}, 
   {2, 3, 1}, {3, 1, 2}, {3, 2, 1}}], 
 EComment["Get even-length permutations, longest ones first:"], 
 ESameTest[Permutations[Range[4], {4, 0, -2}], {{1, 2, 3, 4}, {1, 2, 4, 3}, 
   {1, 3, 2, 4}, {1, 3, 4, 2}, {1, 4, 2, 3}, {1, 4, 3, 2}, {2, 1, 3, 4}, 
   {2, 1, 4, 3}, {2, 3, 1, 4}, {2, 3, 4, 1}, {2, 4, 1, 3}, {2, 4, 3, 1}, 
   {3, 1, 2, 4}, {3, 1, 4, 2}, {3, 2, 1, 4}, {3, 2, 4, 1}, {3, 4, 1, 2}, 
   {3, 4, 2, 1}, {4, 1, 2, 3}, {4, 1, 3, 2}, {4, 2, 1, 3}, {4, 2, 3, 1}, 
   {4, 3, 1, 2}, {4, 3, 2, 1}, {1, 2}, {1, 3}, {1, 4}, {2, 1}, {2, 3}, 
   {2, 4}, {3, 1}, {3, 2}, {3, 4}, {4, 1}, {4, 2}, {4, 3}, {}}], 
 EComment["The list of elements can have any head:"], 
 ESameTest[Permutations[f[a, b, c]], {f[a, b, c], f[a, c, b], f[b, a, c], 
   f[b, c, a], f[c, a, b], f[c, b, a]}], EComment["The number of length-n \
permutations of a length-n list of distinct elements is n!:"], 
 ESameTest[Length[Permutations[Range[5]]], 120], ESameTest[5!, 120], 
 EComment["The number of length-r permutations of a length-n list of distinct \
elements is n!/(n-r)!:"], ESameTest[Length[Permutations[Range[5], {3}]], 60], 
 ESameTest[5!/(5 - 3)!, 60], EComment["If the input list is in the order \
given by RefLink[Sort,paclet:ref/Sort], so are its length-r permutations:"], 
 ESameTest[Sort[Permutations[{a, b, c, d}, {3}]] === 
   Permutations[{a, b, c, d}, {3}], True]]
