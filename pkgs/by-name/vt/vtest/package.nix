{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  zlib,
  pcre2,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "vtest2";
  version = "4cffb5a3c49e270305c20fc9824a213193ef26af";

  buildInputs = [
    python3
    zlib
    pcre2
  ];

  src = fetchFromGitHub {
    owner = "vtest";
    repo = "VTest2";
    rev = "4cffb5a3c49e270305c20fc9824a213193ef26af";
    hash = "sha256-DpRbOXDy16gbhosHDOrAuaTR9IvEFLfbSakXZ+f5zLQ=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm755 -t $out/bin vtest
    runHook postInstall
  '';

  meta = {
    description = "The HTTP test-program formerly known as Varnishtest (reiterated)";
    longDescription = ''
      This project is the (almost) unvarnished varnishtest program, made available as a stand-alone
      program because it can be used to test all sorts of HTTP clients, servers and proxies.
    '';
    homepage = "https://github.com/vtest/VTest2";
    license = lib.licenses.bsd2;
    mainProgram = "vtest";
    platforms = lib.platforms.all;
  };
})
