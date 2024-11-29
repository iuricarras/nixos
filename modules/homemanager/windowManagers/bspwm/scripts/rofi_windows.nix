{pkgs, ...}: let
  rofi_windows = pkgs.writeShellScriptBin "rofi_windows" ''
    # Run
    rofi \
        -show window \
    	-theme $HOME/.config/rofi/windows.rasi
  '';
in {
  home.packages = with pkgs; [
    rofi_windows
  ];
}
