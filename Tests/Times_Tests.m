(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Enter RefLink[Times,paclet:ref/Times] with spaces; * is \
added automatically between numbers:"], TapTestSame[2*3*4, 24], 
 TapComment["Alternative form:"], TapTestSame[2*3*4, 24], 
 TapComment["RefLink[Times,paclet:ref/Times] threads element-wise over \
lists:"], TapTestSame[2*{x, y, z}, {2*x, 2*y, 2*z}], 
 TapTestSame[{{a, b}, {c, d}}*{x, y}, {{a*x, b*x}, {c*y, d*y}}], 
 TapComment["Explicit RefLink[FullForm,paclet:ref/FullForm]:"], 
 TapTestSame[1*2*3, 6], TapComment[
  "RefLink[Times,paclet:ref/Times] threads element-wise:"], 
 TapTestSame[{{a, b}, {c, d}}*{x, y}, {{a*x, b*x}, {c*y, d*y}}], 
 TapComment["Pattern matching works with RefLink[Times,paclet:ref/Times]:"], 
 TapTestSame[a*b*c*d /. a*d -> x, b*c*x], 
 TapTestSame[a*b*c*d /. a*c*(x_) -> f[x], f[b*d]], 
 TapTestSame[{a, a*b, a*b*c} /. a*(x_.) -> f[x], {f[1], f[b], f[b*c]}], 
 TapComment["Use RefLink[Expand,paclet:ref/Expand] to expand out products:"], 
 TapTestSame[(1 + x)*(2 + x), (1 + x)*(2 + x)], 
 TapTestSameBROKEN[Expand[%], 2 + 3*x + x^2], 
 TapComment[
  "Use RefLink[Dot,paclet:ref/Dot] for matrix or vector multiplication:"], 
 TapTestSame[{{a, b}, {c, d}} . {x, y}, {a*x + b*y, c*x + d*y}], 
 TapComment[
  "Use RefLink[Product,paclet:ref/Product] for products of indexed elements: \
"], TapTestSame[Product[a[i], {i, 5}], a[1]*a[2]*a[3]*a[4]*a[5]], 
 TapComment["As well as for closed forms of products: "], 
 TapTestSame[Product[(i + 1)/(i + 2), {i, 1, n}], 2/(2 + n)], 
 TapComment["Use \
RefLink[NonCommutativeMultiply,paclet:ref/NonCommutativeMultiply] for non \
commuting products: "], TapTestSame[a**b - b**a, a**b - b**a]]
