{ config, lib, pkgs, ... }:

{
  imports =
    [
     # ../../modules/homemanager/bash.nix
    ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "iuricarras";
  home.homeDirectory = "/home/iuricarras";
	
  home.packages = with pkgs; [
    ulauncher
    starship
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
