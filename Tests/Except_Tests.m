(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["This gives all elements except 0:"], 
 TapTestSame[Cases[{1, 0, 2, 0, 3}, Except[0]], {1, 2, 3}], 
 TapComment["Delete all nonvowel characters from a string:"], 
 TapTestSameBROKEN[StringReplace["the cat in the hat", 
   Except[Characters["aeiou"]] -> ""], eaiea], 
 TapComment[
  "RefLink[Except,paclet:ref/Except] works with patterns and string \
patterns:"], TapTestSame[Cases[{a, b, 0, 1, 2, x, y}, Except[_Integer]], 
  {a, b, x, y}], TapTestSameBROKEN[StringReplace["1a2b3c4", 
   Except[DigitCharacter].. -> ""], 1234], 
 TapComment["Constraints on patterns:"], 
 TapTestSame[Cases[{a, b, 0, 1, 2, x, y}, Except[0, _Integer]], {1, 2}], 
 TapTestSameBROKEN[StringReplace["1a2b3c4", Except["a", LetterCharacter].. -> 
    ""], 1*a234], TapComment["Get all non-integers:"], 
 TapTestSame[Cases[{1, 1, -5, EulerGamma, r, I, 0, Pi, 1/2}, 
   Except[_Integer]], {EulerGamma, r, I, Pi, 1/2}], 
 TapComment["Find words containing nonword characters:"], 
 TapTestSame[StringMatchQ[{"ain't", "test", "A&M", "anybody"}, 
   ___~~Except[WordCharacter]~~___], {True, False, True, False}], 
 TapComment["Strip off all tags \"<...>\" from an HTML document:"], 
 TapTestSameBROKEN[StringReplace["<title>The Title</title>\n<h1>The <a \
href='link'>head</a></h1>\n<p>Some text follows here...</p>", 
   "<"~~Except[">"]..~~">" -> ""], The*Title*The*head*Some*text*follows*
    here...]]
