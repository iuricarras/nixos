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
    sops-nix.url = "github:Mic92/sops-nix";

    mysecrets = {
      url = "git+ssh://git@github.com/iuricarras/nix_private.git?ref=main&shallow=1";
      flake = false;
    };

  };

  outputs = inputs@{ self, nixpkgs, nur, sops-nix,... }:
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
            ./modules/nixos/bootloader/grub.nix
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
            ./modules/server/networking
            nur.modules.nixos.default
            inputs.home-manager.nixosModules.default
            sops-nix.nixosModules.sops
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
