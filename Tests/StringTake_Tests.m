(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Take the first 6 characters in a string:"], 
 TapTestSame[StringTake["abcdefghijklm", 6], abcdef], 
 TapComment["Use RefLink[InputForm,paclet:ref/InputForm] to show quotes:"], 
 TapTestSame[InputForm[%], "abcdef"], 
 TapComment["Take from the end of the string:"], 
 TapTestSame[StringTake["abcdefghijklm", -4], jklm], 
 TapComment["Take characters 5 through 10:"], 
 TapTestSame[StringTake["abcdefghijklm", {5, 10}], efghij], 
 TapComment["Find character 6 in a string:"], 
 TapTestSame[StringTake["abcdefghijklm", {6}], f], 
 TapTestSame[InputForm[%], "f"], TapComment["Take every other character:"], 
 TapTestSame[StringTake["abcdefghijklm", {1, -1, 2}], acegikm], 
 TapComment["Take the last 2 characters from several strings:"], 
 TapTestSame[StringTake[{"abcdef", "stuv", "xyzw"}, -2], {ef, uv, zw}], 
 TapComment[
  "RefLink[StringTake,paclet:ref/StringTake] works with special characters:"]\
, TapTestSame[StringTake["\[FilledDiamond]\[Alpha]\[Beta]\[Gamma]\
\[LongLeftRightArrow]\[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]\
\[ReturnIndicator]", -4], 
  \[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]\[ReturnIndicator]], 
 TapComment["Newline (\\n) counts as a single character:"], 
 TapTestSameBROKEN[StringTake["abc\ndef", 5], abc*d], 
 TapComment["RefLink[StringTake,paclet:ref/StringTake] can effectively do \
\"part\" extraction in strings:"], 
 TapTestSame[Characters["abcdefghijklm"][[6]], f], 
 TapTestSame[StringTake["abcdefghijklm", {6}], f], 
 TapComment["RefLink[StringTake,paclet:ref/StringTake] works like applying \
RefLink[Take,paclet:ref/Take] to the list of characters:"], 
 TapTestSame[Take[Characters["abcdefghijklm"], {5, -4}], {e, f, g, h, i, j}], 
 TapTestSame[StringTake["abcdefghijklm", {5, -4}], efghij], 
 TapComment["Taking between positions 1 and 0 gives a zero-length string:"], 
 TapTestSameBROKEN[StringTake["abcdef", {1, 0}], Null], 
 TapTestSameBROKEN[FullForm[%], ""], TapComment["RefLink[StringTake,paclet:re\
f/StringTake] operates on the raw characters in a string:"], 
 TapTestSameBROKEN[HoldComplete[StringTake["red", -20]], $Failed], 
 TapTestSameBROKEN[FullForm["red"], 
  "\!\(\* StyleBox[\"red\",\nFontColor->RGBColor[1, 0, 0]]\)"]]
