# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{ pkgs, ... }: {
  ott-sweirich = pkgs.callPackage ./ott-sweirich.nix {
    ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_12;
  };
}
