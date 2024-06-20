{
    boot.loader = {
    efi.canTouchEfiVariables = true; 	
    grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiInstallAsRemovable = false;
        efiSupport = true;
        splashImage = /home/adam/Pictures/wallpaper.png;
    };
    systemd-boot.enable = false;   
};
}
