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

  networking.enable = true;

  time.timeZone = "Europe/Lisbon";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };


  environment.sessionVariables = {
    FLAKE = "/home/iuricarras/Github/nixos";
    XDG_CACHE_HOME  = "/home/iuricarras/.cache";
    #XDG_CONFIG_HOME = "/home/yuriohnice/.config";
    XDG_DATA_HOME   = "/home/iuricarras/.local/share";
    XDG_STATE_HOME  = "/home/iuricarras/.local/state";
  };

  services.xserver.enable = true;

  graphics.nvidia.enable = true;

  audio.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  services.xserver.xkb.layout = "pt";
  
  desktopEnvironment.kde.enable = true;
  desktopEnvironment.kde.userName = "iuricarras";

  mainUser.enable = true;
  mainUser.userName = "iuricarras";

  syncthing.enable = true;
  syncthing.userName = "iuricarras";
  
  home-manager = {
    users = {
      "iuricarras" = import ./home.nix;
    };
  };
  
  services.openssh.enable = true;

  services.undervolt.enable = true;
  services.undervolt.coreOffset = -130;
  
  gaming.enable = true;
  college.enable = false;
  development.enable = true;
  imageAndVideo.enable = false;
  misc.enable = true;

  system.stateVersion = "23.11";
}

