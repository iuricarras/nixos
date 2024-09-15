{ config, lib, pkgs, ... }:

{
    imports =
    [
        ./kde.nix
        ./gnome.nix
        ./bspwm.nix
        ./hyperland.nix
    ];

}
