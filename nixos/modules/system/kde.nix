{ pkgs, ... }:

{
    #services.desktopManager.plasma6.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
    environment.plasma5.excludePackages = with pkgs.kdePackages; [
        konsole
        kate
        elisa
        okular
        kwalletmanager
        dolphin
        gwenview
        ark
        ksystemstats
    ];
}
