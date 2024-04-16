{ config, lib, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      user = "iuricarras";
      dataDir = "/home/iuricarras/.syncthing";
      configDir = "/home/iuricarras/.config/syncthing";
    };
    ratbagd.enable = true;
    flatpak.enable = true;
    printing.enable = true; 

  };
  virtualisation = {
    libvirtd.enable = true;
    vmware.host.enable = true;
    virtualbox.host.enable = true;
    docker.enable = true;
  };
  programs.virt-manager.enable = true;
}