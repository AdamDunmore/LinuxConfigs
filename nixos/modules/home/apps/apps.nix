{ pkgs, pkgs-unstable, config, lib, ... }:

let
    cfg = config.adam.apps;
in
with lib;
{
    config = mkMerge [
        (mkIf (cfg.all) {
            home.packages = (with pkgs; [
                scanmem
                lutris
                heroic
                prismlauncher
                android-studio
                arduino-ide
                obs-studio
                godot_4
                distrobox
                parsec-bin
            ]);
        })

        (mkIf (cfg.light || cfg.all) {
            home.packages = (with pkgs; [
                spicetify-cli
                brave
                firefox
                vscode
                logseq
                motrix
                protonvpn-gui
                thonny
                bottles
                tor-browser
                beeper
                syncthing
                kdePackages.kdeconnect-kde
                steam


                # Sway
                wl-clipboard
                swaysome
                ags
                grim
                slurp
                wpaperd
                wofi
                kanshi
                xdg-desktop-portal

                # Gnome
                nautilus
                eog
                file-roller
                gnome-system-monitor
                gnome-calculator
                gnome-settings-daemon


                wineWowPackages.stable
                winetricks
                gamescope
                vulkan-tools
                steamtinkerlaunch
            ])

            ++

            (with pkgs-unstable; [
                #Unstable Packages
                discord
            ]);
        })


        (mkIf (cfg.minimal || cfg.light || cfg.all) {
            home.packages = (with pkgs; [
                #Stable Packages
                git
                git-credential-manager
                 
                # Terminal Emulator
                zsh
                zsh-autocomplete
                zsh-syntax-highlighting
                zsh-autosuggestions
                lsd
                bat
                starship

                # Language Servers
                rust-analyzer
                nil
                nodePackages_latest.typescript-language-server
                jdt-language-server
                pyright
                lua-language-server
                vscode-langservers-extracted
                bash-language-server
                clang-tools
            
                p7zip
                networkmanager
                brightnessctl
                typescript
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
                dotnet-sdk_9 
                htop
                fzf
            ])

            ++

            (with pkgs-unstable; [
                #Unstable Packages
                neovim
            ]);
        })
    ];
}
