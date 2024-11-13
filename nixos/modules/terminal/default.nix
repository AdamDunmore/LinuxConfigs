{ isHomeModule, ... }:

{
    imports = if isHomeModule then [
        ./alacritty.nix
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
