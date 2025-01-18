{ pkgs ? import <nixpkgs> {} }:

let
  nodejs = pkgs.nodejs-18_x;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    gotools
    gopls
    go-outline
    gopls
    gopkgs
    gocode-gomod
    godef
    golint
    nodejs
    nodePackages.npm
  ];

  shellHook = ''
    export PROJECT_ROOT=$(pwd)
    export NPM_CONFIG_PREFIX=$PROJECT_ROOT/.npm-global
    export PATH=$PROJECT_ROOT/.npm-global/bin:$PATH
    mkdir -p $NPM_CONFIG_PREFIX
    npm config set prefix $NPM_CONFIG_PREFIX
  '';
}
