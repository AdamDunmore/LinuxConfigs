{ isHomeModule, ... }:

{
    imports = if isHomeModule then [
        # Editor
        ./emacs
        ./nvim

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
