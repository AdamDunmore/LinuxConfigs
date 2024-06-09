{ config, lib, pkgs, pkgs-unstable, hyprland, spicetify-nix, inputs, ... }:

let
in
{
  imports = [
    (import ./configs/hyprland.nix { inherit pkgs; inherit hyprland; inherit inputs;}) 
    ./configs/kitty.nix
    ./configs/zsh.nix
    (import ./configs/spicetify.nix { inherit pkgs; inherit spicetify-nix; })
  ];

  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.packages = (with pkgs; [
    #Stable Packages
    spicetify-cli
    scanmem
    brave
    firefox
    vscode
    logseq
    lutris
    discord
    heroic
    prismlauncher
    motrix
    android-studio
  ])

  ++

  (with pkgs-unstable; [
    #Unstable Packages
    zed-editor
    neovim
    vesktop
    parsec-bin
  ]);
}

