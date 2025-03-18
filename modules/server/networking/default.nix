{ config, lib, pkgs, ... }:
{
  imports = [
    ./firewall.nix
    ./wireguard.nix
  ];
  networking.networkmanager.dns = "none";
  networking.nameservers = [
  "1.1.1.1"
  "1.0.0.1"
  "8.8.8.8"
  "8.8.4.4"
];

}
