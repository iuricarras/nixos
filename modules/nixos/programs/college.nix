{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    college.enable = lib.mkEnableOption "enables college programs";
  };

  config = lib.mkIf config.college.enable {
    environment.systemPackages = with pkgs; [
      #(jetbrains.idea-ultimate.override { jdk = jdk21;})
      #ciscoPacketTracer8
      github-desktop
      teams-for-linux
      wireshark
      nmap
      gns3-gui
      gns3-server
      #firefox-devedition
      dynamips
      vpcs
      ubridge
      inetutils
      netcat-gnu
      moonlight-qt
      nodejs_22
      php83
      php83Packages.composer
      kubectl
      postman
      obsidian

      just

      #SS
      #veracrypt
      #openssl
      #thunderbird
      #easyrsa
      #nur.repos.k3a.steghide

      #LTI
      mininet
    ];

    networking.interfaces.pc1.virtual = true;
    networking.interfaces.pc1.ipv4.addresses = [
      {
        address = "10.10.10.10";
        prefixLength = 24;
      }
    ];

    networking.interfaces.pc1.ipv4.routes = [
      {
        address = "172.168.10.0";
        prefixLength = 24;
      }
      {
        address = "172.168.111.0";
        prefixLength = 24;
      }
    ];

    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.pinentryPackage = pkgs.pinentry-tty;

    users.groups.ubridge = {};

    security.wrappers.ubridge = {
      source = "${pkgs.ubridge}/bin/ubridge";
      capabilities = "cap_net_admin,cap_net_raw=ep";
      owner = "root";
      group = "ubridge";
      permissions = "u+rx,g+rx,o+rx";
    };

    virtualisation = {
      #virtualbox.host.enable = true;
      vmware.host.enable = true;
      docker.daemon.settings = {
        "insecure-registries" = ["registry.172.22.21.107.sslip.io"];
      };
    };

    nixpkgs.config.permittedInsecurePackages = [
      "squid-6.10"
    ];

    # services.squid.enable = true;
    # services.squid.extraConfig = ''
    # acl Myip src 192.168.20.238/32   #3 a)
    # acl blockSite dstdomain .neverssl.com #5 a)
    # acl schooltime time MTWHF 11:00-18:00 #5 b)
    # acl proibir_leiria url_regex -i leiria
    # acl proibir_pdfs url_regex -i \.pdf$

    # http_access allow blockSite schooltime #5 b)
    # http_access deny blockSite #5 c)
    # http_access deny proibir_leiria
    # http_access deny proibir_pdfs
    # http_access allow Myip #3 a)
    # http_access allow localhost manager
    # http_access deny manager
    # http_access deny to_localhost
    # http_access deny to_linklocal

    # cache_dir ufs /var/cache/squid 1000 16 256
    # refresh_pattern -i \.(css|js)$ 120 50% 86400 ignore-reload
    # '';
  };
}
