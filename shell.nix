{ pkgs ? import <nixpkgs> {}
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    coreutils
    gnugrep
    google-cloud-sdk
  ];
}
