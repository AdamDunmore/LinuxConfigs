{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
    stylix.url = "github:danth/stylix";

    hyprland = {
        url = "github:hyprwm/Hyprland";
        follows = "hyprland-virtual-desktops/hyprland";     
    };
    hyprland-virtual-desktops.url = "github:levnikmyskin/hyprland-virtual-desktops";
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager, 
    spicetify-nix,
    stylix,
    hyprland, 
    hyprland-virtual-desktops 
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

        hostName = "${builtins.getEnv "HOSTNAME"}";
        hostPath = ./. + (if "${hostName}" == "desktop" then "/hosts/desktop/configuration.nix" else if "${hostName}" == "laptop" then "/hosts/laptop/configuration.nix" else "/hosts/desktop/configuration.nix");

    in
    {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit system;
                inherit pkgs;
                inherit pkgs-unstable;
                inherit spicetify-nix;
                inherit stylix;
                inherit hyprland;
                inherit hyprland-virtual-desktops;
            };
            modules = [
                hostPath
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.adam.imports = [ ./modules/home.nix ];
                    home-manager.extraSpecialArgs = {
                        inherit pkgs-unstable;
                        inherit spicetify-nix;
                        inherit hyprland;
                        inherit hyprland-virtual-desktops;
                    };
                }
                #stylix.nixosModules.stylix
            ];

      };
    };
}

