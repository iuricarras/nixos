{pkgs, ...}: let
  bspterm = pkgs.writeShellScriptBin "bspterm" ''
    if [ "$1" == "--float" ]; then
    	${pkgs.alacritty}/bin/alacritty --class 'alacritty-float,alacritty-float'
    elif [ "$1" == "--full" ]; then
    	${pkgs.alacritty}/bin/alacritty --class 'alacritty-fullscreen,alacritty-fullscreen'  \
    			  -o window.startup_mode="'Fullscreen'" \
    			  window.padding.x=30 window.padding.y=30 \
    			  window.opacity=0.95 font.size=14
    else
    	${pkgs.alacritty}/bin/alacritty ''${@}
    fi
  '';
in {
  home.packages = with pkgs; [
    bspterm
  ];
}
