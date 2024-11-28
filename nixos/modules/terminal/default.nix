{ isHomeModule, ... }:

{
    imports = if isHomeModule then [
        ./alacritty.nix
        ./emacs
        ./git.nix
        ./kitty.nix
        ./lsd.nix
        ./nvim
        ./starship.nix
        ./yazi.nix
        ./zsh.nix
    ] else [
    
    ];
}
