{ config, lib, pkgs, ... }:

let
  cfg = config.desktopEnvironment.kde;
in
{
  options.desktopEnvironment.kde = {
    enable
      = lib.mkEnableOption "enable kde desktop environment module";

    userName = lib.mkOption {
      default = "iuricarras";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager = {
        sddm = {
          enable = true;
          #autoLogin = {
          #  enable = true;
          #  user = "${cfg.userName}";
          #};
        };
        defaultSession = "plasma";
      };
    };

    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [
      kdePackages.kalk
      kdePackages.plasma-browser-integration
      haruna
    ];
  };
}

