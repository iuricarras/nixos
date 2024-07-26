{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.opengl = {
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
  	package = config.boot.kernelPackages.nvidiaPackages.latest;
  	prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
	  };
  }; 
}
