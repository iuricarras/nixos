{ config, lib, pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.ideapad
    gnomeExtensions.tiling-assistant
    papirus-icon-theme
    yaru-theme
    ubuntu_font_family
  ];
}
    