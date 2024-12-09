{ config, lib, pkgs, ... }:

{
  options = {
    college.enable = lib.mkEnableOption "enables college programs";
  };

  config = lib.mkIf config.college.enable {
    environment.systemPackages = (with pkgs; [
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

      #SS
      veracrypt
      openssl
      thunderbird
      easyrsa
      nur.repos.k3a.steghide
    ]);

    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.pinentryPackage = pkgs.pinentry-tty;

    users.groups.ubridge = { };
    

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
      docker.daemon.settings =  {
        "insecure-registries" = [ "registry.172.22.21.107.sslip.io" ];
      };
    };    
  };
}
