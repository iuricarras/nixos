{
  config,
  lib,
  pkgs,
  ...
}: {
  options.polybar = {
    enable = lib.mkEnableOption "enables polybar status bar";
    config = lib.mkEnableOption "enables nixos' managed config";
  };

  config = lib.mkIf config.polybar.enable {
    xsession.enable = true;
    services.polybar.enable = true;
    services.polybar.package = pkgs.polybarFull;

    systemd.user.services.polybar = {
      Service.Environment = lib.mkForce ""; # to override the package's default configuration
      Service.PassEnvironment = "PATH"; # so that the entire PATH is passed to this service (alternatively, you can import the entire PATH to systemd at startup, which I'm not sure is recommended
    };

    services.polybar.script = ''
      polybar main &
      polybar secondary &
    '';

    services.polybar.settings = lib.mkIf config.polybar.config {
      "system" = {
        sys_adapter = "ACAD";
        sys_battery = "BAT0";
        sys_graphics_card = "intel_backlight";
        sys_network_interface = "enp42s0";
      };

      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      "color" = {
        BACKGROUND = "#3D4C5F";
        FOREGROUND = "#F8F8F8";
        ALTBACKGROUND = "#556984";
        ALTFOREGROUND = "#acacac";
        ACCENT = "#BD99FF";
        BLACK = "#3d4c5f";
        RED = "#f48fb1";
        GREEN = "#a1efd3";
        YELLOW = "#f1fa8c";
        BLUE = "#92b6f4";
        MAGENTA = "#bd99ff";
        CYAN = "#87dfeb";
        WHITE = "#f8f8f2";
        ALTBLACK = "#56687e";
        ALTRED = "#ee4f84";
        ALTGREEN = "#53e2ae";
        ALTYELLOW = "#f1ff52";
        ALTBLUE = "#6498ef";
        ALTMAGENTA = "#985eff";
        ALTCYAN = "#24d1e7";
        ALTWHITE = "#e5e5e5";

        BACKGROUND1 = "#415165";
        BACKGROUND2 = "#45556b";
        BACKGROUND3 = "#495a71";
        BACKGROUND4 = "#4d5f77";
        BACKGROUND5 = "#51647e";
        BACKGROUND6 = "#556984";
      };

      "bar/main" = {
        monitor = "DisplayPort-2";
        monitor-fallback = "";
        monitor-strict = false;
        override-redirect = false;
        bottom = true;
        fixed-center = true;
        width = "100%";
        height = 38;
        offset-x = "0%";
        offset-y = "0%";
        background = "\${color.BACKGROUND}";
        foreground = "\${color.FOREGROUND}";
        radius-top = "0.0";
        radius-bottom = "0.0";
        line-size = 4;
        line-color = "\${color.ACCENT}";
        border-top-size = 0;
        border-color = "\${color.ACCENT}";
        padding = 0;
        module-margin-left = 0;
        module-margin-right = 0;
        font-0 = "Iosevka Nerd Font:size=10;3";
        font-1 = "Symbols Nerd Font:size=12;3";
        font-2 = "Iosevka Nerd Font:size=6;3";
        modules-left = "menu";
        modules-center = "mod sep bspwmMain";
        modules-right = "volume bluetooth ethernet date";
        separator = "";
        spacing = 0;
        dim-value = "1.0";
        wm-name = "bspwm";
        locale = "";
        wm-restack = "bspwm";
        enable-ipc = true;
        click-left = "";
        click-middle = "";
        click-right = "";
        scroll-up = "bspc desktop -f prev.local";
        scroll-down = "bspc desktop -f next.local";
        double-click-left = "";
        double-click-middle = "";
        double-click-right = "";
        cursor-click = "";
        cursor-scroll = "";
      };

      "bar/secondary" = {
        monitor = "HDMI-A-0";
        monitor-fallback = "";
        monitor-strict = false;
        override-redirect = false;
        bottom = true;
        fixed-center = true;
        width = "100%";
        height = 38;
        offset-x = "0%";
        offset-y = "0%";
        background = "\${color.BACKGROUND}";
        foreground = "\${color.FOREGROUND}";
        radius-top = "0.0";
        radius-bottom = "0.0";
        line-size = 4;
        line-color = "\${color.ACCENT}";
        border-top-size = 0;
        border-color = "\${color.ACCENT}";
        padding = 0;
        module-margin-left = 0;
        module-margin-right = 0;
        font-0 = "Iosevka Nerd Font:size=10;3";
        font-1 = "Symbols Nerd Font:size=12;3";
        font-2 = "Iosevka Nerd Font:size=6;3";
        modules-left = "menu sep tray";
        modules-center = "mod sep bspwm";
        modules-right = "volume bluetooth ethernet date";
        separator = "";
        spacing = 0;
        dim-value = "1.0";
        wm-name = "bspwm";
        locale = "";
        wm-restack = "bspwm";
        enable-ipc = true;
        click-left = "";
        click-middle = "";
        click-right = "";
        scroll-up = "bspc desktop -f prev.local";
        scroll-down = "bspc desktop -f next.local";
        double-click-left = "";
        double-click-middle = "";
        double-click-right = "";
        cursor-click = "";
        cursor-scroll = "";
      };

      "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;
        screenchange-reload = true;
        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";
        pseudo-transparency = false;
      };

      "module/bspwmMain" = {
        type = "internal/bspwm";
        pin-workspaces = true;
        inline-mode = false;

        enable-click = true;
        enable-scroll = true;
        reverse-scroll = true;

        fuzzy-match = true;

        ws-icon-0 = "1;";
        ws-icon-1 = "2;";
        ws-icon-2 = "3;";
        ws-icon-3 = "4;";
        ws-icon-4 = "5;";
        ws-icon-5 = "6;";
        ws-icon-6 = "7;";
        ws-icon-7 = "8;";
        ws-icon-default = "";

        format = "<label-state>";
        format-font = 2;

        label-monitor = "\%name\%";

        label-focused = "\%name\%";
        label-focused-foreground = "\${color.ACCENT}";
        label-focused-padding = 1;

        label-occupied = "\%name\%";
        label-occupied-foreground = "\${color.CYAN}";
        label-occupied-padding = 1;

        label-urgent = "\%name\%";
        label-urgent-foreground = "\${color.RED}";
        label-urgent-padding = 1;

        label-empty = "\%name\%";
        label-empty-foreground = "\${color.FOREGROUND}";
        label-empty-padding = 1;

        label-separator = "\"\"";
        label-separator-padding = 0;
        label-separator-foreground = "\${color.ALTBACKGROUND}";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        pin-workspaces = true;
        inline-mode = false;

        enable-click = true;
        enable-scroll = true;
        reverse-scroll = true;

        fuzzy-match = true;

        ws-icon-0 = "9;";
        ws-icon-1 = "10;";
        ws-icon-default = "";

        format = "<label-state>";
        format-font = 2;

        label-monitor = "\%name\%";

        label-focused = "\%name\%";
        label-focused-foreground = "\${color.ACCENT}";
        label-focused-padding = 1;

        label-occupied = "\%name\%";
        label-occupied-foreground = "\${color.CYAN}";
        label-occupied-padding = 1;

        label-urgent = "\%name\%";
        label-urgent-foreground = "\${color.RED}";
        label-urgent-padding = 1;

        label-empty = "\%name\%";
        label-empty-foreground = "\${color.FOREGROUND}";
        label-empty-padding = 1;

        label-separator = "\"\"";
        label-separator-padding = 0;
        label-separator-foreground = "\${color.ALTBACKGROUND}";
      };

      "module/mod" = {
        type = "internal/bspwm";

        format = "<label-mode>";
        format-background = "\${color.BACKGROUND5}";
        format-foreground = "\${color.FOREGROUND}";
        format-underline = "\${color.BACKGROUND}";
        format-overline = "\${color.BACKGROUND}";
        format-padding = 2;

        label-monocle = "\"Monocle\"";
        label-tiled = "\"Tiled\"";

        label-floating = "\", Float\"";
        label-pseudotiled = "\", Pseudo\"";
        label-fullscreen = "\", Full\"";

        label-locked = "\" | Locked\"";
        label-sticky = "\" | Sticky\"";
        label-private = "\" | Private\"";
      };

      "module/sep" = {
        type = "custom/text";
        content = "◆";

        content-background = "\${color.BACKGROUND}";
        content-foreground = "\${color.ALTBACKGROUND}";
        content-padding = 2;
      };

      "module/volume" = {
        type = "internal/pulseaudio";

        sink = "";

        use-ui-max = false;

        interval = 5;

        format-volume = "<ramp-volume> <label-volume>";
        format-volume-background = "\${color.BACKGROUND1}";
        format-volume-padding = 3;

        format-muted = "<label-muted>";
        format-muted-background = "\${color.BACKGROUND1}";
        format-muted-padding = 3;

        label-volume = "\%percentage\%\%";

        format-muted-prefix = "婢";
        format-muted-font = 2;
        label-muted = "\" Mute\"";

        ramp-volume = ["奄" "奔" "奔" "墳" "墳"];

        ramp-volume-foreground = "\${color.MAGENTA}";
        ramp-volume-font = 2;
      };

      "module/date" = {
        type = "internal/date";

        interval = "1.0";

        time = "\%I:\%M \%p";

        time-alt = "\%b \%d, \%G";

        format = "<label>";
        format-background = "\${color.BACKGROUND6}";
        format-padding = 2;
        format-prefix = "\" \"";
        format-font = 2;
        format-prefix-foreground = "\${color.CYAN}";

        label = "\%time\%";
      };

      "module/ethernet" = {
        type = "internal/network";
        interface = "\${system.sys_network_interface}";

        interval = "1.0";
        accumulate-stats = true;
        unknown-as-up = true;

        format-connected = "<label-connected>";
        format-connected-prefix = "\"歷 \"";
        format-connected-prefix-foreground = "\${color.BLUE}";
        format-connected-prefix-font = 2;
        format-connected-background = "\${color.BACKGROUND5}";
        format-connected-padding = 3;

        format-disconnected = "<label-disconnected>";
        format-disconnected-prefix = "\"轢 \"";
        format-disconnected-prefix-font = 2;
        format-disconnected-background = "\${color.BACKGROUND5}";
        format-disconnected-padding = 3;

        label-connected = "\"%{A1:${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu &:}%downspeed% | %upspeed%%{A}\"";
        label-disconnected = "\"%{A1:networkmanager_dmenu &:}Offline%{A}\"";
      };

      "module/bluetooth" = {
        type = "custom/script";
        exec = "bluetooth_bspwm";
        interval = 1;
        tail = true;
        format = "<label>";
        format-padding = 3;
        format-background = "\${color.BACKGROUND4}";
        label = "\%output\%";
        click-left = "rofi_bluetooth &";
      };

      "module/menu" = {
        type = "custom/text";

        content = " גּ";
        content-font = 2;
        content-background = "\${color.BACKGROUND1}";
        content-foreground = "\${color.ACCENT}";
        content-padding = 4;

        click-left = "rofi_launcher";
        click-right = "rofi_runner";
      };

      "module/tray" = {
        type = "internal/tray";

        format = "<tray>";
        format-background = "\${color.BACKGROUND}";
        tray-background = "\${color.BACKGROUND}";
        tray-foreground = "\${color.FOREGROUND}";
        tray-spacing = "10px";
        tray-padding = "2px";
        tray-size = "60%";
      };
    };
  };
}
