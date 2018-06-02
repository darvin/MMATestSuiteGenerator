(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["Delete duplicated elements: "], 
 TapTestSame[DeleteDuplicates[{1, 7, 8, 4, 3, 4, 1, 9, 9, 2}], 
  {1, 7, 8, 4, 3, 9, 2}], TapComment[
  "Delete elements whose values duplicate those earlier in the association:"]\
, TapTestSameBROKEN[HoldComplete[DeleteDuplicates[\[LeftAssociation] a -> 1, 
     b -> 2, c -> 1, d -> 3, e -> 2 \[RightAssociation]]], $Failed], 
 TapComment[
  "Delete elements unless they are larger than ones that came before:"], 
 TapTestSame[DeleteDuplicates[{1, 7, 8, 4, 3, 4, 1, 9, 9, 2}, Greater], 
  {1, 7, 8, 9, 9}], TapTestSameBROKEN[Union[list], 
  {0, 2, 3, 4, 5, 6, 7, 8, 9}], TapTestSameBROKEN[DeleteDuplicates[list], 
  {9, 0, 3, 2, 6, 8, 4, 5, 7}], TapTestSameBROKEN[Sort[%], 
  {0, 2, 3, 4, 5, 6, 7, 8, 9}], TapTestSameBROKEN[
  {First[Timing[DeleteDuplicates[list]]], First[Timing[Union[list]]]}, 
  {0.031, 5.367}], TapTestSameBROKEN[DeleteDuplicates[list, 
   Total[#1] == Total[#2] & ], {{0, 0, 0, 1, 0}, {1, 0, 1, 0, 1}, 
   {1, 1, 1, 0, 1}}], TapComment["RefLink[DeleteDuplicatesBy,paclet:ref/Delet\
eDuplicatesBy] can be used to achieve the same result:"], 
 TapTestSameBROKEN[DeleteDuplicatesBy[list, Total], 
  {{0, 0, 0, 1, 0}, {1, 0, 1, 0, 1}, {1, 1, 1, 0, 1}}]]
