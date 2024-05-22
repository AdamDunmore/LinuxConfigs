{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
    stylix.url = "github:danth/stylix";

    #hyprland.url = "github:hyprwm/Hyprland";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; #Temporary and waiting for fix
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager, 
    spicetify-nix,
    stylix,
    hyprland, 
    split-monitor-workspaces
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
                inherit split-monitor-workspaces;
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
                        inherit split-monitor-workspaces;
                    };
                }
                #stylix.nixosModules.stylix
            ];

      };
    };
}

