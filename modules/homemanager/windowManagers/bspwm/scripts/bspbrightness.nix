{pkgs, ...}: let
  bspbrightness = pkgs.writeShellScriptBin "bspbrightness" ''
    # Icons
    iDIR="$HOME/.config/dunst/icons"

    # Graphics card
    CARD=`ls /sys/class/backlight | head -n 1`

    # Get brightness
    get_backlight() {
      LIGHT=$(printf "%.0f\n" `${pkgs.light}/bin/light -G`)
      echo "''${LIGHT}%"
    }

    # Get icons
    get_icon() {
      backlight="$(get_backlight)"
      current="''${backlight%%%}"
      if [[ ("$current" -ge "0") && ("$current" -le "20") ]]; then
        icon="$iDIR"/brightness-20.png
      elif [[ ("$current" -ge "20") && ("$current" -le "40") ]]; then
        icon="$iDIR"/brightness-40.png
      elif [[ ("$current" -ge "40") && ("$current" -le "60") ]]; then
        icon="$iDIR"/brightness-60.png
      elif [[ ("$current" -ge "60") && ("$current" -le "80") ]]; then
        icon="$iDIR"/brightness-80.png
      elif [[ ("$current" -ge "80") && ("$current" -le "100") ]]; then
        icon="$iDIR"/brightness-100.png
      fi
    }

    # Notify 
    notify_bl() {
      get_icon && ${pkgs.dunst}/bin/dunstify -u low -h string:x-dunst-stack-tag:obbacklight -i "$icon" "Brightness : $(get_backlight)"
    }

    # Increase brightness
    inc_backlight() {
      ${pkgs.light}/bin/light -A 5 && notify_bl
    }

    # Decrease brightness
    dec_backlight() {
      ${pkgs.light}/bin/light -U 5 && notify_bl
    }

    # Execute accordingly
    if [[ "$1" == "--get" ]]; then
      get_backlight
    elif [[ "$1" == "--inc" ]]; then
      inc_backlight
    elif [[ "$1" == "--dec" ]]; then
      dec_backlight
    else
      get_backlight
    fi
  '';
in {
  home.packages = with pkgs; [
    bspbrightness
  ];
}