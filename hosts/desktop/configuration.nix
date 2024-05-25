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
    shell = pkgs.zsh;
  };

  home-manager = {
    users = {
      "yuriohnice" = import ./home.nix;
    };
  };
  services.syncthing = {
      enable = true;
      user = "yuriohnice";
      dataDir = "/home/yuriohnice/.syncthing";
      configDir = "/home/yuriohnice/.config/syncthing";
    };

  system.stateVersion = "23.11";
}

