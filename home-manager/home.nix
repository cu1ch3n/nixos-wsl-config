{ inputs
, outputs
, config
, ...
}: {
  imports = [
    ./development
    ./programs
    ./packages.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      inputs.nur.overlay
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;

      permittedInsecurePackages = [
        "openssl-1.1.1w"
      ];
    };
  };

  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
    sessionPath = [ "$HOME/bin" ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
