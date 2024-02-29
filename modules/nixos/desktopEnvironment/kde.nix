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
  environment.systemPackages = with pkgs; [
    libsForQt5.kdenlive
    libsForQt5.kalk
    haruna
  ];
}