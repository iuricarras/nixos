{ config, lib, pkgs, ... }:
{
  boot = {
	  supportedFilesystems = [ "ntfs" ];
	  loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
        default = "saved";
      };
      timeout = 20;
    };
  };
}