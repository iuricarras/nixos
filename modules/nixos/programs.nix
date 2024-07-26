{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [
    appimage-run
    blanket
    blender
    btop
    efibootmgr
    firefox
    fuse
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
    pkg-config
    plex-media-player
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
    atuin
    kdePackages.kdenlive
  ]);
}
