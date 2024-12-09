{
  config,
  lib,
  pkgs,
  ...
}: {
  options.bspwmWM = {
    enable = lib.mkEnableOption "enables bspwm window manager";
    config = lib.mkEnableOption "enables nixos' managed config";
  };

    config = lib.mkIf config.bspwmWM.enable (lib.mkMerge [
      (lib.mkIf config.bspwmWM.enable {
        xsession.windowManager.bspwm.enable = true;
      })
      (lib.mkIf config.bspwmWM.config {
        xsession.windowManager.bspwm = {
          extraConfigEarly = ''
            export XDG_CURRENT_DESKTOP='bspwm'

            two_monitors_workspaces() {
              # change these values according to your system
              # you can use `xrandr -q` to get the names of monitors
              INTERNAL_MONITOR="DisplayPort-2"
              EXTERNAL_MONITOR="HDMI-A-0"
              if [[ $(xrandr -q | grep "''${EXTERNAL_MONITOR} connected") ]]; then
                bspc monitor "$INTERNAL_MONITOR" -d '' '' '' '' '' '' '' '' 
                bspc monitor "$EXTERNAL_MONITOR" -d '' ''
                xrandr --output "$EXTERNAL_MONITOR" --mode 1920x1080 --pos 0x0 --rotate normal --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --pos 1920x0 --rotate normal 
                bspc wm -O  "$INTERNAL_MONITOR" "$EXTERNAL_MONITOR"
              else
                bspc monitor "$INTERNAL_MONITOR" -d '' '' '' '' '' '' '' '' '' ''
              fi
            }

            two_monitors_workspaces

            bspc wm --adopt-orphans
          '';

          settings = {
            border_width = 2; 
            window_gap = 4;
            split_ratio = 0.50;

            focused_border_color = "#BD99FF";
            normal_border_color = "#323f4e";
            active_border_color = "#bd99ff";
            presel_feedback_color = "#a1efd3";

            borderless_monocle = true;
            gapless_monocle = true;
            paddingless_monocle = true;
            single_monocle = false;
            focus_follows_pointer = true;
            presel_feedback = true;
          };

          rules = {
            "Alacritty" = {
              desktop = "^1";
              follow = true;
              focus = true;
            };
            "firefox" = {
              desktop = "^2";
              follow = true;
              focus = true;
            };
            "Thunar" = {
              desktop = "^3";
              follow = true;
              focus = true;
            };
            "Geany" = {
              desktop = "^4";
              follow = true;
              focus = true;
            };
            "Code" = {
              desktop = "^4";
              follow = true;
              focus = true;
            };
            "Atril" = {
              desktop = "^5";
              follow = true;
              focus = true;
            };
            "steam" = {
              desktop = "^6";
              follow = true;
              focus = true;
            };
            "Lutris" = {
              desktop = "^6";
              follow = true;
              focus = true;
            };
            "PrismLauncher" = {
              desktop = "^6";
              follow = true;
              focus = true;
            };
            "GParted" = {
              desktop = "^7";
              follow = true;
              focus = true;
            };
            "Pavucontrol" = {
              desktop = "^7";
              follow = true;
              focus = true;
            };
            "Xfce4-power-manager-settings" = {
              desktop = "^7";
              follow = true;
              focus = true;
            };
            "vesktop" = {
              desktop = "^9";
              follow = true;
              focus = true;
            };
            "obs" = {
              desktop = "^10";
              follow = true;
              focus = true;
            };
            "Nm-connection-edito" = {
              state = "floating";
              follow = true;
              focus = true;
            };
            "alacritty-float" = {
              state = "floating";
              follow = true;
              focus = true;
            };
            "Yad" = {
              state = "floating";
              follow = true;
              focus = true;
            };
          };

          extraConfig = ''
            # xsettingsd --config=$HOME/.config/bspwm/xsettingsd &
            ${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 & 
            # sxhkd -c $HOME/.config/bspwm/sxhkdrc &

            ksuperkey -e 'Super_L=Alt_L|F1' &
            ksuperkey -e 'Super_R=Alt_L|F1' &

            xfce4-power-manager &

            xsetroot -cursor_name left_ptr

            ${pkgs.feh}/bin/feh --no-fehbg --bg-fill --randomize ~/Nextcloud/Pictures/wallpapers-slide/* &

            redshift-gtk -l 38:-9 &
            nextcloud &
            betterlockscreen -u $HOME/Nextcloud/Pictures/wallpapers-slide/egflISk.png &
          '';
        };
      })
    ]);
}