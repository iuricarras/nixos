{ config, lib, pkgs, ... }:

{
    imports = 
    [
        ./gaming.nix
        ./college.nix
    ];

    nixpkgs.config.allowUnfree = true;
}
