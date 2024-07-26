{ config, lib, pkgs, ... }:

{
    imports = 
    [
        ./gaming.nix
        ./college.nix
        ./development.nix
    ];

    nixpkgs.config.allowUnfree = true;
}
