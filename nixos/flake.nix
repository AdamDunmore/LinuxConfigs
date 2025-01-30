{
  
    description = "NixOS configuration flake";

    # https://github.com/NixOS/nix/issues/4945 
    # Nix cant evaluate flakes properly so until then values are hardcoded
    #inputs = let core = import ./values/core.nix; in {
    inputs = {
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-${core.version}";
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # home-manager.url = "github:nix-community/home-manager/release-${core.version}";
        home-manager.url = "github:nix-community/home-manager/release-24.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

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
                        "dotnet-sdk-7.0.410"
                        "dotnet-sdk-wrapped-7.0.410"
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

            home_imports = [
                inputs.spicetify-nix.homeManagerModules.default
                inputs.nix-flatpak.homeManagerModules.nix-flatpak
            ];

            home_args = {
                backupFileExtension = "bakp";
                useGlobalPkgs = true;
                useUserPackages = true;
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
                            home-manager = {
                                users.adam.imports = [
                                    ./hosts/laptop/home.nix
                                ] ++ home_imports;
                            } // home_args;
                        }
                    ];
                };

                desktop = inputs.nixpkgs.lib.nixosSystem {
                    specialArgs = nixConfigSpecialArgs;
                    modules = [
                        ./hosts/desktop/configuration.nix
                        inputs.home-manager.nixosModules.home-manager {
                            home-manager = {
                                users.adam.imports = [
                                    ./hosts/desktop/home.nix
                                ] ++ home_imports;
                            } // home_args;
                        }
                    ];
                };

                server = inputs.nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/server/configuration.nix
                        inputs.home-manager.nixosModules.home-manager {
                            home-manager = {
				                useGlobalPkgs = true;
				                    useUserPackages = true;
                                        extraSpecialArgs = {
                                            inherit pkgs;
                                            inherit pkgs-unstable;
                                            inherit inputs;
                                    };
                                   users.adam = import ./hosts/server/home.nix; 
                            }; 
                        }
                    ];
                };
                };
        };
}

