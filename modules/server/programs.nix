{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    lshw
  ];

  programs = {
    nix-ld.enable = true;
  };
}