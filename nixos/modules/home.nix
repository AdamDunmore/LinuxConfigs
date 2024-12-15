{ lib, config, pkgs, inputs, ... }:

let

core = import ../values/core.nix;
cfg = config.adam;

in
with lib;
{ 
    home.username = core.user;
    home.homeDirectory = "/home/${core.user}";
    home.stateVersion = "${core.version}";

    programs.home-manager.enable = true;

    imports = [
        ( import ./apps { isHomeModule = true; inherit inputs; inherit pkgs; } )
        ( import ./terminal { isHomeModule = true; inherit inputs; } )
        ( import ./wm { isHomeModule = true; inherit inputs; } )

        ./home_module.nix
    ];

    adam = {
      enable = true;
      terminal.terminals.alacritty = true;
    };
}




