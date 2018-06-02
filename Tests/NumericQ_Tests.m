(* Created by Wolfram Mathematica 10.0 : www.wolfram.com *)
Import["CompatTests.m"]; 
TapSuite[TapComment["RefLink[NumericQ,paclet:ref/NumericQ] tests whether an \
object is a numeric quantity:"], TapTestSame[NumericQ[Sin[Sqrt[2]]], True], 
 TapComment["In most cases, RefLink[NumericQ,paclet:ref/NumericQ][expr] gives \
RefLink[True,paclet:ref/True] whenever RefLink[N,paclet:ref/N][expr] yields \
an explicit number: "], TapTestSameBROKEN[N[Sin[Sqrt[2]]], 0.987766], 
 TapTestSame[NumericQ[expr], False], 
 TapComment["Some parts of the expression are numeric:"], 
 TapTestSameBROKEN[TableForm[({#1, NumericQ[#1]} & ) /@ 
    Level[expr, {0, Infinity}], TableHeadings -> {{}, {"e", "NumericQ[e]"}}], 
  \[Null]*e*NumericQ[e]*\[Null]*2*True*\[Null]*x*False*\[Null]*3*True*\[Null]*
    E*True*\[Null]*4*True*\[Null]*E^4*True*\[Null]*3*E^4*True*\[Null]*
    Sin[3*E^4]*True*\[Null]*x + Sin[3*E^4]*False*\[Null]*
    BesselJ[2, x + Sin[3*E^4]]*False], TapTestSameBROKEN[
  NumericQ[f[Pi, Sin[1 + I]]], True], TapTestSameBROKEN[
  constants = Select[ssymb, MemberQ[Attributes[#1], Constant] & ], 
  {Catalan, ChampernowneNumber, Degree, E, EulerGamma, Glaisher, GoldenRatio, 
   Khinchin, MachinePrecision, Pi}], TapComment["The system symbols with the \
RefLink[NumericFunction,paclet:ref/NumericFunction] attribute:"], 
 TapTestSameBROKEN[nfuns = Select[ssymb, 
    MemberQ[Attributes[#1], NumericFunction] & ], 
  {Abs, AiryAi, AiryAiPrime, AiryAiZero, AiryBi, AiryBiPrime, AiryBiZero, 
   AngerJ, AppellF1, ArcCos, ArcCosh, ArcCot, ArcCoth, ArcCsc, ArcCsch, 
   ArcSec, ArcSech, ArcSin, ArcSinh, ArcTan, ArcTanh, Arg, 
   ArithmeticGeometricMean, BarnesG, BartlettHannWindow, BartlettWindow, 
   BernsteinBasis, BesselI, BesselJ, BesselJZero, BesselK, BesselY, 
   BesselYZero, Beta, BetaRegularized, Binomial, BlackmanHarrisWindow, 
   BlackmanNuttallWindow, BlackmanWindow, BohmanWindow, BSplineBasis, 
   CatalanNumber, CauchyWindow, Ceiling, ChampernowneNumber, ChebyshevT, 
   ChebyshevU, Clip, Conjugate, ConnesWindow, Cos, Cosh, CoshIntegral, 
   CosineWindow, CosIntegral, Cot, Coth, Csc, Csch, CubeRoot, DawsonF, 
   DedekindEta, DiracComb, DirichletWindow, DiscreteDelta, Divide, EllipticE, 
   EllipticExp, EllipticExpPrime, EllipticF, EllipticK, EllipticLog, 
   EllipticNomeQ, EllipticPi, EllipticTheta, EllipticThetaPrime, Erf, Erfc, 
   Erfi, ExactBlackmanWindow, Exp, ExpIntegralE, ExpIntegralEi, Factorial, 
   Factorial2, FactorialPower, Fibonacci, FlatTopWindow, Floor, 
   FractionalPart, FresnelC, FresnelS, Gamma, GammaRegularized, 
   GaussianWindow, GegenbauerC, Gudermannian, HammingWindow, HankelH1, 
   HankelH2, HannPoissonWindow, HannWindow, HarmonicNumber, Haversine, 
   HeavisideLambda, HeavisidePi, HermiteH, HurwitzLerchPhi, HurwitzZeta, 
   Hyperfactorial, Hypergeometric0F1, Hypergeometric0F1Regularized, 
   Hypergeometric1F1, Hypergeometric1F1Regularized, Hypergeometric2F1, 
   Hypergeometric2F1Regularized, HypergeometricPFQ, 
   HypergeometricPFQRegularized, HypergeometricU, Im, IntegerPart, 
   InverseBetaRegularized, InverseEllipticNomeQ, InverseErf, InverseErfc, 
   InverseGammaRegularized, InverseGudermannian, InverseHaversine, 
   InverseJacobiCD, InverseJacobiCN, InverseJacobiCS, InverseJacobiDC, 
   InverseJacobiDN, InverseJacobiDS, InverseJacobiNC, InverseJacobiND, 
   InverseJacobiNS, InverseJacobiSC, InverseJacobiSD, InverseJacobiSN, 
   InverseWeierstrassP, JacobiAmplitude, JacobiCD, JacobiCN, JacobiCS, 
   JacobiDC, JacobiDN, JacobiDS, JacobiNC, JacobiND, JacobiNS, JacobiP, 
   JacobiSC, JacobiSD, JacobiSN, JacobiZeta, KaiserBesselWindow, 
   KaiserWindow, KelvinBei, KelvinBer, KelvinKei, KelvinKer, KleinInvariantJ, 
   KroneckerDelta, LaguerreL, LanczosWindow, LegendreP, LegendreQ, LerchPhi, 
   Log, Log10, Log2, LogBarnesG, LogGamma, LogIntegral, LogisticSigmoid, 
   LucasL, MarcumQ, MathieuC, MathieuCharacteristicA, MathieuCharacteristicB, 
   MathieuCharacteristicExponent, MathieuCPrime, MathieuS, MathieuSPrime, 
   Max, MeijerG, Min, Minus, Mod, ModularLambda, Multinomial, NevilleThetaC, 
   NevilleThetaD, NevilleThetaN, NevilleThetaS, NuttallWindow, OwenT, 
   ParabolicCylinderD, ParzenWindow, Plus, Pochhammer, PoissonWindow, 
   PolyGamma, PolyLog, Power, PrimeZetaP, QBinomial, QFactorial, QGamma, 
   QHypergeometricPFQ, QPochhammer, QPolyGamma, Quotient, QuotientRemainder, 
   RamanujanTau, RamanujanTauL, RamanujanTauTheta, RamanujanTauZ, Re, 
   Rescale, RiemannR, RiemannSiegelTheta, RiemannSiegelZ, Round, Sec, Sech, 
   Sign, Sin, Sinc, Sinh, SinhIntegral, SinIntegral, SphericalBesselJ, 
   SphericalBesselY, SphericalHankelH1, SphericalHankelH2, 
   SphericalHarmonicY, SpheroidalEigenvalue, SpheroidalJoiningFactor, 
   SpheroidalPS, SpheroidalPSPrime, SpheroidalQS, SpheroidalQSPrime, 
   SpheroidalRadialFactor, SpheroidalS1, SpheroidalS1Prime, SpheroidalS2, 
   SpheroidalS2Prime, Sqrt, StruveH, StruveL, Subfactorial, Subtract, Surd, 
   Tan, Tanh, Times, TukeyWindow, UnitBox, UnitStep, UnitTriangle, WeberE, 
   WeierstrassP, WeierstrassPPrime, WeierstrassSigma, WeierstrassZeta, 
   WelchWindow, WhittakerM, WhittakerW, ZernikeR, Zeta, ZetaZero}], 
 TapComment[
  "Any combination of these functions with numeric arguments will be \
numeric:"], TapTestSameBROKEN[
  e = Quiet[Nest[RandomChoice[nfuns][RandomChoice[constants], #1] & , 1, 
     10]], Zeta[Pi, Csch[E, SinIntegral[MachinePrecision, 
     Round[GoldenRatio, Sec[Glaisher, SpheroidalJoiningFactor[Degree, 
        JacobiCS[GoldenRatio, Re[MachinePrecision, JacobiSD[Pi, 
           InverseErfc[Pi, 1]]]]]]]]]]], TapTestSameBROKEN[NumericQ[e], 
  True], TapComment["In most cases, RefLink[N,paclet:ref/N][e] will not be a \
number since it is improbable that the arguments are correct:"], 
 TapTestSameBROKEN[Quiet[N[e]], Indeterminate], 
 TapTestSameBROKEN[MatrixQ[m, NumericQ], True], TapTestSame[f[a], f[a]], 
 TapTestSameBROKEN[f[Sqrt[2]], -0.5 + 1.07899*I], 
 TapTestSameBROKEN[HoldComplete[Plot[{Re[f[a]], Im[f[a]]}, {a, -2, 2}]], 
  $Failed], TapTestSameBROKEN[f[Exp[1] + Exp[-1]], 3.08616], 
 TapTestSameBROKEN[f[Exp[x] + Exp[-x]], 2*Cosh[x]], 
 TapComment["RefLink[NumericQ,paclet:ref/NumericQ][e] does not always imply \
that RefLink[N,paclet:ref/N][e] will yield a number:"], 
 TapTestSame[e = 1/(Sin[1]^2 + Cos[1]^2 - 1), 1/(-1 + Cos[1]^2 + Sin[1]^2)], 
 TapTestSame[NumericQ[e], True], TapTestSameBROKEN[N[e], ComplexInfinity], 
 TapTestSame[NumberQ[%], False], TapComment["This can also happen when the \
arguments for the function are given incorrectly:"], 
 TapTestSame[e = Sin[1, 2], Sin[1, 2]], TapTestSame[NumericQ[e], True], 
 TapTestSame[NumberQ[N[e]], False]]
