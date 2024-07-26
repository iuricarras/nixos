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


  environment.sessionVariables = {
    FLAKE = "/home/iuricarras/Github/nixos";
  };

  services.xserver.enable = true;
  
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
  #services.udev.extraRules = ''
  #  ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  #'';

  services.undervolt.enable = true;
  services.undervolt.coreOffset = -130;
  
  gaming.enable = true;
  college.enable = false;
  development.enable = true;

  
  system.stateVersion = "23.11";
}

