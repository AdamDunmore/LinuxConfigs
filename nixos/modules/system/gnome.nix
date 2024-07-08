{ pkgs, ... }:

{
    services.xserver.desktopManager.gnome.enable = false;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gedit 
    ]) ++ (with pkgs.gnome; [
      gnome-music
      gnome-terminal
      epiphany 
      geary 
      evince 
      gnome-characters
      tali 
      iagno 
      hitori 
      atomix 
    ]);

    home-manager.users.adam = {
        dconf = {
            enable = false;
        };
    };

}
