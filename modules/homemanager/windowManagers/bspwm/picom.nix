{
  config,
  lib,
  pkgs,
  ...
}: {
  options.picom = {
    enable = lib.mkEnableOption "enables picom compositor";
    config = lib.mkEnableOption "enables nixos' managed config";
  };

  config = lib.mkIf config.picom.enable (lib.mkMerge [
    (lib.mkIf config.picom.enable {
      services.picom.enable = true;
    })
    (lib.mkIf config.picom.config {
      services.picom = {
        backend = "glx";
        vSync = true;

        shadow = true;
        shadowOffsets = [(-12) (-12)];
        shadowOpacity = 0.30;
        shadowExclude = [
          "class_g = 'Cairo-clock'"
          "class_g = 'CoverGloobus'"
          "class_g = 'Tilda'"
          "name ?= 'gnome-pie'"
          "class_g ?= 'Plank'"
          "name *= 'recordmydesktop'"
          "name = 'Notification'"
          "name = 'Docky'"
          "name = 'Kupfer'"
          "name = 'xfce4-notifyd'"
          "name *= 'VLC'"
          "name *= 'Chromium'"
          "name *= 'Chrome'"
          "class_g = 'Conky'"
          "class_g = 'Kupfer'"
          "class_g = 'Synapse'"
          "class_g ?= 'Notify-osd'"
          "class_g ?= 'Cairo-dock'"
          "class_g ?= 'Xfce4-notifyd'"
          "class_g ?= 'Xfce4-power-manager'"
          "_GTK_FRAME_EXTENTS@:c"
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        ];

        fade = true;
        fadeDelta = 5;
        fadeSteps = [0.03 0.03];
        fadeExclude = ["class_g = 'slop'"];

        inactiveOpacity = 1.0;
        activeOpacity = 1.0;

        opacityRules = [
          "100:class_g    = 'Bar'"
          "100:class_g    = 'slop'"
          "100:class_g    = 'XTerm'"
          "100:class_g    = 'URxvt'"
          "100:class_g    = 'kitty'"
          "100:class_g    = 'Alacritty'"
          "100:class_g    = 'Polybar'"
          "100:class_g    = 'code-oss'"
          "100:class_g    = 'Meld'"
          "100:class_g    = 'TelegramDesktop'"
          "100:class_g    = 'Joplin'"
          "100:class_g    = 'firefox'"
          "100:class_g    = 'Thunderbird'"
        ];

        wintypes = {
          tooltip = {
            fade = true;
            shadow = true;
            opacity = 0.95;
            focus = true;
            full-shadow = false;
          };
          popup_menu = {opacity = 1.0;};
          dropdown_menu = {opacity = 1.0;};
          utility = {
            shadow = false;
            opacity = 1.0;
          };
          dock = {
            shadow = true;
            clip-shadow-above = true;
          };
          dnd = {shadow = true;};
        };

        settings = {
          corner-radius = 0;

          rounded-corners-exclude = [
            "window_type = 'desktop'"
            "class_g ?= 'rofi'"
            "class_g ?= 'polybar'"
            "class_g ?= 'tint2'"
          ];

          shadow-radius = 14;

          no-fading-openclose = false;
          no-fading-destroyed-argb = true;

          frame-opacity = 1.0;
          inactive-opacity-override = false;

          focus-exclude = [
            "class_g = 'Cairo-clock'"
            "class_g = 'Bar'"
            "class_g = 'slop'"
          ];

          blur-kern = "3x3box";
          blur-background-exclude = [
            "window_type = 'desktop'"
            "class_g = 'Plank'"
            "class_g = 'slop'"
            "_GTK_FRAME_EXTENTS@:c"
          ];

          mark-wmwin-focused = true;
          mark-ovredir-focused = true;
          detect-rounded-corners = true;
          detect-client-opacity = true;
          detect-transient = true;
          glx-no-stencil = true;
          use-damage = true;
          log-level = "warn";
        };
      };
    })
  ]);
}
