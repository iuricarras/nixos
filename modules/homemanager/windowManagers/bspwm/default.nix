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
        ./bspwm.nix
        ./sxhkd.nix
        ./xsettingsd.nix
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

      bspwmWM.enable = true;
      bspwmWM.config = true;

      sxhkd.enable = true;
      sxhkd.config = true;

      xsettingsd.enable = true;
      xsettingsd.config = true;
    };
}
