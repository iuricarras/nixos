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
    openvpn.servers = {
      serverVPN  = { config = '' config /root/nixos/openvpn/server.ovpn ''; autoStart = false; };
    };
    printing.enable = true; 
  };
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}