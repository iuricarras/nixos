{ pkgs, lib, config, ... }:
{
  environment.etc."nextcloud-admin-pass".text = "DefaultPassword1234";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "nextcloud.test.iuri";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "sqlite";
  };
}