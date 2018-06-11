(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Join strings:"], 
 TapTestSame[StringJoin["abcd", "ABCD", "xyz"], abcdABCDxyz], 
 TapComment[
  "Use RefLink[InputForm,paclet:ref/InputForm] to show string quotes:"], 
 TapTestSame[InputForm[%], "abcdABCDxyz"], 
 TapComment["All lists are ignored:"], 
 TapTestSame[StringJoin[{{"AB", "CD"}, "XY"}], ABCDXY], 
 TapComment[
  "RefLink[StringJoin,paclet:ref/StringJoin] works with special characters:"]\
, TapTestSameBROKEN[StringJoin["\[Alpha]\[Beta]\[Gamma]", 
   "\[CirclePlus]\[CircleTimes]", " \[ReturnIndicator]"], 
  \[Alpha]\[Beta]\[Gamma] \[CirclePlus] \[CircleTimes]\[ReturnIndicator]], 
 TapComment["Join strings, with a newline in between:"], 
 TapTestSameBROKEN[StringJoin["one", "\n", "two"], one*two], 
 TapComment["RefLink[StringJoin,paclet:ref/StringJoin] preserves formatting \
information embedded in strings:"], TapTestSame[StringJoin["red", "blue"], 
  redblue], TapComment["Iteratively join a string to its reverse:"], 
 TapTestSame[NestList[StringJoin[#1, StringReverse[#1]] & , "AB", 5], 
  {AB, ABBA, ABBAABBA, ABBAABBAABBAABBA, ABBAABBAABBAABBAABBAABBAABBAABBA, 
   ABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBAABBA}], 
 TapComment["Find trigrams in a string:"], 
 TapTestSame[data = Partition[Characters["aabcaabc"], 3, 1], 
  {{a, a, b}, {a, b, c}, {b, c, a}, {c, a, a}, {a, a, b}, {a, b, c}}], 
 TapTestSame[StringJoin /@ data, {aab, abc, bca, caa, aab, abc}], 
 TapComment["Join a list of words, after inserting spaces in between:"], 
 TapTestSameBROKEN[Riffle[{"dog", "cat", "sheep", "cow"}, " "], 
  {dog, Null, cat, Null, sheep, Null, cow}], TapTestSameBROKEN[StringJoin[%], 
  dog*cat*sheep*cow], TapComment["Create a Champernowne number:"], 
 TapTestSame[ToExpression[StringJoin["0.", ToString /@ Range[30]]], 
  0.12345678910111213141516171819202122232425262728293`50.091514977524966], 
 TapComment["RefLink[StringJoin,paclet:ref/StringJoin] acts as a kind of \
inverse to RefLink[Characters,paclet:ref/Characters]:"], 
 TapTestSame[Characters["abcdefg"], {a, b, c, d, e, f, g}], 
 TapTestSameBROKEN[StringJoin[%], abcdefg], TapComment["RefLink[StringJoin,pa\
clet:ref/StringJoin] works only with explicit strings:"], 
 TapTestSameBROKEN[StringJoin["item ", 456], StringJoin[item, 456]], 
 TapComment[
  "Use RefLink[ToString,paclet:ref/ToString] to convert to a string:"], 
 TapTestSameBROKEN[StringJoin["item ", ToString[456]], item*456]]
