{...}: {
  home.file.".config/rofi/askpass.rasi".text =
    /*
    rasi
    */
    ''
      /*****----- Global Properties -----*****/
      @import                          "shared/colors.rasi"
      @import                          "shared/fonts.rasi"

      /*****----- Main Window -----*****/
      window {
          location:                    center;
          anchor:                      center;
          fullscreen:                  false;
          width:                       350px;
          x-offset:                    0px;
          y-offset:                    0px;
          padding:                     15px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background;
          cursor:                      "default";
          children:                    [ "inputbar", "listview" ];
      }

      /*****----- Inputbar -----*****/
      inputbar {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          text-color:                  @foreground;
          children:                    [ "textbox-prompt-colon", "prompt", "entry" ];
      }

      dummy {
          expand:                      false;
          width:                       10px;
          background-color:            transparent;
      }
      textbox-prompt-colon {
          enabled:                     true;
          expand:                      false;
          str:                         "";
          padding:                     10px 13px;
          border-radius:               0px;
          background-color:            @urgent;
          text-color:                  @background;
      }
      prompt {
          enabled:                     true;
          padding:                     10px;
          border-radius:               0px;
          background-color:            @selected;
          text-color:                  @background;
      }
      entry {
          enabled:                     true;
          padding:                     10px 15px;
          border-radius:               0px;
          background-color:            @background-alt;
          text-color:                  inherit;
          cursor:                      text;
          placeholder:                 "Password";
          placeholder-color:           inherit;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     false;
      }
    '';
}
