{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [
    (jetbrains.idea-ultimate.override { jdk = jdk21;})
    (prismlauncher.override { jdks = [ jdk8 jdk17 ]; })
    appimage-run
    blanket
    blender
    btop
    ciscoPacketTracer8
    cmake
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
    protonup-qt
    python3
    python312Packages.pip
    python312Packages.vdf 
    r2modman     
    spotify
    spotify
    steam
    teams-for-linux
    unrar
    unzip
    vesktop
    virtiofsd
    vscode
    vulkan-tools
    wine
    winetricks
    wireshark
    wmctrl
    xarchiver
    xwaylandvideobridge
    steamPackages.steamcmd
    nh
    deluge
    bottles
    fastfetch
    remmina
    atuin
    kdePackages.kdenlive
  ])
  
  ++
  
  (with config.nur;[
    repos.iuricarras.truckersmp-cli
  ]);
}
