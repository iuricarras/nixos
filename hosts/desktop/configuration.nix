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
  
  boot.kernelPackages = pkgs.linuxPackages_zen;

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  }];

  boot.kernelModules = [ "tcp_bbr" ];
  boot.kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";
  boot.kernel.sysctl."net.core.default_qdisc" = "fq";

  boot.kernel.sysctl."net.core.wmem_max" = 1073741824; # 1 GiB
  boot.kernel.sysctl."net.core.rmem_max" = 1073741824; # 1 GiB
  boot.kernel.sysctl."net.ipv4.tcp_rmem" = "4096 87380 1073741824"; # 1 GiB max
  boot.kernel.sysctl."net.ipv4.tcp_wmem" = "4096 87380 1073741824"; # 1 GiB max

  boot.extraModulePackages = [
    # For being able to flip/mirror my webcam.
    config.boot.kernelPackages.v4l2loopback
  ];

  environment.sessionVariables = {
    FLAKE = "/home/yuriohnice/Github/nixos";
    XDG_CACHE_HOME  = "/home/yuriohnice/.cache";
    #XDG_CONFIG_HOME = "/home/yuriohnice/.config";
    XDG_DATA_HOME   = "/home/yuriohnice/.local/share";
    XDG_STATE_HOME  = "/home/yuriohnice/.local/state";
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

  mainUser.enable = true;
  mainUser.userName = "yuriohnice";

  syncthing.enable = true;
  syncthing.userName = "yuriohnice";

  home-manager = {
    users = {
      "yuriohnice" = import ./home.nix;
    };
  };


    security.pam.loginLimits = [
    { domain = "*"; item = "memlock"; type = "hard"; value = "unlimited"; }
    { domain = "*"; item = "memlock"; type = "soft"; value = "unlimited"; }
  ];

  gaming.enable = true;
  college.enable = false;

  system.stateVersion = "23.11";
}

