{ pkgs, pkgs-unstable, ... }:

{
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
        legcord
        piper
        beeper
        syncthing
        logisim-evolution
        godot_4
        distrobox
        parsec-bin
        kdePackages.kdeconnect-kde

        git
        git-credential-manager
         
        # Terminal Emulator
        alacritty
        zellij
        zsh
        zsh-autocomplete
        zsh-syntax-highlighting
        zsh-autosuggestions
        lsd
        bat
        starship

        # Language Servers
        nil
        nodePackages_latest.typescript-language-server
        
        # Sway
        swayfx
        wl-clipboard
        swaylock-effects
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

        wineWowPackages.stable
        winetricks
        gamescope
        vulkan-tools
        steamtinkerlaunch
    ])

    ++

    (with pkgs-unstable; [
        #Unstable Packages
        neovim
    ]);
}
