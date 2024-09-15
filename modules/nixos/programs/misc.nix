{ config, lib, pkgs, ... }:

{
  options = {
    misc.enable = lib.mkEnableOption "enables miscellaneous programs";
  };

 config = lib.mkIf config.misc.enable {
    environment.systemPackages = (with pkgs; [
      appimage-run
      atuin
      blanket
      btop
      deluge
      efibootmgr
      fastfetch
      firefox
      fuse
      gparted
      home-manager
      lshw
      nextcloud-client
      nh
      ntfs3g
      openvpn
      os-prober
      pavucontrol
      pkg-config
      plex-media-player
      remmina
      spotify
      unrar
      unzip
      vesktop
      virtiofsd
      vscode
      vulkan-tools
      wmctrl
      xarchiver
      xwaylandvideobridge
      tldr
    ]);

    programs.appimage.binfmt = true;

  };
}
