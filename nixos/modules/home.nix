{ config, lib, pkgs, pkgs-unstable, spicetify-nix, inputs, ... }:

let
in
{
  imports = [
    ./configs/theme.nix
    ./configs/kitty.nix
    ./configs/zsh.nix
    ./configs/zellij.nix
    ./configs/alacritty.nix
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
    gnome.nautilus
    gnome.eog

    git
      
    alacritty
    zellij
    zsh
    zsh-autocomplete
    zsh-syntax-highlighting
    zsh-autosuggestions

    wl-clipboard
    swaylock-effects
    swaysome
    ags
    grim
    slurp

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
    obs-studio

    wineWowPackages.stable
    #winwWowPackages.waylandFull #Unstable
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

