{ pkgs, lib, ... }:

let 

colours = import ../../values/colours.nix;

in

{
    programs.alacritty = {
        enable = true;
        settings = {
            shell = "${pkgs.zsh}/bin/zsh";
            colors = {
                primary = {
                    background = "${colours.blue.three}";
                    foreground = "${colours.white.one}";
                };
            };
            keyboard.bindings = [
                    { key = "N"; mods = "Control"; action = "ToggleFullscreen"; }
                    { key = "E"; mods = "Control"; command = "${pkgs.neovim}/bin/nvim"; }
            ];
        };
    };
}
