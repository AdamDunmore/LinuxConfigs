{ pkgs, ... }:

{
    # GTK
    gtk = {
#        enable = true;
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
        platformTheme.name = "gtk3";
        style = {
            name = "Nordic"; 
            package = pkgs.nordic;
        };

    };
}
