{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [
    appimage-run
    blanket
    blender
    btop
    cmake
    efibootmgr
    firefox
    fuse
    gcc13
    gengetopt
    git
    gnumake
    gparted  
    home-manager
    lshw
    neofetch
    nextcloud-client
    ntfs3g
    obs-studio
    obs-studio-plugins.obs-vaapi
    openvpn
    os-prober
    pavucontrol
    pipx
    pkg-config
    plex-media-player
    python3
    python312Packages.pip
    python312Packages.vdf      
    spotify
    unrar
    unzip
    vesktop
    virtiofsd
    vulkan-tools
    wmctrl
    xarchiver
    xwaylandvideobridge
    nh
    deluge
    fastfetch
    remmina
    vim
    ])
  
  ++
  
  (with config.nur;[
    repos.iuricarras.truckersmp-cli
  ]);
}
