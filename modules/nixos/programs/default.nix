{ config, lib, pkgs, ... }:

{
    imports = 
    [
        ./gaming.nix
        ./college.nix
        ./development.nix
        ./imageAndVideo.nix
        ./misc.nix
    ];

    nixpkgs.config.allowUnfree = true;
}
