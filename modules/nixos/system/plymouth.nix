{ config, lib, pkgs, ... }:

{
  options.plymouth = {
    enable = lib.mkEnableOption "enable plymouth module";
  };

  config = lib.mkIf config.plymouth.enable {
    boot = {
      plymouth = {
        enable = true;
      };
      # Enable "Silent Boot"
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
    };
  };
}