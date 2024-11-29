{ config, lib, pkgs, ... }:

{
    imports = 
    [
        ./alacritty.nix
        ./dunst.nix
        ./picom.nix
        ./polybar.nix
        ./scripts
        ./rofiThemes
    ];

    options = {
      bspwm.enable = lib.mkEnableOption "enables bspwm window manager";
    };

    config = lib.mkIf config.bspwm.enable{
      alacritty.enable = true;
      alacritty.config = true;

      dunst.enable = true;
      dunst.config = true;

      picom.enable = true;
      picom.config = true;

      polybar.enable = true;
      polybar.config = true;

    };
}
