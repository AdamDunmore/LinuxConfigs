{ isHomeModule, ... }: 

{
    imports = if isHomeModule then [

    ] else [
        ./audio.nix
        ./bluetooth.nix
        ./bootloader.nix
        ./keyboard.nix
        ./misc.nix
        ./timezone.nix
        ./users.nix
    ]; 
}
