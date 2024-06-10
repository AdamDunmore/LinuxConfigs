{ config, lib, pkgs, pkgs-unstable, spicetify-nix, inputs, ... }:

let
in
{
  imports = [
    ./configs/kitty.nix
    ./configs/zsh.nix
    (import ./configs/spicetify.nix { inherit pkgs; inherit spicetify-nix; })
  ];

  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "24.05";

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

    git
        
    zsh
    zsh-autocomplete
    zsh-syntax-highlighting
    zsh-autosuggestions

    wl-clipboard
    mako
    swaylock-effects
    swaysome
    waybar
    eww
    ags
    wofi
    kitty

    sddm

    networkmanager
    brightnessctl
    blueman #Bluetooth
    bluez
    zip
    unzip
    pulseaudio
    killall
    pkg-config
    pango
    nodejs_22
    libgccjit
    cargo
    home-manager
    sops
    tree-sitter
    wget
    fd
    ripgrep
    jq
    python3
    grim
    slurp

    wineWowPackages.stable
    winetricks
    gamescope
    vulkan-tools
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

