{ isHomeModule, ... }:

{
    imports = if isHomeModule then [
        # Shell
        ./zsh.nix

        # Enabled
        ./git.nix
        ./lsd.nix
        ./starship.nix
        ./yazi.nix
    ] else [
    
    ];
}
