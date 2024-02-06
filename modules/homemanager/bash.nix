{ config, lib, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      "nixos-flakes" = "sudo nixos-rebuild switch --flake /home/iuricarras/github/nixos#laptop";
    };
    initExtra = ''
      neofetch
    '';
  };
}