{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
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
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/laptop/configuration.nix
            ./modules/nixos/bootloader/systemd.nix
            ./modules/nixos/graphics/nvidia.nix
            ./modules/nixos/pipewire.nix
            ./modules/nixos/networking.nix
            ./modules/nixos/desktopEnvironment/kde.nix
            ./modules/nixos/programs.nix
            ./modules/nixos/services.nix
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
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/desktop/configuration.nix
            ./modules/nixos/bootloader/grub.nix
            ./modules/nixos/networking.nix
            ./modules/nixos/graphics/amd.nix
            ./modules/nixos/pipewire.nix
            ./modules/nixos/services.nix
            ./modules/nixos/services.nix
            ./modules/nixos/desktopEnvironment/kde.nix
            inputs.home-manager.nixosModules.default
          ];
        };
    };
}
