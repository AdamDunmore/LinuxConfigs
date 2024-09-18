{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager, 
    spicetify-nix,
  }@inputs: 
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config = {
                allowUnfree = true;
            };
        };
        pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config = {
                allowUnfree = true;
            };
        };

        nixConfigSpecialArgs = {
                    inherit system;
                    inherit pkgs;
                    inherit pkgs-unstable;
                    inherit spicetify-nix;
                    inherit inputs;
                };
        homeManagerConfig = {
            backupFileExtension = "bkp";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.adam.imports = [ ./modules/home.nix ];
            extraSpecialArgs = {
                inherit pkgs;
                inherit pkgs-unstable;
                inherit spicetify-nix;
                inherit inputs;
            };
        };
 
    in
    {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                specialArgs = nixConfigSpecialArgs;
                modules = [
                    ./hosts/laptop/configuration.nix  
                    home-manager.nixosModules.home-manager {
                        home-manager = homeManagerConfig;
                    }
                ];
            };

            desktop = nixpkgs.lib.nixosSystem {
                specialArgs = nixConfigSpecialArgs;
                modules = [
                    ./hosts/desktop/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = homeManagerConfig;
                    }
                ];
            };

            server = nixpkgs.lib.nixosSystem {
                modules = [
                    ./hosts/server/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                           users.adam = import ./hosts/server/home.nix; 
                        }; 
                    }
                ];
            };
        };
    };
}

