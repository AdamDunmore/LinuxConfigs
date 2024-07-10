{
    boot.loader = {
    efi.canTouchEfiVariables = true; 	
    grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiInstallAsRemovable = false;
        efiSupport = true;
        splashImage = ../../../wallpapers/wallpaper_nixos.png;
    };
    systemd-boot.enable = false;   
};
}
