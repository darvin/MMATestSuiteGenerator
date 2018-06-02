(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["This gives all elements except 0:"], 
 ESameTest[Cases[{1, 0, 2, 0, 3}, Except[0]], {1, 2, 3}], 
 EComment["Delete all nonvowel characters from a string:"], 
 ESameTestBROKEN[StringReplace["the cat in the hat", 
   Except[Characters["aeiou"]] -> ""], eaiea], 
 EComment[
  "RefLink[Except,paclet:ref/Except] works with patterns and string \
patterns:"], ESameTest[Cases[{a, b, 0, 1, 2, x, y}, Except[_Integer]], 
  {a, b, x, y}], ESameTestBROKEN[StringReplace["1a2b3c4", 
   Except[DigitCharacter].. -> ""], 1234], 
 EComment["Constraints on patterns:"], 
 ESameTest[Cases[{a, b, 0, 1, 2, x, y}, Except[0, _Integer]], {1, 2}], 
 ESameTestBROKEN[StringReplace["1a2b3c4", Except["a", LetterCharacter].. -> 
    ""], 1*a234], EComment["Get all non-integers:"], 
 ESameTest[Cases[{1, 1, -5, EulerGamma, r, I, 0, Pi, 1/2}, Except[_Integer]], 
  {EulerGamma, r, I, Pi, 1/2}], 
 EComment["Find words containing nonword characters:"], 
 ESameTest[StringMatchQ[{"ain't", "test", "A&M", "anybody"}, 
   ___~~Except[WordCharacter]~~___], {True, False, True, False}], 
 EComment["Strip off all tags \"<...>\" from an HTML document:"], 
 ESameTestBROKEN[StringReplace["<title>The Title</title>\n<h1>The <a \
href='link'>head</a></h1>\n<p>Some text follows here...</p>", 
   "<"~~Except[">"]..~~">" -> ""], The*Title*The*head*Some*text*follows*
    here...]]
