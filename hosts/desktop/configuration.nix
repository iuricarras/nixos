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
  
  fileSystems."/home/iuricarras/Games/HDD"={
    device = "/dev/disk/by-label/GAMES";
    fsType = "ext4";
  };
  fileSystems."/home/iuricarras/Videos"={
	  device = "/dev/disk/by-label/VIDEOS";
	  fsType = "ext4";
	};

  networking.hostName = "nixos-tower";

  networking.enable = true;
  
  #boot.kernelPackages = pkgs.linuxPackages_zen;

  swap.enable = true;

  boot.extraModulePackages = [
    # For being able to flip/mirror my webcam.
    config.boot.kernelPackages.v4l2loopback
  ];

  environment.sessionVariables = {
    FLAKE = "/home/iuricarras/Github/nixos";
    XDG_CACHE_HOME  = "/home/iuricarras/.cache";
    #XDG_CONFIG_HOME = "/home/iuricarras/.config";
    XDG_DATA_HOME   = "/home/iuricarras/.local/share";
    XDG_STATE_HOME  = "/home/iuricarras/.local/state";
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

  graphics.amd.enable = true;

  audio.enable = true;

  desktopEnvironment.bspwm.enable = true;

  mainUser.enable = true;
  mainUser.userName = "iuricarras";

  syncthing.enable = true;
  syncthing.userName = "iuricarras";

  home-manager = {
    users = {
      "iuricarras" = import ./home.nix;
    };
  };


  security.pam.loginLimits = [
    { domain = "*"; item = "memlock"; type = "hard"; value = "unlimited"; }
    { domain = "*"; item = "memlock"; type = "soft"; value = "unlimited"; }
  ];

  gaming.enable = true;
  college.enable = true;
  development.enable = true;
  imageAndVideo.enable = false;
  misc.enable = true;

  system.stateVersion = "24.05";
}

