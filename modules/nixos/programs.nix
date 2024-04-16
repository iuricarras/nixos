{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    (jetbrains.idea-ultimate.override { jdk = jdk21;})
    (prismlauncher-qt5.override { jdks = [ jdk8 jdk17 ]; })
    appimage-run
    blanket
    blender
    btop
    ciscoPacketTracer8
    cmake
    discord
    efibootmgr
    firefox
    fuse
    gamemode
    gamescope
    gcc13
    gengetopt
    git
    github-desktop
    gnumake
    goverlay
    gparted  
    heroic
    home-manager
    lshw
    lutris
    mangohud
    neofetch
    nextcloud-client
    ntfs3g
    obs-studio
    obs-studio-plugins.obs-vaapi
    openvpn
    os-prober
    pavucontrol
    piper
    pipx
    pkg-config
    plex-media-player
    plymouth
    protonup-qt
    python3
    python311Packages.pip
    python311Packages.vdf 
    r2modman     
    spotify
    spotify
    steam
    teams-for-linux
    unrar
    unzip
    virtiofsd
    vscode
    vulkan-tools
    wine
    winetricks
    wireshark
    wmctrl
    xarchiver
    xwaylandvideobridge
  ];
}
