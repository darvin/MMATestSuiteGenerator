(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[NumberQ,paclet:ref/NumberQ] tests whether an \
object is explicitly a number:"], TapTestSame[NumberQ[5.6], True], 
 TapTestSame[NumberQ[x], False], 
 TapComment["The expression must be manifestly a number:"], 
 TapTestSame[NumberQ[Sqrt[2]], False], TapComment["You can test if a quantity \
represents a number with RefLink[NumericQ,paclet:ref/NumericQ]:"], 
 TapTestSame[NumericQ[Sqrt[2]], True], TapComment["On numerical coercion with \
RefLink[N,paclet:ref/N] such quantities generally become numbers:"], 
 TapTestSame[NumberQ[N[Sqrt[2]]], True], TapComment["RefLink[NumberQ,paclet:r\
ef/NumberQ][RefLink[Infinity,paclet:ref/Infinity]] gives \
RefLink[False,paclet:ref/False]. "], TapTestSame[NumberQ[Infinity], False], 
 TapComment["The same is true for complex and directed infinities:"], 
 TapTestSame[{c, d} = {(1 + I)/0, Infinity*(1 + I)}, 
  {ComplexInfinity, DirectedInfinity[(1 + I)/Sqrt[2]]}], 
 TapTestSame[{NumberQ[c], NumberQ[d]}, {False, False}], 
 TapComment["RefLink[NumberQ,paclet:ref/NumberQ][RefLink[Overflow,paclet:ref/\
Overflow][]] and \
RefLink[NumberQ,paclet:ref/NumberQ][RefLink[Underflow,paclet:ref/Underflow][]\
] give RefLink[True,paclet:ref/True]:"], 
 TapTestSame[{o, u} = {$MaxNumber*2, $MinNumber/2}, 
  {Overflow[], Underflow[]}], TapTestSame[{NumberQ[o], NumberQ[u]}, 
  {True, True}], TapComment[
  "They are both treated as RefLink[Real,paclet:ref/Real]:"], 
 TapTestSame[{Head[o], Head[u]}, {Real, Real}], 
 TapComment["Test if a matrix consists entirely of numbers:"], 
 TapTestSameBROKEN[m = {{1, 2/3}, {4., 5 + 6*I}} ;; MatrixQ[m, NumberQ], 
  True], TapComment["It does not evaluate with a symbolic argument:"], 
 TapTestSame[f[xp0], f[xp0]], 
 TapComment["It does evaluate when the argument is a number:"], 
 TapTestSameBROKEN[HoldComplete[Plot[f[xp0], {xp0, 0, 2}]], $Failed], 
 TapComment["Use RefLink[FindRoot,paclet:ref/FindRoot] to find all the \
solutions of the boundary value problem with x(0)=x(10)=0:"], 
 TapTestSameBROKEN[xps = xp0 /. {FindRoot[f[xp0], {xp0, 0.5, 1}], 
     FindRoot[f[xp0], {xp0, 1., 1.9}], FindRoot[f[xp0], {xp0, 1.9, 2.}]}, 
  {0.924845, 1.87817, 1.99927}], TapComment["Plot the solutions:"], 
 TapTestSameBROKEN[HoldComplete[
   sols = Table[First[x[t] /. NDSolve[{Derivative[1][Derivative[1][x]][t] + 
           Sin[x[t]] == 0, x[0] == 0, Derivative[1][x][0] == xp0}, x, 
        {t, 0, 10}]], {xp0, xps}]], $Failed], 
 TapTestSameBROKEN[HoldComplete[Plot[sols, {t, 0, 10}]], $Failed], 
 TapComment["RefLink[NumberQ,paclet:ref/NumberQ] is equivalent to \
RefLink[MatchQ,paclet:ref/MatchQ][#,_Integer|_Rational|_Real|_Complex]&:"], 
 TapTestSameBROKEN[TableForm[Table[{x, NumberQ[x], 
     (MatchQ[#1, _Integer | _Rational | _Real | _Complex] & )[x]}, 
    {x, {1, 3/2, 1.5, 1 + I, E, Sin[1], Underflow[], Overflow[], Infinity}}], 
   TableHeadings -> {{}, {"x", "NumberQ", "match"}}], 
  \[Null]*x*NumberQ*match*\[Null]*1*True*True*\[Null]*(3/2)*True*True*\[Null]*
    1.5*True*True*\[Null]*1 + I*True*True*\[Null]*E*False*False*\[Null]*
    Sin[1]*False*False*\[Null]*Underflow[]*True*True*\[Null]*Overflow[]*True*
    True*\[Null]*Infinity*False*False], 
 TapComment["If RefLink[NumberQ,paclet:ref/NumberQ][x] is \
RefLink[True,paclet:ref/True], then RefLink[NumericQ,paclet:ref/NumericQ][x] \
is also RefLink[True,paclet:ref/True]:"], 
 TapTestSameBROKEN[TableForm[Table[{x, NumberQ[x], NumericQ[x]}, 
    {x, {1, 3/2, 1.5, 1 + I, E, Sin[1], Underflow[], Overflow[], Infinity}}], 
   TableHeadings -> {{}, {"x", "NumberQ", "NumericQ"}}], 
  \[Null]*x*NumberQ*NumericQ*\[Null]*1*True*True*\[Null]*(3/2)*True*True*
    \[Null]*1.5*True*True*\[Null]*1 + I*True*True*\[Null]*E*False*True*
    \[Null]*Sin[1]*False*True*\[Null]*Underflow[]*True*True*\[Null]*
    Overflow[]*True*True*\[Null]*Infinity*False*False]]
