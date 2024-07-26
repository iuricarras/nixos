{ config, lib, pkgs, ... }:

{
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming programs";
  };

  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = (with pkgs; [ 
      (prismlauncher.override { jdks = [ jdk8 jdk17 ]; })
      gamemode
      gamescope
      goverlay
      heroic
      lutris
      mangohud
      piper
      protonup-qt
      r2modman
      steam
      wine
      winetricks 
      steamPackages.steamcmd
      bottles
      cartridges
      rpcs3
    ])
  
    ++
    
    (with config.nur;[
      repos.iuricarras.truckersmp-cli
    ]);

    services.ratbagd.enable = true;
  };
}
