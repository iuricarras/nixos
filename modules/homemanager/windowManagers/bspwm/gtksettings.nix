{
  config,
  lib,
  pkgs,
  ...
}: let
  wave = import ./themes/wave.nix {inherit pkgs;};
  icons = import ./icons/icons.nix {inherit pkgs;};
  vimix = import ./icons/vimix.nix {inherit pkgs;};
  fonts = import ./fonts/fonts.nix {inherit pkgs;};
in {

  imports = [
    ./icons/fixicons.nix
  ];

  options.gtksettings = {
    enable = lib.mkEnableOption "enables gtk settings";
    config = lib.mkEnableOption "enables nixos' managed config";
  };

  config = lib.mkIf config.gtksettings.enable {
    home.packages = with pkgs; [
      papirus-icon-theme
      wave
      icons
      vimix
      fonts
    ];

    gtk = {
      enable = true;
      theme.name = "Wave";
      iconTheme.name = "Luv-Folders-Dark";
      cursorTheme.name = "Vimix";
      font.name = "Noto Sans";
      font.size = 9;
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-enable-animations = true;
        gtk-cursor-theme-size = 0;
        gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images = 0;
        gtk-menu-images = 1;
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
      };
    };
  };
}
