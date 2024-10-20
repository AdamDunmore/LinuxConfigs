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
        ./system/misc.nix
        ./system/steam.nix
        ./system/syncthing.nix
        ./system/timezone.nix
        ./system/users.nix
        ./system/virtualbox.nix

    ];

    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
