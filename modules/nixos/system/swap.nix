{ lib, config, pkgs, ... }:

{
  options.swap = {
    enable = lib.mkEnableOption "enable swap module";

  };

  config = lib.mkIf config.swap.enable {
    swapDevices = [ {
        device = "/var/lib/swapfile";
        size = 16*1024;
    }];
  };
}
