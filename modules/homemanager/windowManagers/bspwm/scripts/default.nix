{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./bluetooth_bspwm.nix
      ./rofi_launcher.nix
    ];
}
