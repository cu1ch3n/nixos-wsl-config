{ pkgs, ... }:
{
  home.packages = with pkgs;
    with nur.repos.chen; [
      abella
      abella-modded
      sublime4
    ];
}
