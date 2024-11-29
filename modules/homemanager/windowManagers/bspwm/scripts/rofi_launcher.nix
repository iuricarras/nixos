{pkgs, ...}: let
  rofi_launcher = pkgs.writeShellScriptBin "rofi_launcher" ''
    # Run
    rofi \
        -show drun \
    	-kb-cancel Alt-F1 \
    	-theme $HOME/.config/rofi/launcher.rasi

  '';
in {
  home.packages = with pkgs; [
    rofi_launcher
  ];
}
