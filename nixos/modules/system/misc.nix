{ pkgs, ... }:

{
    # Services (Mainly for AGS)
    services = {
        libinput.enable = true;
        printing.enable = true;
        power-profiles-daemon.enable = true;
        gvfs.enable = true;
    };

    # Enable networking
    networking.networkmanager.enable = true;

    # Dotnet location fix
    environment.sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_7}";
    };

    # Downloading Nerd Font
    fonts.packages = with pkgs; [
	    (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
    ];

    #Enables Flatpak
    services.flatpak.enable = true;

    #Enables Hyprlock
    security.polkit.enable = true;
    security.pam.services.hyprlock = {};
    security.pam.services.swaylock = {};

    # Garbage Collection
    nix.gc = {
        automatic = true;
        options = "--delete-older-than 30d";
    };

    # Man pages
    documentation.dev.enable = true;

}
