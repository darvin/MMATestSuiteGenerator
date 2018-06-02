(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Enter RefLink[Times,paclet:ref/Times] with spaces; \
* is added automatically between numbers:"], ESameTest[2*3*4, 24], 
 EComment["Alternative form:"], ESameTest[2*3*4, 24], 
 EComment[
  "RefLink[Times,paclet:ref/Times] threads element-wise over lists:"], 
 ESameTest[2*{x, y, z}, {2*x, 2*y, 2*z}], ESameTest[{{a, b}, {c, d}}*{x, y}, 
  {{a*x, b*x}, {c*y, d*y}}], 
 EComment["Explicit RefLink[FullForm,paclet:ref/FullForm]:"], 
 ESameTest[1*2*3, 6], 
 EComment["RefLink[Times,paclet:ref/Times] threads element-wise:"], 
 ESameTest[{{a, b}, {c, d}}*{x, y}, {{a*x, b*x}, {c*y, d*y}}], 
 EComment["Pattern matching works with RefLink[Times,paclet:ref/Times]:"], 
 ESameTest[a*b*c*d /. a*d -> x, b*c*x], 
 ESameTest[a*b*c*d /. a*c*(x_) -> f[x], f[b*d]], 
 ESameTest[{a, a*b, a*b*c} /. a*(x_.) -> f[x], {f[1], f[b], f[b*c]}], 
 EComment["Use RefLink[Expand,paclet:ref/Expand] to expand out products:"], 
 ESameTest[(1 + x)*(2 + x), (1 + x)*(2 + x)], 
 ESameTestBROKEN[Expand[%], 2 + 3*x + x^2], 
 EComment[
  "Use RefLink[Dot,paclet:ref/Dot] for matrix or vector multiplication:"], 
 ESameTest[{{a, b}, {c, d}} . {x, y}, {a*x + b*y, c*x + d*y}], 
 EComment[
  "Use RefLink[Product,paclet:ref/Product] for products of indexed elements: \
"], ESameTest[Product[a[i], {i, 5}], a[1]*a[2]*a[3]*a[4]*a[5]], 
 EComment["As well as for closed forms of products: "], 
 ESameTest[Product[(i + 1)/(i + 2), {i, 1, n}], 2/(2 + n)], 
 EComment["Use \
RefLink[NonCommutativeMultiply,paclet:ref/NonCommutativeMultiply] for non \
commuting products: "], ESameTest[a**b - b**a, a**b - b**a]]
