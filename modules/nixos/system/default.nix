{ config, lib, pkgs, ... }:

{
    imports =
    [
        ./mainuser.nix
        ./services
    ];

}
