(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
ESimpleExamples[EComment["This has set up definitions for several symbols in \
the EquationTrekker` context:"], ESameTestBROKEN[Names["EquationTrekker`*"], 
  {DifferentialEquationTrek, EquationTrekker, EquationTrekkerNonModal, 
   EquationTrekkerState, InitializeGenerator, PoincareSection, TrekData, 
   TrekGenerator, TrekParameters}], ESameTestBROKEN[
  << "ExampleData/language", 22*a*b + 56*c + 13*a*d], 
 EComment["The input is evaluated:"], ESameTestBROKEN[
  Block[{a = 1, b = 2, c = 3, d = 4}, << "ExampleData/language"], 264]]
