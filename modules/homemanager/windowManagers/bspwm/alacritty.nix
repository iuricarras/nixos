{
  config,
  lib,
  pkgs,
  ...
}: {
  options.alacritty = {
    enable = lib.mkEnableOption "enables alacritty terminal emulator";
    config = lib.mkEnableOption "enables nixos' managed config";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty.enable = true;

    home.file.".config/alacritty/alacritty.toml".text = lib.mkIf config.alacritty.config ''
      ## ENVIRONMENT ----------------------------------------------------

      ## All key-value pairs in the [env] section will be added as environment variables for any process spawned
      ## by Alacritty, including its shell. Some entries may override variables set by alacritty itself.
      [env]
      TERM = "alacritty"
      WINIT_X11_SCALE_FACTOR = "1.0"

      ## WINDOW ---------------------------------------------------------
      [window]
      position = "None"
      dynamic_padding = true
      decorations = "full"
      opacity = 1.0
      blur = false
      startup_mode = "Windowed"
      dynamic_title = true
      class = { instance = "Alacritty", general = "Alacritty" }
      decorations_theme_variant = "None"

      ## Number of lines/columns (not pixels) in the terminal.
      [window.dimensions]
      columns = 82
      lines = 24

      ## Blank space added around the window in pixels.
      [window.padding]
      x = 10
      y = 10

      ## SCROLLING ------------------------------------------------------
      [scrolling]
      history = 10000
      multiplier = 3

      ## BELL -----------------------------------------------------------
      [bell]
      animation = "Linear"
      duration = 20
      command = { program = "paplay", args = ["/run/current-system/sw/share/sounds/freedesktop/stereo/dialog-error.oga"] }

      ## SELECTION ------------------------------------------------------
      [selection]
      save_to_clipboard = true

      ## CURSOR ---------------------------------------------------------
      [cursor]
      vi_mode_style = "None"
      blink_interval = 750
      blink_timeout = 5
      unfocused_hollow = false
      thickness = 0.15

      [cursor.style]
      shape = "Block"
      blinking = "On"

      ## MOUSE ----------------------------------------------------------
      [mouse]
      hide_when_typing = false

      ## HINTS ----------------------------------------------------------
      [[hints.enabled]]
      command         = "xdg-open"
      hyperlinks      = true
      post_processing = true
      persist         = false
      mouse.enabled   = true
      binding         = { key = "U", mods = "Control|Shift" }
      regex           = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩‘]+"

      ## DEBUG ----------------------------------------------------------
      [debug]
      render_timer = false
      persistent_logging = false
      log_level = "Warn"
      renderer = "None"
      print_events = false
      highlight_damage = false
      prefer_egl = false

      [general]

      ## You can set shell.program to the path of your favorite shell, e.g. /bin/zsh.
      ## Entries in shell.args are passed as arguments to the shell.
      #shell = { program = "/bin/zsh", args = ["--login"] }

      ## Directory the shell is started in. When this is unset, or "None",
      ## the working directory of the parent process will be used.
      #working_directory = "None"

      ## Live config reload
      live_config_reload = true

      ## Offer IPC using alacritty msg
      ipc_socket = true
      ## Copyright (C) 2020-2024 Aditya Shakya <adi1090x@gmail.com>
      ##
      ## Configuration for Alacritty, the GPU enhanced terminal emulator.
      ## It's a very basic and simple config file, for full configuration, Run `man 5 alacritty`

      ## GENERAL --------------------------------------------------------

      
      ## Colors configuration
      [colors.primary]
      background = "#323f4e"
      foreground = "#f8f8f2"

      [colors.normal]
      black   = "#3d4c5f"
      red     = "#f48fb1"
      green   = "#a1efd3"
      yellow  = "#f1fa8c"
      blue    = "#92b6f4"
      magenta = "#bd99ff"
      cyan    = "#87dfeb"
      white   = "#f8f8f2"

      [colors.bright]
      black   = "#56687e"
      red     = "#ee4f84"
      green   = "#53e2ae"
      yellow  = "#f1ff52"
      blue    = "#6498ef"
      magenta = "#985eff"
      cyan    = "#24d1e7"
      white   = "#e5e5e5"
      
      [font]
      ## Font size in points.
      size = 10

      ## When true, Alacritty will use a custom built-in font for box drawing characters and powerline symbols.
      builtin_box_drawing = true

      ## Normal font family.
      [font.normal]
      family = "JetBrainsMono Nerd Font"

      ## If the family is not specified, it will fall back to the value specified for the normal font.
      [font.bold]
      family = "JetBrainsMono Nerd Font"

      ## If the family is not specified, it will fall back to the value specified for the normal font.
      [font.italic]
      family = "JetBrainsMono Nerd Font"

      ## If the family is not specified, it will fall back to the value specified for the normal font.
      [font.bold_italic]
      family = "JetBrainsMono Nerd Font"

      ## Offset is the extra space around each character.
      ## 'y' can be thought of as modifying the line spacing, and 'x' as modifying the letter spacing.
      [font.offset]
      x = 0
      y = 0

      ## Glyph offset determines the locations of the glyphs within their cells with the default being at the bottom.
      ## Increasing 'x' moves the glyph to the right, increasing 'y' moves the glyph upward.
      [font.glyph_offset]
      x = 0
      y = 0
    '';
  };
}
