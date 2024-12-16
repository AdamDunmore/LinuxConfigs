{ isHomeModule, ... }:

{
        imports = if isHomeModule then [
            # App Menu
            ./wofi.nix
         
            # WM
            ./river.nix
            ./sway.nix
            #./hyprland.nix

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
