{...}: {
  home.file.".config/rofi/powermenu.rasi".text =
    /*
    rasi
    */
    ''
      /*****----- Configuration -----*****/
      configuration {
          show-icons:                 false;
      }

      /*****----- Global Properties -----*****/
      @import                          "shared/colors.rasi"
      @import                          "shared/fonts.rasi"

      /*
      USE_ICON=NO
      */

      /*****----- Main Window -----*****/
      window {
          transparency:                "real";
          location:                    southeast;
          anchor:                      southeast;
          fullscreen:                  false;
          width:                       400px;
          x-offset:                    -10px;
          y-offset:                    -48px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          cursor:                      "default";
          background-color:            @background;
      }

      /*****----- Main Box -----*****/
      mainbox {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     20px;
          background-color:            transparent;
          children:                    [ "inputbar", "message", "listview" ];
      }

      /*****----- Inputbar -----*****/
      inputbar {
          enabled:                     true;
          spacing:                     10px;
          padding:                     0px;
          border:                      0px;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          text-color:                  @foreground;
          children:                    [ "textbox-prompt-colon", "prompt"];
      }

      textbox-prompt-colon {
          enabled:                     true;
          expand:                      false;
          str:                         "";
          border-radius:               0px;
          background-color:            inherit;
          text-color:                  inherit;
      }
      prompt {
          enabled:                     true;
          border-radius:               0px;
          background-color:            inherit;
          text-color:                  inherit;
      }

      /*****----- Message -----*****/
      message {
          enabled:                     true;
          margin:                      0px;
          padding:                     10px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background-alt;
          text-color:                  @foreground;
      }
      textbox {
          background-color:            inherit;
          text-color:                  inherit;
          vertical-align:              0.5;
          horizontal-align:            0.0;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     true;
          columns:                     2;
          lines:                       3;
          cycle:                       true;
          scrollbar:                   false;
          layout:                      vertical;
          
          spacing:                     10px;
          background-color:            transparent;
          cursor:                      "default";
      }

      /*****----- Elements -----*****/
      element {
          enabled:                     true;
          padding:                     10px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          text-color:                  @foreground;
          cursor:                      pointer;
      }
      element-text {
          background-color:            transparent;
          text-color:                  inherit;
          cursor:                      inherit;
          vertical-align:              0.5;
          horizontal-align:            0.5;
      }

      element normal.normal,
      element alternate.normal {
          background-color:            var(background-alt);
          text-color:                  var(foreground);
      }
      element normal.urgent,
      element alternate.urgent,
      element selected.active {
          background-color:            var(urgent);
          text-color:                  var(background);
      }
      element normal.active,
      element alternate.active,
      element selected.urgent {
          background-color:            var(active);
          text-color:                  var(background);
      }
      element selected.normal {
          background-color:            var(selected);
          text-color:                  var(background);
      }

    '';
}
