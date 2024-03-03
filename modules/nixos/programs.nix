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
    discord
    firefox
    fuse
    gamemode
    gamescope
    gcc13
    gengetopt
    git
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
    openvpn
    piper
    pipx
    pkg-config
    (prismlauncher-qt5.override { jdks = [ jdk8 jdk17 ]; })
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
    plymouth
    obs-studio
    winetricks
    obs-studio-plugins.obs-vaapi
    spotify
    pavucontrol
    github-desktop
    vulkan-tools
    efibootmgr
    os-prober
  ];
}
