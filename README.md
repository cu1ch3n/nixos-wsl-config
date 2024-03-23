# Chen's NixOS-WSL Configurations

## NixOS

```console
[nix-shell]$ sudo -E nixos-rebuild switch --flake .#wsl --impure
```

## Update

You may use
```console
$ nix flake update --commit-lock-file
```
to update `flake.lock`.
