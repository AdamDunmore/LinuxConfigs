{
    boot.loader = {
        efi.canTouchEfiVariables = true; 	
        grub = {
            enable = true;
            backgroundColor = "#2E3440";
            timeout = 3;
            device = "nodev";
            useOSProber = true;
            efiInstallAsRemovable = false;
            efiSupport = true;
            splashImage = ../../../wallpapers/wallpaper_nixos.png;
        };
        systemd-boot.enable = false;   
    };
}
