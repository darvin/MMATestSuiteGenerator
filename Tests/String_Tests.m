(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Enter a string:"], TapTestSameBROKEN[
  HoldComplete["This is a string."], $Failed], 
 TapComment["RefLink[InputForm,paclet:ref/InputForm] shows quotes:"], 
 TapTestSameBROKEN[InputForm[%], "This is a string."], 
 TapComment["Enter explicit newlines using \\n:"], 
 TapTestSameBROKEN["one\ntwo\nthree", one*two*three], 
 TapComment["\"\" is the empty string, which normally does not print:"], 
 TapTestSameBROKEN[{"", x, "", ""}, {Null, x, Null, Null}], 
 TapComment["RefLink[InputForm,paclet:ref/InputForm] explicitly shows the \
empty strings:"], TapTestSameBROKEN[InputForm[%], {"", x, "", ""}], 
 TapComment[
  "Strings can contain any sequence of ordinary and special characters:"], 
 TapTestSameBROKEN["\[FilledDiamond] String \[Alpha]\[Beta]\[Gamma] \
\[LongLeftRightArrow] \[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC] \
\[ReturnIndicator]", \[FilledDiamond]*String*
   \[Alpha]\[Beta]\[Gamma] \[LongLeftRightArrow] 
    \[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]*\[ReturnIndicator]], 
 TapComment[
  "In RefLink[FullForm,paclet:ref/FullForm], full character names are used:"]\
, TapTestSameBROKEN[FullForm[%], "\[FilledDiamond] String \
\[Alpha]\[Beta]\[Gamma] \[LongLeftRightArrow] \
\[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC] \[ReturnIndicator]"], 
 TapComment["Strings preserve internal formatting:"], 
 TapTestSameBROKEN["red blue green italic", red*blue*green*italic], 
 TapComment["All strings have head RefLink[String,paclet:ref/String]:"], 
 TapTestSame[Head["a string"], String], 
 TapComment["_String matches any string, but not a symbol:"], 
 TapTestSameBROKEN[Cases[{1, 2, "ab", "cd", x, y}, _String], {ab, cd}], 
 TapComment["Strings can have any expression embedded:"], 
 TapTestSameBROKEN[HoldComplete["ab \[Integral]1/x\[DifferentialD]x cd"], 
  $Failed], TapTestSameBROKEN[FullForm[%], 
  "ab \[Integral]\!\(\*FractionBox[\(1\), \(x\)]\)\[DifferentialD]x cd"], 
 TapComment["Strings can contain graphics:"], 
 TapTestSameBROKEN[HoldComplete[
   "ab \!\(\*\nGraphicsBox[DiskBox[{0, 0}],\nImageSize->{34., Automatic}]\) \
cd"], $Failed], TapTestSameBROKEN[FullForm[%], 
  "ab \!\(\*\nGraphicsBox[DiskBox[{0, 0}],\nImageSize->{34., Automatic}]\) \
cd"], TapComment["Create formatted text:"], 
 TapTestSameBROKEN[HoldComplete[Style["This is a string.", FontSize -> 25, 
    FontFamily -> "Helvetica"]], $Failed], 
 TapTestSameBROKEN[{f["X"], f["ABCDEF"], f[x], f[{a, b, c}]}, 
  {X, BCDEFA, f[x], f[{a, b, c}]}], 
 TapComment["Use strings as plot markers:"], 
 TapTestSameBROKEN[HoldComplete[ListPlot[{{1, 2, 3}, {3, 1, 4}}, 
    PlotMarkers -> {"A", "B"}]], $Failed], 
 TapComment["Give text in graphics:"], TapTestSameBROKEN[
  HoldComplete[Graphics[{Text["abcde", {0, -2}], Disk[{0, 0}], 
     Text["ABCDE", {0, 2}]}]], $Failed], 
 TapComment["Break a string into characters:"], 
 TapTestSameBROKEN[HoldComplete[Characters["This is a string."]], $Failed], 
 TapComment["Reconstruct the string:"], TapTestSameBROKEN[
  HoldComplete[StringJoin[%]], $Failed], 
 TapComment["Find character codes for characters in a string:"], 
 TapTestSame[ToCharacterCode["This is a string."], 
  {84, 104, 105, 115, 32, 105, 115, 32, 97, 32, 115, 116, 114, 105, 110, 103, 
   46}], TapComment["Reconstruct the string:"], 
 TapTestSameBROKEN[HoldComplete[FromCharacterCode[%]], $Failed], 
 TapComment["Turn a string into an expression:"], 
 TapTestSame[ToExpression["1+x^4"], 1 + x^4], TapComment["RefLink[ToString,pa\
clet:ref/ToString] creates strings, by default with \
RefLink[OutputForm,paclet:ref/OutputForm]:"], 
 TapTestSameBROKEN[ToString[1 + x^4], 4*1 + x], 
 TapTestSameBROKEN[FullForm[%], "     4\n1 + x"], 
 TapComment[
  "Create a string containing RefLink[InputForm,paclet:ref/InputForm]:"], 
 TapTestSameBROKEN[ToString[1 + x^4, InputForm], 1 + x^4], 
 TapTestSameBROKEN[FullForm[%], "1 + x^4"], 
 TapComment["Use \\\" to enter a \" inside a string:"], 
 TapTestSameBROKEN["a string with \"quotes\"", a*string*with*"quotes"], 
 TapComment["Strings are treated as \"atoms\" with no parts:"], 
 TapTestSame[Length["a string"], 0], TapComment["Use \
RefLink[StringLength,paclet:ref/StringLength] to find the character length of \
a string:"], TapTestSame[StringLength["a string"], 8], 
 TapComment[
  "Strings do not automatically insert spacing around operator characters:"], 
 TapTestSameBROKEN["x->a+b+c+d", x -> a + b + c + d], 
 TapTestSame[x -> a + b + c + d, x -> a + b + c + d], 
 TapComment["An RefLink[InputForm,paclet:ref/InputForm] string contains \
explicit space characters:"], TapTestSameBROKEN[ToString[%, InputForm], 
  x -> a + b + c + d], TapComment["The actual sequences of characters in a \
formatted string can be fairly complicated:"], 
 TapTestSameBROKEN[FullForm["red italic"], "\!\(\*\nStyleBox[\"red\",\nFontCo\
lor->RGBColor[1, 0, 0]]\) \
\!\(\*\nStyleBox[\"italic\",\nFontSlant->\"Italic\"]\)"], 
 TapTestSameBROKEN[FullForm[
   "ab \!\(\*\nGraphicsBox[DiskBox[{0, 0}],\nImageSize->{34., Automatic}]\) \
cd"], 
  "ab \!\(\*\nGraphicsBox[DiskBox[{0, 0}],\nImageSize->{34., Automatic}]\) \
cd"], TapComment["A string with special characters usually does not include \
the long form of the character: "], TapTestSameBROKEN["\[Alpha]", \[Alpha]], 
 TapComment["Force long form names to be used: "], 
 TapTestSameBROKEN[ToString[FullForm["\[Alpha]"]], "\[Alpha]"], 
 TapTestSameBROKEN[ToString["\[Alpha]", InputForm, 
   CharacterEncoding -> None], "\[Alpha]"]]
