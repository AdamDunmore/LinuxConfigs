let

core = ../../values/core.nix;

in

{
    boot.loader = {
        efi.canTouchEfiVariables = true;
        timeout = 3;
        grub = {
            enable = true;
            backgroundColor = "#2E3440";
            device = "nodev";
            useOSProber = true;
            efiInstallAsRemovable = false;
            efiSupport = true;
        };
        systemd-boot.enable = false;   
    };
}
