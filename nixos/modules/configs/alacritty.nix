{ pkgs, lib, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            shell = "zellij";
        };
    };
}
