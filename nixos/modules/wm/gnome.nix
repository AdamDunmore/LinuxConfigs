{ pkgs, ... }:

{
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gedit 
    ]) ++ (with pkgs; [
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
      seahorse
    ]);
}
