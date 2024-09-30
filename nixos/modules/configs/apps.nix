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
        armcord
        piper
        beeper
        syncthing
        logisim-evolution
        godot_4

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
        gnome.nautilus
        gnome.eog
        gnome.file-roller
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
        dotnet-sdk_7 

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
}
