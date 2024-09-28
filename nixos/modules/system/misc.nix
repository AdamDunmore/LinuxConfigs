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

    # Enable Waydroid
    virtualisation.waydroid.enable = true;

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

    #Enables Wms
    programs.hyprland.enable = true;
    programs.river.enable = true;

}
