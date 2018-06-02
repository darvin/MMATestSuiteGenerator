(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Test whether \\[Pi] is an element of the reals:"], 
 TapTestSame[Element[Pi, Reals], True], 
 TapComment["Test whether the point {1/2,1/3} belongs to the unit disk:"], 
 TapTestSame[Element[{1/2, 1/3}, Disk[]], True], 
 TapComment["Express domain membership for an expression:"], 
 TapTestSame[Element[x + y, Reals], Element[x + y, Reals]], 
 TapComment["Assert that the point {x,y,z} belongs to the unit ball:"], 
 TapTestSameBROKEN[Element[{x, y, z}, Ball[]], 
  Element[{x, y, z}, Ball[{0, 0, 0}]]], 
 TapComment["Use element assertions to integrate over a region:"], 
 TapTestSameBROKEN[Integrate[1, Element[{x, y, z}, Ball[]]], (4*Pi)/3], 
 TapComment["Or to optimize over a region:"], 
 TapTestSameBROKEN[MinValue[x + y, Element[{x, y, z}, Ball[]]], -Sqrt[2]], 
 TapComment["Enter using Esc\\[ThinSpace]elem\\[ThinSpace]Esc:"], 
 TapTestSame[Element[x, Reals], Element[x, Reals]], 
 TapComment["Test domain membership:"], 
 TapTestSame[(Element[Sqrt[2], #1] & ) /@ {Complexes, Algebraics, Reals, 
    Rationals, Integers, Primes}, {True, True, True, False, False, False}], 
 TapTestSameBROKEN[(Element[{3/2, 3/2}, #1] & ) /@ 
   {Subscript[\[ScriptCapitalR], 1], Subscript[\[ScriptCapitalR], 2], 
    Subscript[\[ScriptCapitalR], 3], Subscript[\[ScriptCapitalR], 4]}, 
  {True, False, True, True}], TapComment["Plot it:"], 
 TapTestSameBROKEN[HoldComplete[
   Show[{DiscretizeRegion[Subscript[\[ScriptCapitalR], 3]], 
     Graphics[{{Opacity[0.5], {Orange, Subscript[\[ScriptCapitalR], 1]}, 
        {Yellow, Subscript[\[ScriptCapitalR], 2]}, {Green, Disk[{-1, 0}], 
         Line[{{0, 0}, {2, 2}}]}}, {Red, PointSize[Large], 
        Point[{3/2, 3/2}]}}]}]], $Failed], 
 TapComment["Make domain membership assumptions:"], 
 TapTestSame[Refine[Sin[Pi*x], Element[x, Integers]], 0], 
 TapTestSameBROKEN[Integrate[Abs[1 - Abs[x + 2]], x, 
   Assumptions -> Element[x, Reals]], Inequality[Piecewise[-3]*x - (x^2/2)*x, 
   LessEqual, -3*9 + 3*x + x^2/2 - 3, Less, x, LessEqual, 
   -2*5 - x - x^2/2 - 2, Less, x, LessEqual, -1*6 + x + (x^2/2)*True]], 
 TapComment["Express region membership:"], 
 TapTestSame[Refine[Sqrt[(x + y - 2)^2], Element[{x, y}, Disk[]]], 
  2 - x - y], TapTestSameBROKEN[
  Solve[x + y == 1/2 && Element[{x, y}, Circle[]], {x, y}], 
  {{x -> (1/2)*(1 + (1/2)*(-1 - Sqrt[7])), y -> (1/4)*(1 + Sqrt[7])}, 
   {x -> (1/2)*(1 + (1/2)*(-1 + Sqrt[7])), y -> (1/4)*(1 - Sqrt[7])}}], 
 TapTestSame[Integrate[1, Element[{x, y}, Circle[]]], 2*Pi], 
 TapComment["Test domain membership using assumptions:"], 
 TapTestSame[Refine[Element[x^y + Log[x + y], Reals], x > 0 && y > 0], True], 
 TapComment["Test region membership using assumptions:"], 
 TapTestSame[Refine[Element[{x, y}, Rectangle[{-1, -1}, {1, 1}]], 
   x^2 + y^2 <= 1], True], TapComment["Specify variable domains:"], 
 TapTestSame[Reduce[E^x - 2*x == 3 && Element[x, Reals], x], 
  x == (1/2)*(-3 - 2*ProductLog[-(1/(2*E^(3/2)))]) || 
   x == (1/2)*(-3 - 2*ProductLog[-1, -(1/(2*E^(3/2)))])], 
 TapTestSame[FindInstance[x^2 - 2*y^2 == 1 && x > 10^10 && 
    Element[x | y, Integers], {x, y}], 
  {{x -> 26102926097, y -> 18457556052}}], 
 TapTestSame[Minimize[{x - y, x^2 + y^2 <= 100 && Element[x | y, Integers]}, 
   {x, y}], {-14, {x -> -8, y -> 6}}], 
 TapComment["Specify assumptions on objects matching a pattern:"], 
 TapTestSame[Simplify[Sin[2*Pi*x[1] + 4*x[2]*x[3]^2*Pi + a*Pi], 
   Element[x[_], Integers]], Sin[a*Pi]], 
 TapComment[
  "RefLink[TraditionalForm,paclet:ref/TraditionalForm] formatting:"], 
 TapTestSameBROKEN[x \[Element] \[DoubleStruckCapitalR], 
  Element[x, \[DoubleStruckCapitalR]]], TapComment["For a single variable, \
the negation of RefLink[Element,paclet:ref/Element] is automatically \
converted to RefLink[NotElement,paclet:ref/NotElement]:"], 
 TapTestSame[ !Element[a, Reals], NotElement[a, Reals]], 
 TapComment["For multiple variables, the negation of \
RefLink[Element,paclet:ref/Element] is not automatically simplified:"], 
 TapTestSame[ !Element[a | b | c, Reals],  !Element[a | b | c, Reals]], 
 TapComment["Use RefLink[LogicalExpand,paclet:ref/LogicalExpand] to find the \
representation in terms of RefLink[NotElement,paclet:ref/NotElement]:"], 
 TapTestSameBROKEN[LogicalExpand[%], NotElement[a, Reals] || 
   NotElement[b, Reals] || NotElement[c, Reals]], 
 TapComment[
  "RefLink[Element,paclet:ref/Element] asserts region membership:"], 
 TapTestSame[Element[{x, y}, Disk[]], Element[{x, y}, Disk[{0, 0}]]], 
 TapComment["RefLink[RegionMember,paclet:ref/RegionMember] gives explicit \
region membership conditions:"], TapTestSameBROKEN[
  RegionMember[Disk[], {x, y}], x^2 + y^2 <= 1], 
 TapComment["When domain membership cannot be decided the \
RefLink[Element,paclet:ref/Element] statement remains unevaluated:"], 
 TapTestSame[Element[I^Pi, Algebraics], Element[I^Pi, Algebraics]]]
