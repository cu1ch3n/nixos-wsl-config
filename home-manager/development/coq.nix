{ pkgs, ... }: {
  home.packages = with pkgs;
    with nur.repos.chen;
    with coqPackages_8_15; [
      coq
      lngen
      metalib
      ott-sweirich
    ];

  home.sessionVariables = {
    COQPATH = "$HOME/.nix-profile/lib/coq/8.15/user-contrib";
  };
}
