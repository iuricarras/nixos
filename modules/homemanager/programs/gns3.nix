{ config, lib, pkgs, ... }:

let
  cfg = config.gns3;
in
{
  options.gns3 = {
    enable = lib.mkEnableOption "enables gns3 configs";
		
		userName = lib.mkOption {
      default = "iuricarras";
      description = ''
        username
      '';
    };
  };

	config = lib.mkIf cfg.enable {
		home.file.".config/GNS3/2.2/gns3_server.conf".text = ''
			[Server]
			path = /run/current-system/sw/bin/gns3server
			ubridge_path = /run/wrappers/bin/ubridge
			host = 127.0.0.1
			port = 3080
			images_path = /home/${cfg.userName}/GNS3/images
			projects_path = /home/${cfg.userName}/Nextcloud/Documents/Uni/EI/Y3/S1/GNS
			appliances_path = /home/${cfg.userName}/GNS3/appliances
			additional_images_paths = 
			symbols_path = /home/${cfg.userName}/GNS3/symbols
			configs_path = /home/${cfg.userName}/GNS3/configs
			report_errors = True
			auto_start = True
			allow_console_from_anywhere = False
			auth = False
			user = admin
			password = 
			protocol = http
			console_start_port_range = 5000
			console_end_port_range = 10000
			udp_start_port_range = 10000
			udp_end_port_range = 20000

			[Dynamips]
			allocate_aux_console_ports = True
			ghost_ios_support = True
			sparse_memory_support = True
			mmap_support = True
			dynamips_path = /run/current-system/sw/bin/dynamips

			[VMware]
			host_type = ws
			vmnet_start_range = 10
			vmnet_end_range = 20
			block_host_traffic = False
			vmrun_path = /run/current-system/sw/bin/vmrun
		'';
	};
}