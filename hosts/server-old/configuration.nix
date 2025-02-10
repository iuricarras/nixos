# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
  };

  fileSystems."/home/meri/disks/ext" =  {
    device = "/dev/disk/by-label/Media";
    fsType = "ext4";
  };

  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "sunshine"; 
  networking.networkmanager.enable = true;  

  nixpkgs.config.allowUnfree = true;
  
  time.timeZone = "Europe/Lisbon";

  console = {
    keyMap = "pt-latin1";
  };

  virtualisation.docker.enable = true;

  users.users = {
    meri = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ]; 
    };
    plex = {
      extraGroups = [ "users" ];
    }
  };  

  home-manager = {
    users = {
      "meri" = import ./home.nix;
    };
  };

  system.stateVersion = "23.11";
}

