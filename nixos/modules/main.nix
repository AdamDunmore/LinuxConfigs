{ pkgs, ... }:

{

    imports = [
        ./system/audio.nix
        ./system/bluetooth.nix
        ./system/bootloader.nix
        ./system/greetd/greetd.nix
        ./system/kde.nix
        ./system/keyboard.nix
        ./system/timezone.nix
        ./system/users.nix
    ];


    system.stateVersion = "24.05";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Downloading Nerd Font
    fonts.packages = with pkgs; [
	    (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
    ];

    #Enabling Programs
    programs = {
        steam.enable = true;
        sway.enable = true;
    };


    # Services (Mainly for AGS)
    services = {
        libinput.enable = true;
        printing.enable = true;
        power-profiles-daemon.enable = true;
        gvfs.enable = true;
    };

    # Enable networking
    networking.networkmanager.enable = true;

    #Enables Wayland support for QT
    programs.dconf.enable = true;
}
