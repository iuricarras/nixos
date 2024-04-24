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
    device = "/dev/disk/by-label/HOME";
    fsType = "ext4";
  };  
  
  fileSystems."/home/yuriohnice/Games/HDD"={
    device = "/dev/disk/by-label/GAMES";
    fsType = "ext4";
  };
  fileSystems."/home/yuriohnice/Videos"={
	  device = "/dev/disk/by-label/VIDEOS";
	  fsType = "ext4";
	};

  networking.hostName = "nixos-tower";

  environment.sessionVariables = {
    FLAKE = "/home/yuriohnice/Github/nixos";
  };

  time.timeZone = "Europe/Lisbon";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  services.xserver.xkb.layout = "pt";

  users.users.yuriohnice = {
    isNormalUser = true; 
    description = "yuriohnice";
    extraGroups = [ "wheel" "libvirtd" "docker" ];
  };

  home-manager = {
    users = {
      "yuriohnice" = import ./home.nix;
    };
  };

  system.stateVersion = "23.11";
}

