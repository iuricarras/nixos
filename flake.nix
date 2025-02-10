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
      nixosConfigurations.gaiaserver = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/server/configuration.nix
            ./modules/server/nginx
            ./modules/server/services
            nur.modules.nixos.default
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
