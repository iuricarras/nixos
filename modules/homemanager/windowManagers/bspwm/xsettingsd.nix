{
  config,
  lib,
  pkgs,
  ...
}: {
  options.xsettingsd = {
    enable = lib.mkEnableOption "enables xsettingsd settings daemon";
    config = lib.mkEnableOption "enables nixos' managed config";
  };

  config = lib.mkIf config.xsettingsd.enable {
    services.xsettingsd.enable = true;

    services.xsettingsd.settings = lib.mkIf config.xsettingsd.config {
      "Net/ThemeName" = "Wave";
      "Net/IconThemeName" = "Luv-Folders-Dark";
      "Gtk/CursorThemeName" = "Vimix";
      "Gtk/FontName" = "Noto Sans 9";
      "Net/EnableEventSounds" = "0";
      "Net/EnableInputFeedbackSounds" = "0";
      "Xft/DPI" = "-1";
      "Xft/Hinting" = "1";
      "Xft/HintStyle" = "hintslight";
      "Xft/Antialias" = "1";
      "Xft/RGBA" = "none";
    };
  };
}
