{ config, lib, pkgs, ... }:
{
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
}
