{ pkgs, lib, ... }:

let 

colours = import ../../values/colours.nix;

in

{
    programs.alacritty = {
        enable = true;
        settings = {
            shell = "zsh";
            colors = {
                primary = {
                    background = "${colours.blue.three}";
                    foreground = "${colours.white.one}";
                };
            };
        };
    };
}
