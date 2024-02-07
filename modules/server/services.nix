{ config, lib, pkgs, ... }:
{
  services = {
    plex = {
      enable = true;
      openFirewall = true;
    };
    openssh.enable = true;
    logind.lidSwitch = "ignore";
  };
}