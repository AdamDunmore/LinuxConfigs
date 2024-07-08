{ pkgs, ... }:

{
    services.desktopManager.plasma6.enable = false;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
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
