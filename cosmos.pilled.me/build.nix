{ lib, stdenv, nodejs, yarn }:
let
  fs = lib.fileset;
  sourceFiles = ./.;
  version = "0.0.1";

in fs.trace sourceFiles

stdenv.mkDerivation {
  name = "web-${version}";
  src = fs.toSource {
    root = ./.;
    fileset = sourceFiles;
  };
  packageJson = "${sourceFiles}/package.json";
  yarnLock = "${sourceFiles}/yarn.lock";

  buildPhase = ''
    
  '';

  installPhase = ''
    runHook preInstall
      yarn --offline --frozen-lockfile build

      mkdir $out
      pwd
      ls -la
      mv build/* $out
      runHook postInstall
  '';
  distPhase = "true";

  buildInputs = [ nodejs yarn ];
}
