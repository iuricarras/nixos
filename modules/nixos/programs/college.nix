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
    ]);

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
    };

    #services.gns3-server.enable = true;
    #services.gns3-server.auth.enable = false;
    #services.gns3-server.ubridge.enable = true;
    #services.gns3-server.vpcs.enable = true;
    #services.gns3-server.dynamips.enable = true;
    
  };
}
