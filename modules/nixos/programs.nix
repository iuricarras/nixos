{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    (jetbrains.idea-ultimate.override { jdk = jdk21;})
    appimage-run
    blanket
    blender
    btop
    ciscoPacketTracer8
    cmake
    deluge-gtk
    #discord
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
    steam
    teams-for-linux
    unrar
    plex-media-player
    ungoogled-chromium
    android-tools
  ];
}