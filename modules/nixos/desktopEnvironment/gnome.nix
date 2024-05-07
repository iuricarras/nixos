{ config, lib, pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome =  {
      enable = true;
      extraGSettingsOverridePackages = [pkgs.gnome.mutter];
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['variable-refresh-rate', 'scale-monitor-framebuffer']
      '';
    };
    displayManager.gdm.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.ideapad
    gnomeExtensions.tiling-assistant
    papirus-icon-theme
    yaru-theme
    ubuntu_font_family
  ];
}
    