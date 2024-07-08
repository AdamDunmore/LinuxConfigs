{ pkgs, ... }:

{
    # GTK
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

    qt = {
        enable = true;
        platformTheme.name = "adwaita";
        #style.name = "Nordic";
        style.name = "adwaita-dark";
    };
}
