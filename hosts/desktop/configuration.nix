# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
	
  fileSystems."/home"= {
    device = "/dev/disk/by-uuid/1c72e33a-37bb-4516-a1e2-2a779623f110";
    fsType = "ext4";
  };  
  
  fileSystems."/home/iuricarras/Games/HDD"={
    device = "/dev/disk/by-uuid/a704692d-e0d7-43cc-b259-0c2b1bd754ac";
    fsType = "ext4";
  };
  fileSystems."/home/iuricarras/Videos"={
	  device = "/dev/disk/by-uuid/a15f1150-586a-40dd-923a-806c422398f2";
	  fsType = "ext4";
	};

  networking.hostName = "nixos-tower";

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

  system.stateVersion = "23.11";
}

