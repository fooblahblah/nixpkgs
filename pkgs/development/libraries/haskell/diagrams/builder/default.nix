# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, blazeSvg, cmdargs, diagramsCairo, diagramsLib
, diagramsPostscript, diagramsSvg, exceptions, filepath, hashable
, haskellSrcExts, hint, lens, mtl, split, transformers
}:

cabal.mkDerivation (self: {
  pname = "diagrams-builder";
  version = "0.6.0.2";
  sha256 = "18avlhwywhrxlf1cyp9fdiy0i3gy12k4i28cymllmmyx78fv59q5";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    blazeSvg cmdargs diagramsCairo diagramsLib diagramsPostscript
    diagramsSvg exceptions filepath hashable haskellSrcExts hint lens
    mtl split transformers
  ];
  configureFlags = "-fcairo -fsvg -fps -frasterific";
  meta = {
    homepage = "http://projects.haskell.org/diagrams";
    description = "hint-based build service for the diagrams graphics EDSL";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
