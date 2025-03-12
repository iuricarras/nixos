{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./syncthing.nix
    ./docker
  ];

  services = {
    flatpak.enable = true;
    printing.enable = true;
  };

  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
    waydroid.enable = true;
  };

  programs.virt-manager.enable = true;
}
