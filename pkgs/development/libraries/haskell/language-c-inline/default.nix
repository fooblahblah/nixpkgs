# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, filepath, languageCQuote, mainlandPretty }:

cabal.mkDerivation (self: {
  pname = "language-c-inline";
  version = "0.7.7.0";
  sha256 = "10wj8dlsjimgln14y7b50pnnn865ln46v3xcqwr7ahjcl3icavg6";
  buildDepends = [ filepath languageCQuote mainlandPretty ];
  testDepends = [ languageCQuote ];
  meta = {
    homepage = "https://github.com/mchakravarty/language-c-inline/";
    description = "Inline C & Objective-C code in Haskell for language interoperability";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
