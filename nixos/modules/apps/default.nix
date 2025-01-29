{ isHomeModule, inputs ? null, pkgs ? null, ... }:

{
    imports = if isHomeModule then [
        ./apps.nix
        ./code.nix
        ./flatpak.nix
        (import ./spicetify.nix { inherit inputs; inherit pkgs; })
    ] else [
        # ./steam.nix
        # ./virtualbox.nix
    ];
}
