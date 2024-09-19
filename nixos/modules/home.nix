{ pkgs, pkgs-unstable, inputs, ... }:

let

core = import ../values/core.nix;

in
{
    home.username = core.user;
    home.homeDirectory = "/home/${core.user}";
    home.stateVersion = "${core.version}";

    programs.home-manager.enable = true;

    imports = [
        ./configs/alacritty.nix
        ./configs/apps.nix
        ./configs/code.nix
        ./configs/dconf.nix
        # ./configs/firefox.nix
        ./configs/flatpak.nix
        ./configs/kanshi.nix
        ./configs/lsd.nix
        ./configs/river.nix
        ./configs/starship.nix
        ./configs/sway.nix
        ./configs/theme.nix
        ./configs/wofi.nix
        ./configs/wpaperd.nix
        ./configs/zsh.nix

        (import ./configs/spicetify.nix { inherit inputs; inherit pkgs; })
    ];

    #Git credential helper setup
    programs.git = {
        enable = true;
        userName = "Adam Dunmore";
        userEmail = "adamfdunmore@gmail.com";
        extraConfig = {
            credential.helper = "${
                pkgs.git.override { withLibsecret = true; }
            }/bin/git-credential-libsecret";
        };
    };
}




