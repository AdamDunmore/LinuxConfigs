{ isHomeModule, ... }:

{
        imports = if isHomeModule then [
            #Enabled
            ./dconf.nix
            ./kanshi.nix
            ./theme.nix
            ./wpaperd.nix
        ] else [
            ./gnome.nix
            ./kde.nix
        ];
}
