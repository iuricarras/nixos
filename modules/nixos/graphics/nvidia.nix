{ config, lib, pkgs, ... }:

{
  options.graphics.nvidia = {
    enable = lib.mkEnableOption "enable nvidia gpu module";

  };

  config = lib.mkIf config.graphics.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.graphics = {
      enable = true;
      extraPackages = [
        pkgs.libGL
      ];
    };

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    hardware.graphics = {
      enable32Bit = true;
    };
  };
}
