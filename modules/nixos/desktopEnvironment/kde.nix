{ config, lib, pkgs, ... }:

{
  services.xserver = {
    desktopManager.plasma5.enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
  };
  
  programs.dconf.enable = true;
}