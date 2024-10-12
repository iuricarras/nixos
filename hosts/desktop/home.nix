{ config, lib, pkgs, ... }:

{
  imports =
    [
    ../../modules/homemanager/programs
    ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yuriohnice";
  home.homeDirectory = "/home/yuriohnice";
	
  home.packages = with pkgs; [
  	ulauncher
  ];
  systemd.user.services.ulauncher = {
      Unit = { Description = "Start Ulauncher"; };
      Service = {
        Type = "exec";
        ExecStart = "${pkgs.ulauncher}/bin/ulauncher --hide-window";
        Restart = "on-failure";
      };
      Install = { WantedBy = [ "graphical.target" ]; };
    };

  gns3.enable = true;
  gns3.userName = "yuriohnice";

#  gtk.enable = true;

#  qt.enable = true;

# platform theme "gtk" or "gnome"
#qt.platformTheme = "gtk";

# name of the qt theme
#qt.style.name = "adwaita-dark";

# detected automatically:
# adwaita, adwaita-dark, adwaita-highcontrast,
# adwaita-highcontrastinverse, breeze,
# bb10bright, bb10dark, cde, cleanlooks,
# gtk2, motif, plastique

# package to use
#qt.style.package = pkgs.adwaita-qt6;


#gtk.theme.package = pkgs.adw-gtk3;
#gtk.theme.name = "adw-gtk3";

  # This value determines the Home Manager release that your 
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";
}
