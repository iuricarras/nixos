{ pkgs, lib, config, ... }:
{
  services.deluge = {
    enable = true;
    web.enable = true;
  };
  services.nginx = {
    virtualHosts."deluge.test.iuri" =  {
      forceSSL = true;
      sslCertificate = "/var/lib/nginx/domain.crt";
      sslCertificateKey = "/var/lib/nginx/domain.key";
      locations."/" = {
        proxyPass = "http://127.0.0.1:8112";
        recommendedProxySettings = true;
      };
    };
  };
}