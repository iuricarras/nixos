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
  
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.opengl = {
  	enable = true;
  	driSupport = true;
    driSupport32Bit = true;
  };
  
  hardware.nvidia = {
  	modesetting.enable = true;
  	powerManagement.enable = false;
  	powerManagement.finegrained = false;
  	open = false;
  	nvidiaSettings = true;
  	package = config.boot.kernelPackages.nvidiaPackages.stable;
  	prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
	  };
  }; 


  time.timeZone = "Europe/Lisbon";

  console = {
    keyMap = "pt-latin1";
  };

  users.users.meri = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };

  users.users.plex = {
    extraGroups = [ "users" ];
  };

  environment.systemPackages = with pkgs; [
    git
    lshw
  ];

  home-manager = {
    users = {
      "meri" = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "23.11";
}

