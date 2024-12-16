{ isHomeModule, ... }:

{
        imports = if isHomeModule then [
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
