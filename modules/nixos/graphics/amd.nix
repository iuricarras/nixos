{ config, lib, pkgs, ... }:

{
  options.graphics.amd = {
    enable = lib.mkEnableOption "enable amd gpu module";

  };

  config = lib.mkIf config.graphics.amd.enable {
    hardware.graphics = {
      enable = true;
      #driSupport = true;
      extraPackages = [
        pkgs.libGL
      ];
      enable32Bit = true;
      #extraPackages32 = [
      #  pkgs.driversi686Linux.amdvlk
      #];
      #setLdLibraryPath = true;
    };
    environment.variables.AMD_VULKAN_ICD = "RADV";
  };
}
