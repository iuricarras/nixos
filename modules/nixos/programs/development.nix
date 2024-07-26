{ config, lib, pkgs, ... }:
{
  options = {
    development.enable = lib.mkEnableOption "enables development programs";
  };

  config = lib.mkIf config.development.enable {
    environment.systemPackages = (with pkgs; [
      cmake
      gcc13
      gengetopt
      git
      gnumake
      pipx
      python3
      python312Packages.pip
      python312Packages.vdf
      vim
    ]);


  };
}
