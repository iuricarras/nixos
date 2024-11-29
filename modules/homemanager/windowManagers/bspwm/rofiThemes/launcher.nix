{...}: {
  home.file.".config/rofi/launcher.rasi".text =
    /*
    rasi
    */
    ''
      configuration {
      	modi:                       "drun,run,filebrowser,window";
        show-icons:                 true;
        display-drun:               " Apps";
        display-run:                " Run";
        display-filebrowser:        " Files";
        display-window:             " Windows";
      	drun-display-format:        "{name}";
      	window-format:              "{c} · {t}";
      }

      @import                          "shared/colors.rasi"
      @import                          "shared/fonts.rasi"

      * {
        border-colour:               var(selected);
        handle-colour:               var(selected);
        background-colour:           var(background);
        foreground-colour:           var(foreground);
        alternate-background:        var(background-alt);
        normal-background:           var(background);
        normal-foreground:           var(foreground);
        urgent-background:           var(urgent);
        urgent-foreground:           var(background);
        active-background:           var(active);
        active-foreground:           var(background);
        selected-normal-background:  var(selected);
        selected-normal-foreground:  var(background);
        selected-urgent-background:  var(active);
        selected-urgent-foreground:  var(background);
        selected-active-background:  var(urgent);
        selected-active-foreground:  var(background);
        alternate-normal-background: var(background);
        alternate-normal-foreground: var(foreground);
        alternate-urgent-background: var(urgent);
        alternate-urgent-foreground: var(background);
        alternate-active-background: var(active);
        alternate-active-foreground: var(background);
      }

      window {
          /* properties for window widget */
          transparency:                "real";
          location:                    southwest;
          anchor:                      southwest;
          fullscreen:                  false;
          width:                       450px;
          x-offset:                    10px;
          y-offset:                    -48px;

          /* properties for all widgets */
          enabled:                     true;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          cursor:                      "default";
          /* Backgroud Colors */
          background-color:            @background-colour;
          /* Backgroud Image */
          //background-image:          url("/path/to/image.png", none);
          /* Simple Linear Gradient */
          //background-image:          linear-gradient(red, orange, pink, purple);
          /* Directional Linear Gradient */
          //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
          /* Angle Linear Gradient */
          //background-image:          linear-gradient(45, cyan, purple, indigo);
      }

      mainbox {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     20px;
          border:                      0px solid;
          border-radius:               0px 0px 0px 0px;
          border-color:                @border-colour;
          background-color:            transparent;
          children:                    [ "inputbar", "mode-switcher", "message", "listview" ];
      }

      inputbar {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          children:                    [ "textbox-prompt-colon", "entry" ];
      }

      prompt {
          enabled:                     true;
          background-color:            inherit;
          text-color:                  inherit;
      }
      textbox-prompt-colon {
          enabled:                     true;
          padding:                     5px 0px;
          expand:                      false;
          str:                         "";
          background-color:            inherit;
          text-color:                  inherit;
      }
      entry {
          enabled:                     true;
          padding:                     5px 0px;
          background-color:            inherit;
          text-color:                  inherit;
          cursor:                      text;
          placeholder:                 "Search...";
          placeholder-color:           inherit;
      }
      num-filtered-rows {
          enabled:                     true;
          expand:                      false;
          background-color:            inherit;
          text-color:                  inherit;
      }
      textbox-num-sep {
          enabled:                     true;
          expand:                      false;
          str:                         "/";
          background-color:            inherit;
          text-color:                  inherit;
      }
      num-rows {
          enabled:                     true;
          expand:                      false;
          background-color:            inherit;
          text-color:                  inherit;
      }
      case-indicator {
          enabled:                     true;
          background-color:            inherit;
          text-color:                  inherit;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     true;
          columns:                     1;
          lines:                       8;
          cycle:                       true;
          dynamic:                     true;
          scrollbar:                   false;
          layout:                      vertical;
          reverse:                     false;
          fixed-height:                true;
          fixed-columns:               true;
          
          spacing:                     5px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          cursor:                      "default";
      }
      scrollbar {
          handle-width:                5px ;
          handle-color:                @handle-colour;
          border-radius:               10px;
          background-color:            @alternate-background;
      }

      /*****----- Elements -----*****/
      element {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     8px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          cursor:                      pointer;
      }
      element normal.normal {
          background-color:            var(normal-background);
          text-color:                  var(normal-foreground);
      }
      element normal.urgent {
          background-color:            var(urgent-background);
          text-color:                  var(urgent-foreground);
      }
      element normal.active {
          background-color:            var(active-background);
          text-color:                  var(active-foreground);
      }
      element selected.normal {
          background-color:            var(selected-normal-background);
          text-color:                  var(selected-normal-foreground);
      }
      element selected.urgent {
          background-color:            var(selected-urgent-background);
          text-color:                  var(selected-urgent-foreground);
      }
      element selected.active {
          background-color:            var(selected-active-background);
          text-color:                  var(selected-active-foreground);
      }
      element alternate.normal {
          background-color:            var(alternate-normal-background);
          text-color:                  var(alternate-normal-foreground);
      }
      element alternate.urgent {
          background-color:            var(alternate-urgent-background);
          text-color:                  var(alternate-urgent-foreground);
      }
      element alternate.active {
          background-color:            var(alternate-active-background);
          text-color:                  var(alternate-active-foreground);
      }
      element-icon {
          background-color:            transparent;
          text-color:                  inherit;
          size:                        24px;
          cursor:                      inherit;
      }
      element-text {
          background-color:            transparent;
          text-color:                  inherit;
          highlight:                   inherit;
          cursor:                      inherit;
          vertical-align:              0.5;
          horizontal-align:            0.0;
      }

      /*****----- Mode Switcher -----*****/
      mode-switcher{
          enabled:                     true;
          expand:                      false;
          spacing:                     10px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
      }
      button {
          padding:                     10px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            @alternate-background;
          text-color:                  inherit;
          cursor:                      pointer;
      }
      button selected {
          background-color:            var(selected-normal-background);
          text-color:                  var(selected-normal-foreground);
      }

      /*****----- Message -----*****/
      message {
          enabled:                     true;
          margin:                      0px;
          padding:                     10px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            @alternate-background;
          text-color:                  @foreground-colour;
      }
      textbox {
          border:                      0px solid;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          vertical-align:              0.5;
          horizontal-align:            0.0;
          highlight:                   none;
          placeholder-color:           @foreground-colour;
          blink:                       true;
          markup:                      true;
      }
      error-message {
          padding:                     15px;
          border:                      0px solid;
          border-radius:               10px;
          border-color:                @border-colour;
          background-color:            @background-colour;
          text-color:                  @foreground-colour;
      }
    '';
}