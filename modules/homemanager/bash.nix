{ config, lib, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      "nixos-flakes-laptop" = "sudo nixos-rebuild switch --flake /home/iuricarras/Github/nixos#laptop";
      "nixos-flakes-desktop" = "sudo nixos-rebuild switch --flake /home/yuriohnice/Github/nixos#nixos-tower";
      "battery-on" = "echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
      "battery-off" = "echo o | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
    };
  };
}