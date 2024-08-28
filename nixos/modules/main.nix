{ pkgs, ... }:

let

core = import ../values/core.nix;

in

{

    imports = [
        ./system/audio.nix
        ./system/bluetooth.nix
        ./system/bootloader.nix
        ./system/greetd/greetd.nix
        ./system/gnome.nix
        ./system/kde.nix
        ./system/keyboard.nix
        # ./system/syncthing.nix
        ./system/timezone.nix
        ./system/users.nix
        ./system/virtualbox.nix
    ];


    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Downloading Nerd Font
    fonts.packages = with pkgs; [
	    (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
    ];

    #Enabling Programs
    programs = {
        steam.enable = true;
        river.enable = true;
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

    # Enable Waydroid
    virtualisation.waydroid.enable = true;

    # Dotnet location fix
    environment.sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_7}";
    };
}
