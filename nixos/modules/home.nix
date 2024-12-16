{ pkgs, inputs, ... }:

let

core = import ../values/core.nix;

in
{ 
    home.username = core.user;
    home.homeDirectory = "/home/${core.user}";
    home.stateVersion = "${core.version}";

    programs.home-manager.enable = true;

    imports = [
        ( import ./apps { isHomeModule = true; inherit inputs; inherit pkgs; } )
        ( import ./terminal { isHomeModule = true; inherit inputs; } )
        ( import ./wm { isHomeModule = true; inherit inputs; } )

        ./home
    ];

    adam = {
      enable = true;
      terminal = {
        editors = {
          default = "${pkgs.emacs}/bin/emacs";
          emacs = true;
        };
        terminals = {
          default = "${pkgs.alacritty}/bin/alacritty";
          alacritty = true;
        };
      };
      wm.widgets = {
        mako = true;
        waybar = true;
        wofi = true;
      };
    };
}




