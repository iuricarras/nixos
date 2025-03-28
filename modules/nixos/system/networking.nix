 
{ config, lib, pkgs, ... }:

{
  options.networking = {
    enable = lib.mkEnableOption "enable networking module";

  };

  config = lib.mkIf config.networking.enable {
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
        "192.168.138.128" = [ "www.one.com" "www.two.com" "www.three.com"];
        "192.168.122.102" = ["panel.test.iuri" "system.test.iuri" "deluge.test.iuri" "dad.test.iuri" "dadapi.test.iuri" "dadws.test.iuri" "nextcloud.test.iuri"];
      };
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    boot = {
      kernelModules = [ "tcp_bbr" ];
      kernel.sysctl = {
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "fq";

        "net.core.wmem_max" = 1073741824; # 1 GiB
        "net.core.rmem_max" = 1073741824; # 1 GiB
        "net.ipv4.tcp_rmem" = "4096 87380 1073741824"; # 1 GiB max
        "net.ipv4.tcp_wmem" = "4096 87380 1073741824"; # 1 GiB max
      };
    };
  };
}
