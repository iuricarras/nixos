{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./mainuser.nix
    ./services
    ./swap.nix
    ./audio.nix
    ./networking.nix
    ./plymouth.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;
}
