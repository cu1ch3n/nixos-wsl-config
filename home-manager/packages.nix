{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnumake
    tree
    unzip
    wget
  ];
}
