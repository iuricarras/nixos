{ lib, config, pkgs, ... }:

let
  cfg = config.mainUser;
in
{
  options.mainUser = {
    enable
      = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "iuricarras";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "${cfg.userName}";
      extraGroups = [ "wheel" "libvirtd" "docker" ];
    };
  };
}
