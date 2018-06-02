(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Join strings:"], 
 ESameTestBROKEN[StringJoin["abcd", "ABCD", "xyz"], abcdABCDxyz], 
 EComment["Use RefLink[InputForm,paclet:ref/InputForm] to show string \
quotes:"], ESameTestBROKEN[InputForm[%], "abcdABCDxyz"], 
 EComment["All lists are ignored:"], ESameTestBROKEN[
  StringJoin[{{"AB", "CD"}, "XY"}], ABCDXY], 
 EComment[
  "RefLink[StringJoin,paclet:ref/StringJoin] works with special characters:"]\
, ESameTestBROKEN[StringJoin["\[Alpha]\[Beta]\[Gamma]", 
   "\[CirclePlus]\[CircleTimes]", " \[ReturnIndicator]"], 
  \[Alpha]\[Beta]\[Gamma] \[CirclePlus] \[CircleTimes]\[ReturnIndicator]], 
 EComment["Join strings, with a newline in between:"], 
 ESameTestBROKEN[StringJoin["one", "\n", "two"], one*two], 
 EComment["RefLink[StringJoin,paclet:ref/StringJoin] preserves formatting \
information embedded in strings:"], ESameTestBROKEN[
  StringJoin["red", "blue"], redblue], 
 EComment["Iteratively join a string to its reverse:"], 
 ESameTestBROKEN[NestList[StringJoin[#1, StringReverse[#1]] & , "AB", 5], 
  {AB, ABBA, ABBAABBA, ABBAABBAABBAABBA, ABBAABBAABBAABBAABBAABBAABBAABBA, 
   ABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBA}], 
 EComment["Find trigrams in a string:"], 
 ESameTestBROKEN[data = Partition[Characters["aabcaabc"], 3, 1], 
  {{a, a, b}, {a, b, c}, {b, c, a}, {c, a, a}, {a, a, b}, {a, b, c}}], 
 ESameTestBROKEN[StringJoin /@ data, {aab, abc, bca, caa, aab, abc}], 
 EComment["Join a list of words, after inserting spaces in between:"], 
 ESameTestBROKEN[Riffle[{"dog", "cat", "sheep", "cow"}, " "], 
  {dog, Null, cat, Null, sheep, Null, cow}], ESameTestBROKEN[StringJoin[%], 
  dog*cat*sheep*cow], EComment["Create a Champernowne number:"], 
 ESameTest[ToExpression[StringJoin["0.", ToString /@ Range[30]]], 
  0.12345678910111213141516171819202122232425262728293`50.091514977524966], 
 EComment["RefLink[StringJoin,paclet:ref/StringJoin] acts as a kind of \
inverse to RefLink[Characters,paclet:ref/Characters]:"], 
 ESameTestBROKEN[Characters["abcdefg"], {a, b, c, d, e, f, g}], 
 ESameTestBROKEN[StringJoin[%], abcdefg], EComment["RefLink[StringJoin,paclet\
:ref/StringJoin] works only with explicit strings:"], 
 ESameTestBROKEN[StringJoin["item ", 456], StringJoin[item, 456]], 
 EComment[
  "Use RefLink[ToString,paclet:ref/ToString] to convert to a string:"], 
 ESameTestBROKEN[StringJoin["item ", ToString[456]], item*456]]
