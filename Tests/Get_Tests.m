(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["This has set up definitions for several symbols in the \
EquationTrekker` context:"], TapTestSameBROKEN[Names["EquationTrekker`*"], 
  {DifferentialEquationTrek, EquationTrekker, EquationTrekkerNonModal, 
   EquationTrekkerState, InitializeGenerator, PoincareSection, TrekData, 
   TrekGenerator, TrekParameters}], TapTestSameBROKEN[
  << "ExampleData/language", 22*a*b + 56*c + 13*a*d], 
 TapComment["The input is evaluated:"], TapTestSameBROKEN[
  Block[{a = 1, b = 2, c = 3, d = 4}, << "ExampleData/language"], 264]]
