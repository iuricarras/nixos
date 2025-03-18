{ config, lib, pkgs, ... }:

{
    imports =
    [
      ./nextcloud.nix
      ./plex.nix
      ./radarr.nix
      ./prowlarr.nix
      ./sonarr.nix
      ./discord.nix
      ./overseerr.nix
      ./homarr.nix
      ./sops.nix
    ];

    services = {
      logind.lidSwitch = "ignore";
    };

}
