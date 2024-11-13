{ isHomeModule, ... }:

{
        imports = if isHomeModule then [
            ./ags
            ./dconf.nix
            ./hyprland.nix
            ./kanshi.nix
            ./mako.nix
            ./river.nix
            ./sway.nix
            ./theme.nix
            ./wofi.nix
            ./wpaperd.nix
        ] else [
            ./gnome.nix
            ./greetd
            ./kde.nix
        ];
}
