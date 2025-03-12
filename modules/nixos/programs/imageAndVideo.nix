{ config, lib, pkgs, ... }:

{
  options = {
    imageAndVideo.enable = lib.mkEnableOption "enables imaging and video programs";
  };

 config = lib.mkIf config.imageAndVideo.enable {
    environment.systemPackages = (with pkgs; [
      #blend
      obs-studio
      obs-studio-plugins.obs-vaapi
      kdePackages.kdenlive
    ]);


  };
}
