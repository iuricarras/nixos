{
  config,
  lib,
  pkgs,
  ...
}: {
  sops.secrets = {
    "homarr-api-token" = {
      owner = "root";
      group = "root";
    };
  };
  virtualisation.oci-containers = {
    containers = {
      homarr = {
        image = "ghcr.io/homarr-labs/homarr:latest";
        ports = ["7575:7575"];
        volumes = ["/var/docker/homarr/appdata:/appdata"];
        environmentFiles =  [ "${config.sops.secrets."homarr-api-token".path}" ];
      };
    };
  };
}
