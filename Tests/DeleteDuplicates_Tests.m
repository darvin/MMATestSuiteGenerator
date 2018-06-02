(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["Delete duplicated elements: "], 
 ESameTest[DeleteDuplicates[{1, 7, 8, 4, 3, 4, 1, 9, 9, 2}], 
  {1, 7, 8, 4, 3, 9, 2}], 
 EComment[
  "Delete elements whose values duplicate those earlier in the association:"]\
, ESameTestBROKEN[HoldComplete[DeleteDuplicates[\[LeftAssociation] a -> 1, 
     b -> 2, c -> 1, d -> 3, e -> 2 \[RightAssociation]]], $Failed], 
 EComment["Delete elements unless they are larger than ones that came \
before:"], ESameTest[DeleteDuplicates[{1, 7, 8, 4, 3, 4, 1, 9, 9, 2}, 
   Greater], {1, 7, 8, 9, 9}], ESameTestBROKEN[Union[list], 
  {0, 2, 3, 4, 5, 6, 7, 8, 9}], ESameTestBROKEN[DeleteDuplicates[list], 
  {9, 0, 3, 2, 6, 8, 4, 5, 7}], ESameTestBROKEN[Sort[%], 
  {0, 2, 3, 4, 5, 6, 7, 8, 9}], ESameTestBROKEN[
  {First[Timing[DeleteDuplicates[list]]], First[Timing[Union[list]]]}, 
  {0.031, 5.367}], ESameTestBROKEN[DeleteDuplicates[list, 
   Total[#1] == Total[#2] & ], {{0, 0, 0, 1, 0}, {1, 0, 1, 0, 1}, 
   {1, 1, 1, 0, 1}}], EComment["RefLink[DeleteDuplicatesBy,paclet:ref/DeleteD\
uplicatesBy] can be used to achieve the same result:"], 
 ESameTestBROKEN[DeleteDuplicatesBy[list, Total], 
  {{0, 0, 0, 1, 0}, {1, 0, 1, 0, 1}, {1, 1, 1, 0, 1}}]]
