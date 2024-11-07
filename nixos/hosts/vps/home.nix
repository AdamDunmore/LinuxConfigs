{ pkgs, ... }:

let

core = import ../values/core.nix;

in
{
    home.username = core.user;
    home.homeDirectory = "/home/${core.user}";
    home.stateVersion = "${core.version}";

    programs.home-manager.enable = true;

    home.packages = (with pkgs; [
        git
        zsh
        syncthing
        lsd
        neovim
        networkmanager
        yazi
    ]);

    imports = [
        ../../modules/terminal
    ];
}
