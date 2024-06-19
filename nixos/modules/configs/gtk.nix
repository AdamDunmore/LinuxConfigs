{ pkgs, lib, ... }:

{
    gtk = {
        enable = true;
        theme = {
            name = "Nordic";
            package = pkgs.nordic;
        };
        iconTheme = {
            name = "breeze-dark";
        };
        font = {
            name = "CodeNewRoman";
            package = (pkgs.nerdfonts.override { fonts = [ "CodeNewRoman" ]; });
        };
    };
}
