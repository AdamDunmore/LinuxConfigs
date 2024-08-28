{ pkgs, pkgs-unstable, inputs, ... }:

let

core = import ../values/core.nix;

in
{
    home.username = core.user;
    home.homeDirectory = "/home/${core.user}";
    home.stateVersion = "${core.version}";

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
        syncthing

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
        dotnet-runtime_8

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
        ./configs/code.nix
        ./configs/dconf.nix
        ./configs/kanshi.nix
        ./configs/lsd.nix
        ./configs/river.nix
        (import ./configs/spicetify.nix { inherit inputs; inherit pkgs; })
        ./configs/starship.nix
        ./configs/sway.nix
        ./configs/theme.nix
        ./configs/wofi.nix
        ./configs/wpaperd.nix
        ./configs/zsh.nix
    ];

    #Git credential helper setup
    programs.git = {
        enable = true;
        userName = "Adam Dunmore";
        userEmail = "adamfdunmore@gmail.com";
        extraConfig = {
            credential.helper = "${
                pkgs.git.override { withLibsecret = true; }
            }/bin/git-credential-libsecret";
        };
    };
}




