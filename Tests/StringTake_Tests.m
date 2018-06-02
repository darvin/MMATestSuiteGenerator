(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Take the first 6 characters in a string:"], 
 ESameTestBROKEN[StringTake["abcdefghijklm", 6], abcdef], 
 EComment["Use RefLink[InputForm,paclet:ref/InputForm] to show quotes:"], 
 ESameTestBROKEN[InputForm[%], "abcdef"], 
 EComment["Take from the end of the string:"], 
 ESameTestBROKEN[StringTake["abcdefghijklm", -4], jklm], 
 EComment["Take characters 5 through 10:"], 
 ESameTestBROKEN[StringTake["abcdefghijklm", {5, 10}], efghij], 
 EComment["Find character 6 in a string:"], 
 ESameTestBROKEN[StringTake["abcdefghijklm", {6}], f], 
 ESameTestBROKEN[InputForm[%], "f"], EComment["Take every other character:"], 
 ESameTestBROKEN[StringTake["abcdefghijklm", {1, -1, 2}], acegikm], 
 EComment["Take the last 2 characters from several strings:"], 
 ESameTestBROKEN[StringTake[{"abcdef", "stuv", "xyzw"}, -2], {ef, uv, zw}], 
 EComment[
  "RefLink[StringTake,paclet:ref/StringTake] works with special characters:"]\
, ESameTestBROKEN[StringTake["\[FilledDiamond]\[Alpha]\[Beta]\[Gamma]\
\[LongLeftRightArrow]\[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]\
\[ReturnIndicator]", -4], 
  \[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]\[ReturnIndicator]], 
 EComment["Newline (\\n) counts as a single character:"], 
 ESameTestBROKEN[StringTake["abc\ndef", 5], abc*d], 
 EComment["RefLink[StringTake,paclet:ref/StringTake] can effectively do \
\"part\" extraction in strings:"], ESameTestBROKEN[
  Characters["abcdefghijklm"][[6]], f], 
 ESameTestBROKEN[StringTake["abcdefghijklm", {6}], f], 
 EComment["RefLink[StringTake,paclet:ref/StringTake] works like applying \
RefLink[Take,paclet:ref/Take] to the list of characters:"], 
 ESameTestBROKEN[Take[Characters["abcdefghijklm"], {5, -4}], 
  {e, f, g, h, i, j}], ESameTestBROKEN[StringTake["abcdefghijklm", {5, -4}], 
  efghij], EComment[
  "Taking between positions 1 and 0 gives a zero-length string:"], 
 ESameTestBROKEN[StringTake["abcdef", {1, 0}], Null], 
 ESameTestBROKEN[FullForm[%], ""], EComment["RefLink[StringTake,paclet:ref/St\
ringTake] operates on the raw characters in a string:"], 
 ESameTestBROKEN[HoldComplete[StringTake["red", -20]], $Failed], 
 ESameTestBROKEN[FullForm["red"], 
  "\!\(\* StyleBox[\"red\",\nFontColor->RGBColor[1, 0, 0]]\)"]]
