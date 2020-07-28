{ pkgs ? import <nixpkgs> {}
}:

let
  inherit (pkgs) lib;
  inherit (pkgs) stdenv;

in

stdenv.mkDerivation rec {
  pname = "cleanup-gke-remnants";
  version = "0.1.0";

  src = ./src;

  nativeBuildInputs = with pkgs; [
    makeWrapper
  ];

  buildInputs = with pkgs; [
    coreutils
    gnugrep
    google-cloud-sdk
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp cleanup-gke-remnants $out/bin
    wrapProgram $out/bin/cleanup-gke-remnants \
      --set VERSION '${version}' \
      --prefix PATH : $coreutils/bin \
      --prefix PATH : $gnugrep/bin \
      --prefix PATH : $google-cloud-sdk/bin \
      --argv0 cleanup-gke-remnants
  '';

  meta = with lib; {
    description = "Utility to cleanup GKE remnants";
    license = licenses.mit;
    maintainers = with maintainers; [ kayhide ];
  };
}
