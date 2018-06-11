(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Give a string corresponding to the \
RefLink[OutputForm,paclet:ref/OutputForm] of x^2:"], 
 TapTestSameBROKEN[ToString[x^2], 2*x], TapTestSameBROKEN[Head[%], String], 
 TapComment["Give a string corresponding to the \
RefLink[InputForm,paclet:ref/InputForm]:"], 
 TapTestSameBROKEN[ToString[x^2, InputForm], x^2], 
 TapComment["Strings for RefLink[OutputForm,paclet:ref/OutputForm], \
RefLink[InputForm,paclet:ref/InputForm], \
RefLink[StandardForm,paclet:ref/StandardForm], and \
RefLink[TraditionalForm,paclet:ref/TraditionalForm] of an expression:"], 
 TapTestSameBROKEN[ToString[x^2 + y^3, OutputForm], 2*3*x + y], 
 TapTestSameBROKEN[ToString[x^2 + y^3, InputForm], x^2 + y^3], 
 TapTestSame[ToString[x^2 + y^3, StandardForm], x^2 + y^3], 
 TapTestSame[ToString[x^2 + y^3, TraditionalForm], x^2 + y^3], 
 TapComment["Non-default character encoding:"], 
 TapTestSame[ToString[\[Alpha], StandardForm], \[Alpha]], 
 TapTestSameBROKEN[ToString[\[Alpha], StandardForm, 
   CharacterEncoding -> "ASCII"], \[Alpha]], 
 TapComment["String representation of boxes:"], TapTestSameBROKEN[ToString[
   \(x\^2\), InputForm], x^2], 
 TapComment["Generate a string using the default encoding:"], 
 TapTestSame[ToString[\[Alpha]], \[Alpha]], 
 TapComment["Use ASCII encoding instead:"], 
 TapTestSameBROKEN[ToString[\[Alpha], CharacterEncoding -> "ASCII"], 
  \[Alpha]], TapComment[
  "Use RefLink[FormatType,paclet:ref/FormatType] to change the formatting:"], 
 TapTestSameBROKEN[ToString[Exp[x]], x*E], 
 TapTestSameBROKEN[ToString[Exp[x], FormatType -> StandardForm], E^x], 
 TapComment["Use the default setting of \
RefLink[InputForm,paclet:ref/InputForm] formatting:"], 
 TapTestSame[ToString[1.2, InputForm], 1.2], 
 TapComment["Explicitly set whether number marks should be included:"], 
 TapTestSameBROKEN[{ToString[1.2, InputForm, NumberMarks -> True], 
   ToString[1.2, InputForm, NumberMarks -> False]}, {1.2, 1.2}], 
 TapComment["By default the page width is infinite:"], 
 TapTestSame[ToString[Cos[x] + Cos[y]], Cos[x] + Cos[y]], 
 TapComment["Wrap to a new line after 9 characters in the string:"], 
 TapTestSameBROKEN[ToString[Cos[x] + Cos[y], PageWidth -> 10], 
  Cos[x] + Cos[y]], TapComment["Construct an indexed set of variables:"], 
 TapTestSame[v = (ToExpression[StringJoin["x", ToString[#1]]] & ) /@ 
    Range[5], {x1, x2, x3, x4, x5}], TapTestSame[x1 = 5; v, 
  {5, x2, x3, x4, x5}], TapComment[
  "Export data to files with programmatically created names:"], 
 TapTestSame[v = ({#1, #1[1.]} & ) /@ {Sin, Cos, Tan, Cot, Exp}, 
  {{Sin, 0.841471}, {Cos, 0.540302}, {Tan, 1.55741}, {Cot, 0.642093}, 
   {Exp, 2.71828}}], TapTestSameBROKEN[
  f[x_] := Export[ToFileName[$TemporaryDirectory, 
      StringJoin[ToString[x[[1]]], ".txt"]], x[[2]]]; 
   ofiles = (f /@ v ;; StringTake[#1, -7] & ) /@ ofiles, 
  {Sin . txt, Cos . txt, Tan . txt, Cot . txt, Exp . txt}], 
 TapTestSameBROKEN[Import /@ ofiles, {0.8414709848078965, 0.5403023058681398, 
   1.5574077246549023, 0.6420926159343306, 2.718281828459045}], 
 TapComment["Use RefLink[ToExpression,paclet:ref/ToExpression] to convert \
strings or boxes to expressions:"], TapTestSame[ToString[x^3, StandardForm], 
  x^3], TapTestSameBROKEN[ToExpression[%], x^3], 
 TapComment[
  "Use RefLink[ToBoxes,paclet:ref/ToBoxes] to convert expressions to boxes:"]\
, TapTestSameBROKEN[ToBoxes[%], SuperscriptBox[x, 3]], 
 TapComment["Use RefLink[ToString,paclet:ref/ToString] with \
RefLink[ToExpression,paclet:ref/ToExpression] to convert TeX to Wolfram \
Language syntax:"], TapTestSameBROKEN[t = \exp (y)+1.2 x, 1.2*x + e^y], 
 TapTestSame[ToExpression[ToString[t], TeXForm], e^y + 1.2*x], 
 TapComment["Use RefLink[StringLength,paclet:ref/StringLength] to find a \
string's length:"], TapTestSameBROKEN[
  s = ToString[FullForm[\[Alpha]*\[Beta]]], \[Alpha]*\[Beta]], 
 TapTestSame[StringLength[s], 24], TapComment["Use \
RefLink[Characters,paclet:ref/Characters] to extract the individual \
characters:"], TapTestSameBROKEN[HoldComplete[Characters[s]], $Failed], 
 TapComment["RefLink[ToString,paclet:ref/ToString] uses definitions from \
RefLink[Format,paclet:ref/Format] and \
RefLink[MakeBoxes,paclet:ref/MakeBoxes]:"], TapTestSame[ToString[kappa], 
  kappa], TapTestSame[kappa := \[Kappa]; ToString[kappa], \[Kappa]], 
 TapTestSame[ToString[gplus[a, b, c], StandardForm], gplus[a, b, c]], 
 TapTestSameBROKEN[HoldComplete[
   gplus /: MakeBoxes[gplus[x_, y_, n_], StandardForm] := 
      \(\*MakeBoxes[x, StandardForm] 
         \[CirclePlus]\_\(\*MakeBoxes[n, StandardForm]\) 
         \*MakeBoxes[y, StandardForm]\)
      ; ToString[gplus[a, b, c], StandardForm]], $Failed], 
 TapComment["RefLink[ToString,paclet:ref/ToString] by default uses \
RefLink[OutputForm,paclet:ref/OutputForm] formatting: "], 
 TapTestSameBROKEN[ToString[u + Style[i, Red]], u + i], 
 TapComment["Specify other formats to preserve styling information: "], 
 TapTestSameBROKEN[ToString[u + Style[i, Red], StandardForm], u + i], 
 TapTestSame[ToString[u + Style[i, Red], TraditionalForm], i + u]]
