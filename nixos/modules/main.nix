{ pkgs, ... }:

let

core = import ../values/core.nix;

in

{
    imports = [
        (import ./apps { isHomeModule = false; })
        (import ./system { isHomeModule = false; }) 
        (import ./wm { isHomeModule = false; })

        ./nixos
    ];

    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    adam = {
        display_managers.greetd = true;
        services.syncthing = false;
        keyboard = {
            enable = true;
            custom_layout = true;
        };
    };
}
