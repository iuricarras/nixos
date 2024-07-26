{ config, lib, pkgs, ... }:

{
  options = {
    college.enable = lib.mkEnableOption "enables college programs";
  };

  config = lib.mkIf config.college.enable {
    environment.systemPackages = (with pkgs; [
      (jetbrains.idea-ultimate.override { jdk = jdk21;})
      ciscoPacketTracer8
      github-desktop
      teams-for-linux
      vscode
      wireshark
    ]);

    virtualisation = {
      #virtualbox.host.enable = true;
      #vmware.host.enable = true;
    };
  };
}
