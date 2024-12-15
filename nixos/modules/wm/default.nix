{ isHomeModule, ... }:

{
        imports = if isHomeModule then [
            # Bar/Widgets
            ./waybar.nix
            #./ags

            # App Menu
            ./wofi.nix
         
            # WM
            ./river.nix
            ./sway.nix
            #./hyprland.nix

            # Notifictions
            ./mako.nix

            #Enabled
            ./dconf.nix
            ./kanshi.nix
            ./theme.nix
            ./wpaperd.nix
        ] else [
            ./gnome.nix
            ./greetd
            ./kde.nix
        ];
}
