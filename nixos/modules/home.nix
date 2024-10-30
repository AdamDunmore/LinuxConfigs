    { pkgs, inputs, ... }:

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
        ./configs/ags/ags.nix
        ./configs/apps.nix
        ./configs/code.nix
        ./configs/dconf.nix
        ./configs/flatpak.nix
        ./configs/git.nix
        ./configs/hyprland.nix
        ./configs/kanshi.nix
        ./configs/lsd.nix
        ./configs/mako.nix
        ./configs/nvim/nvim.nix
        ./configs/river.nix
        ./configs/starship.nix
        ./configs/sway.nix
        ./configs/theme.nix
        ./configs/wofi.nix
        ./configs/wpaperd.nix
        ./configs/yazi.nix
        ./configs/zsh.nix

        (import ./configs/spicetify.nix { inherit inputs; inherit pkgs; })
    ];
}




