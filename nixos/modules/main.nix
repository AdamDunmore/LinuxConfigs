let

core = import ../values/core.nix;

in

{
    imports = [
        ./system/audio.nix
        ./system/bluetooth.nix
        ./system/bootloader.nix
        ./system/keyboard.nix
        ./system/misc.nix
        ./system/syncthing.nix
        ./system/timezone.nix
        ./system/users.nix

        (import ./apps { isHomeModule = false; })
        (import ./system { isHomeModule = false; }) 
        (import ./wm { isHomeModule = false; })
    ];

    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
