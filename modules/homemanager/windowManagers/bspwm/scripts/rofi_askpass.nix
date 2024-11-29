{pkgs, ...}: let
  rofi_askpass = pkgs.writeShellScriptBin "rofi_askpass" ''
    RASI="$HOME/.config/rofi/askpass.rasi"

    # Rofi text dialog to get password
    rofi -dmenu \
         -password \
         -i \
         -p "Root" \
         -theme ''${RASI}
  '';
in {
  home.packages = with pkgs; [
    rofi_askpass
  ];
}
