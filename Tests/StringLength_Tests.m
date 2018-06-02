(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Find the number of characters in a string:"], 
 ESameTest[StringLength["tiger"], 5], 
 EComment["Find lengths of all strings in a list:"], 
 ESameTest[StringLength[{"cat", "dog", "fish", "coelenterate"}], 
  {3, 3, 4, 12}], EComment["RefLink[StringLength,paclet:ref/StringLength] \
treats special characters just like ordinary ones:"], 
 ESameTest[StringLength["\[FilledDiamond]\[Alpha]\[Beta]\[Gamma]\
\[LongLeftRightArrow]\[ScriptCapitalA]\[ScriptCapitalB]\[ScriptCapitalC]\
\[ReturnIndicator]"], 9], EComment["Newlines count as one character:"], 
 ESameTestBROKEN["ab\ncd", ab*cd], ESameTestBROKEN[StringLength[%], 5], 
 EComment["Find the growth rate of a string substitution system:"], 
 ESameTestBROKEN[NestList[StringReplace[#1, {"A" -> "AB", "B" -> "A"}] & , 
   "A", 5], {A, AB, ABA, ABAAB, ABAABABA, ABAABABAABAAB}], 
 ESameTestBROKEN[StringLength[%], {1, 2, 3, 5, 8, 13}], 
 EComment["The empty string has zero length:"], 
 ESameTest[StringLength[""], 0], 
 EComment[
  "Formatting constructs are included in giving lengths of formatted \
strings:"], ESameTestBROKEN[FullForm["red"], 
  "\!\(\* StyleBox[\"red\",\nFontColor->RGBColor[1, 0, 0]]\)"], 
 ESameTestBROKEN[StringLength["red"], 50], EComment["RefLink[StringLength,pac\
let:ref/StringLength] counts every character as length 1, regardless of the \
length of its full name:"], ESameTestBROKEN[
  FullForm["\[Alpha]\[Beta]\[Gamma]"], "\[Alpha]\[Beta]\[Gamma]"], 
 ESameTest[StringLength["\[Alpha]\[Beta]\[Gamma]"], 3]]
