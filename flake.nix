{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nurpkgs = {
      url = "github:nix-community/NUR";
    };
    
  };

  outputs = inputs@{ self, nixpkgs, nur,... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/laptop/configuration.nix
            ./modules/nixos/bootloader/systemd.nix
            ./modules/nixos/graphics
            ./modules/nixos/programs
            ./modules/nixos/system
            ./modules/nixos/desktopEnvironment
            nur.modules.nixos.default           
            inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.server = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/server/configuration.nix
            ./modules/server/firewall.nix
            ./modules/server/services.nix
            ./modules/server/nvidia.nix
            ./modules/server/programs.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.nixos-tower = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/desktop/configuration.nix
            ./modules/nixos/bootloader/grub.nix
            ./modules/nixos/graphics
            ./modules/nixos/programs
            ./modules/nixos/system
            ./modules/nixos/desktopEnvironment
            nur.modules.nixos.default
            inputs.home-manager.nixosModules.default
          ];
        };
    };
}
