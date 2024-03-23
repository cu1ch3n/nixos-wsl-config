{ inputs
, outputs
, config
, pkgs
, lib
, ...
}: {
  imports = [
    ./nix.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.wsl
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      inputs.nur.overlay
    ];
    config = {
      allowUnfree = true;
    };
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users.nixos = import ../home-manager/home.nix;
  };

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  programs.zsh.enable = true;
  users.users.nixos.shell = pkgs.zsh;
  
  # services.vscode-server.enable = true;
  programs.nix-ld.enable = true;
  environment.variables = {
    NIX_LD_LIBRARY_PATH = lib.mkForce (with pkgs; lib.makeLibraryPath [ stdenv.cc.cc ]);
    NIX_LD = lib.mkForce (lib.removeSuffix "\n" (builtins.readFile "${pkgs.stdenv.cc}/nix-support/dynamic-linker"));
  };

  system.stateVersion = "23.11";
}
