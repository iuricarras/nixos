# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
    
  fileSystems."/home" =  {
    device = "/dev/disk/by-partlabel/HOME";
    fsType = "ext4";
  };
  
  fileSystems."/home/iuricarras/Games/HDD" = {
    device = "/dev/disk/by-partlabel/HDD";
    fsType = "ext4";
    options = [ "nofail" "x-systemd.device-timeout=5" ];
  };
  
  networking.hostName = "nixos-laptop";
  
  time.timeZone = "Europe/Lisbon";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };

  services.xserver.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  services.xserver.xkb.layout = "pt";

  users.users.iuricarras = {
     isNormalUser = true; 
     description = "Iuri Carrasqueiro";
     extraGroups = [ "wheel" "libvirtd" ];
   };

  home-manager = {
    users = {
      "iuricarras" = import ./home.nix;
    };
  };

  fonts.packages = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  system.stateVersion = "23.11";
}

