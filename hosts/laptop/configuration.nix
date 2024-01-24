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

  services.xserver.enable = true;
  nixpkgs.config.allowUnfree = true;
  
  services = {
    syncthing = {
      enable = true;
      user = "iuricarras";
      dataDir = "/home/iuricarras/.syncthing";
      configDir = "/home/iuricarras/.config/syncthing";
    };
    ratbagd.enable = true;
    flatpak.enable = true; 
    openvpn.servers = {
      serverVPN  = { config = '' config /root/nixos/openvpn/server.ovpn ''; autoStart = false; };
    }; 
  };
  


  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  services.xserver.xkb.layout = "pt";

  services.printing.enable = true;

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

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  
  environment.systemPackages = with pkgs; [
    (jetbrains.idea-ultimate.override { jdk = jdk21;})
    appimage-run
    blanket
    blender
    btop
    ciscoPacketTracer8
    cmake
    deluge-gtk
    discord
    firefox
    fuse
    gamemode
    gcc13
    gengetopt
    git 
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnumake
    goverlay  
    haruna
    heroic
    home-manager
    libsForQt5.kalk
    lshw
    lutris
    mangohud
    neofetch
    nextcloud-client
    openvpn
    piper
    pipx
    pkg-config
    prismlauncher-qt5
    protonup-qt
    python3
    python311Packages.pip
    python311Packages.vdf 
    spotify
    unzip
    r2modman     
    virtiofsd
    vscode
    wine
    wireshark
    wmctrl
    xarchiver
    xwaylandvideobridge
  ];

  programs.steam = {
    enable = true;
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };


  system.stateVersion = "23.11";
}

