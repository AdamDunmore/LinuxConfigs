{ isHomeModule, ... }: 

{
    imports = if isHomeModule then [

    ] else [
        ./audio.nix
        ./blueooth.nix
        ./bootloader.nix
        ./keyboard.nix
        ./misc.nix
        ./syncthing.nix
        ./timezone.nix
        ./users.nix
    ]; 
}
