{ config, lib, pkgs, ... }:

{
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming programs";
  };

  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = (with pkgs; [ 
      (prismlauncher.override { jdks = [ jdk8 jdk17 jdk21]; })
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
      steamcmd
      bottles
      cartridges
      rpcs3
      pcsx2
      nur.repos.iuricarras.truckersmp-cli
    ]);

    services.ratbagd.enable = true;
  };
}
