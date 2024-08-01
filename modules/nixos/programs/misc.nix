{ config, lib, pkgs, ... }:

{
  options = {
    misc.enable = lib.mkEnableOption "enables miscellaneous programs";
  };

 config = lib.mkIf config.misc.enable {
    environment.systemPackages = (with pkgs; [
      appimage-run
      blanket
      btop
      efibootmgr
      firefox
      fuse
      gparted
      home-manager
      lshw
      nextcloud-client
      ntfs3g
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
    ]);
  };
}
