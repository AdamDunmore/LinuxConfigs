{
    description = "NixOS configuration flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
<<<<<<< Updated upstream
        spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
=======
>>>>>>> Stashed changes

        nix-flatpak.url = "github:gmodena/nix-flatpak";
    };

    outputs = { ... } @inputs: 
        let
            system = "x86_64-linux";
            pkgs = import inputs.nixpkgs {
                inherit system;
                config = {
                    allowUnfree = true;
                    permittedInsecurePackages = [
                        "electron-27.3.11"
                    ];
                };
            };
            pkgs-unstable = import inputs.nixpkgs-unstable {
                inherit system;
                config = {
                    allowUnfree = true;
                };
            };

            nixConfigSpecialArgs = {
                inherit system;
                inherit pkgs;
                inherit pkgs-unstable;
                inherit inputs;
            };

            homeManagerConfig = {
                backupFileExtension = "bakp";
                useGlobalPkgs = true;
                useUserPackages = true;
                users.adam.imports = [
                    inputs.spicetify-nix.homeManagerModules.default
                    inputs.nix-flatpak.homeManagerModules.nix-flatpak
                    ./modules/home.nix
                ];
                extraSpecialArgs = {
                    inherit pkgs;
                    inherit pkgs-unstable;
                    inherit inputs;
                };
            };
 
        in

        {
            nixosConfigurations = {
                laptop = inputs.nixpkgs.lib.nixosSystem {
                    specialArgs = nixConfigSpecialArgs;
                    modules = [
                        ./hosts/laptop/configuration.nix  
                        inputs.home-manager.nixosModules.home-manager {
                            home-manager = homeManagerConfig;
                        }
                    ];
                };

                desktop = inputs.nixpkgs.lib.nixosSystem {
                    specialArgs = nixConfigSpecialArgs;
                    modules = [
                        ./hosts/desktop/configuration.nix
                        inputs.home-manager.nixosModules.home-manager {
                            home-manager = homeManagerConfig;
                        }
                    ];
                };

                server = inputs.nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/server/configuration.nix
                        inputs.home-manager.nixosModules.home-manager {
                            home-manager = {
                               users.adam = import ./hosts/server/home.nix; 
                            }; 
                        }
                    ];
                };
            };
        };
}

