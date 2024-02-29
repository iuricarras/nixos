{ config, lib, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      "nixos-flakes-laptop" = "sudo nixos-rebuild switch --flake /home/iuricarras/Github/nixos#laptop";
      "nixos-flakes-desktop" = "sudo nixos-rebuild switch --flake /home/iuricarras/Github/nixos#desktop";
    };
  };
}