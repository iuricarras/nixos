{ config, lib, pkgs, ... }:
{
  services = {
    ratbagd.enable = true;
    flatpak.enable = true;
    printing.enable = true; 

  };
  virtualisation = {
    libvirtd.enable = true;
    #virtualbox.host.enable = true;
    vmware.host.enable = true;
    docker.enable = true;
    waydroid.enable = true;
  };
  programs.virt-manager.enable = true;

}
