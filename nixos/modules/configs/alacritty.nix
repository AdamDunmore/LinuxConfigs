{ pkgs, lib, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            shell = "zsh";
            colors = {
                primary = {
                    background = "#2E3440";
                    foreground = "#D8DEE9";
                };
            };
        };
    };
}
