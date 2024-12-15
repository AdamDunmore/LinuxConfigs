{ isHomeModule, ... }:

{
    imports = if isHomeModule then [
        # Terminal
        ./alacritty.nix
        #./kitty.nix

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
