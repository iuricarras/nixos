{ config, lib, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    #driSupport = true;
    extraPackages = [
      pkgs.libGL
    ];
    driSupport32Bit = true;
    #extraPackages32 = [
    #  pkgs.driversi686Linux.amdvlk
    #];
    #setLdLibraryPath = true;
  };
  environment.variables.AMD_VULKAN_ICD = "RADV";
}