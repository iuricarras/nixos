{ config, lib, pkgs, ... }:

{
    imports =
    [
        ./mainuser.nix
        ./services
        ./swap.nix
        ./audio.nix
        ./networking.nix
    ];


}
