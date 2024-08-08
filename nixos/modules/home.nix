{ config, lib, pkgs, pkgs-unstable, spicetify-nix, inputs, ... }:

let
in
{
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
        heroic
        motrix
        prismlauncher
        android-studio
        protonvpn-gui
        arduino-ide
        obs-studio
        thonny
        bottles
        tor-browser
        armcord
        piper
        beeper

        git
         
        # Terminal Emulator
        alacritty
        zellij
        zsh
        zsh-autocomplete
        zsh-syntax-highlighting
        zsh-autosuggestions

        # Sway
        wl-clipboard
        swaylock-effects
        swaysome
        ags
        grim
        slurp
        wpaperd
        wofi
        kanshi

        # Gnome
        gnome.nautilus
        gnome.eog
        gnome.file-roller
        gnome.seahorse
        gnome.gnome-system-monitor
        gnome.gnome-calculator
        gnome.gnome-settings-daemon

        p7zip
        networkmanager
        brightnessctl
        blueman 
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
        rshell
        zulu8
        geckodriver
        libratbag
        yad

        wineWowPackages.stable
        #winwWowPackages.waylandFull #Unstable
        winetricks
        gamescope
        vulkan-tools
        steamtinkerlaunch
    ])

    ++

    (with pkgs-unstable; [
        #Unstable Packages
        zed-editor
        neovim
        parsec-bin
    ]);

    imports = [
        ./configs/alacritty.nix
        ./configs/dconf.nix
        ./configs/kanshi.nix
        ./configs/river.nix
        (import ./configs/spicetify.nix { inherit pkgs; inherit spicetify-nix; })
        ./configs/sway.nix
        ./configs/theme.nix
        ./configs/wofi.nix
        ./configs/wpaperd.nix
        ./configs/zsh.nix
    ];
}




