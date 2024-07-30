{ pkgs, ... }:

{

    imports = [
        ./system/audio.nix
        ./system/bluetooth.nix
        ./system/bootloader.nix
        ./system/greetd/greetd.nix
        ./system/gnome.nix
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

    # Enable VirtualBox TODO: Move to own file
    virtualisation.virtualbox = {
        host.enable = true;
        guest = {
            enable = true;
            draganddrop = true;
        };
    };
    users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

    # Enable Waydroid
    virtualisation.waydroid.enable = true;
}
