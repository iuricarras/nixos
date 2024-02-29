{ config, lib, pkgs, ... }:
{
  hardware.opengl = {
    driSupport = true;
    extraPackages = [
      pkgs.amdvlk
    ];
    driSupport32Bit = true;
    extraPackages32 = [
      pkgs.driversi686Linux.amdvlk
    ];
  };
  environment.variables.AMD_VULKAN_ICD = "RADV";
}