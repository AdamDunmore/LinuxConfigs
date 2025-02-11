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
                rshell
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
            
                # Tools
                p7zip
                networkmanager
                brightnessctl
                blueman 
                bluez
                zip
                unzip
                killall
                htop
                wget
                fd
                ripgrep
                jq
                fzf
                home-manager
                sops
                pulseaudio

                # Languages
                typescript
                dotnet-sdk_9 
                zig
                zulu8
                libgccjit
                cargo
                nodejs_22
                dart

                #Libs
                tree-sitter
                geckodriver
                libratbag
                yad
                python3
                pkg-config
                pango
                binutils
            ])

            ++

            (with pkgs-unstable; [
                #Unstable Packages
            ]);
        })
    ];
}
