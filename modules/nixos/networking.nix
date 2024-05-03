 
{ config, lib, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall = {
      logReversePathDrops = true;
      extraCommands = ''
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
      '';
      extraStopCommands = ''
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
      '';
    };
    hosts = {
      "192.168.6.129" = [ "www.spain_portugal.com" "www.portugal_spain.com" ];
      "10.14.40.128" = [ "im.web" "static.im.web" "dinamic.im.web"];
    };
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
    
}