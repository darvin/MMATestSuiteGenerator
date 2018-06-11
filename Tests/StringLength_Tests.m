(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Find the number of characters in a string:"], 
 TapTestSame[StringLength["tiger"], 5], 
 TapComment["Find lengths of all strings in a list:"], 
 TapTestSame[StringLength[{"cat", "dog", "fish", "coelenterate"}], 
  {3, 3, 4, 12}], TapComment["RefLink[StringLength,paclet:ref/StringLength] \
treats special characters just like ordinary ones:"], 
 TapTestSame[StringLength["\[FilledDiamond]\[Alpha]\[Beta]\[Gamma]\
\[LongLeftRightArrow]\[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]\
\[ReturnIndicator]"], 9], TapComment["Newlines count as one character:"], 
 TapTestSameBROKEN["ab\ncd", ab*cd], TapTestSameBROKEN[StringLength[%], 5], 
 TapComment["Find the growth rate of a string substitution system:"], 
 TapTestSame[NestList[StringReplace[#1, {"A" -> "AB", "B" -> "A"}] & , "A", 
   5], {A, AB, ABA, ABAAB, ABAABABA, ABAABABAABAAB}], 
 TapTestSameBROKEN[StringLength[%], {1, 2, 3, 5, 8, 13}], 
 TapComment["The empty string has zero length:"], 
 TapTestSame[StringLength[""], 0], 
 TapComment[
  "Formatting constructs are included in giving lengths of formatted \
strings:"], TapTestSameBROKEN[FullForm["red"], 
  "\!\(\* StyleBox[\"red\",\nFontColor->RGBColor[1, 0, 0]]\)"], 
 TapTestSameBROKEN[StringLength["red"], 50], TapComment["RefLink[StringLength\
,paclet:ref/StringLength] counts every character as length 1, regardless of \
the length of its full name:"], TapTestSameBROKEN[
  FullForm["\[Alpha]\[Beta]\[Gamma]"], "\[Alpha]\[Beta]\[Gamma]"], 
 TapTestSame[StringLength["\[Alpha]\[Beta]\[Gamma]"], 3]]
