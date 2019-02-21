let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = hself: hsuper: rec {
          nexus = hself.callPackage ./hackage-mirror.nix {}; };};};};
  nixpkgs = import <nixpkgs> { inherit config; };
  inherit (nixpkgs) pkgs;
  drv = pkgs.haskellPackages.hackage-mirror;
in
  if pkgs.lib.inNixShell then drv.env else drv
