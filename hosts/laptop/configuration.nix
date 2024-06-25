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

  users.users.iuricarras = {
    isNormalUser = true; 
    description = "Iuri Carrasqueiro";
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "docker" ];
    shell = pkgs.zsh;
   };

  home-manager = {
    users = {
      "iuricarras" = import ./home.nix;
    };
  };

  #fonts.packages = with pkgs; [
  #  font-awesome
  #  nerdfonts
  #];
  services.openssh.enable = true;
  #services.udev.extraRules = ''
  #  ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  #'';

  #services.undervolt.enable = true;
  #services.undervolt.coreOffset = -130;

  services.auto-cpufreq.enable = true;
    # optionally, you can configure your auto-cpufreq settings, if you have any
  services.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      turbo = "auto";
    };

    battery = {
      governor = "powersave";
      turbo = "auto";
    };
  };
  
  services.syncthing = {
      enable = true;
      user = "iuricarras";
      dataDir = "/home/iuricarras/.syncthing";
      configDir = "/home/iuricarras/.config/syncthing";
    };

  
  system.stateVersion = "23.11";
}

