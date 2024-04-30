{ config, lib, pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        autoLogin = {
          enable = true;
          user = "yuriohnice"; 
        };
      };
      defaultSession = "plasma";
    };
  };
  
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.kdenlive
    kdePackages.kalk
    kdePackages.plasma-browser-integration
    haruna
  ];
}
