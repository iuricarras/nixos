{config, pkgs, ...}: let
  bspasroot = pkgs.writeShellScriptBin "bspasroot" ''
    # rofi sudo askpass helper
    
    export SUDO_ASKPASS=${config.home.profileDirectory}/bin/rofi_askpass

    # execute the application
    sudo -A $1
  '';
in {
  home.packages = with pkgs; [
    bspasroot
  ];
}
