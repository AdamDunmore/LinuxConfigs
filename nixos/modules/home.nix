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
        ( import ./wm { isHomeModule = true; inherit inputs; } )

        ./home
    ];


    adam = {
      enable = true;
      scripts = true;
      terminal = {
        editors = {
          default = "${pkgs.neovim}/bin/nvim";
          emacs = true;
          nvim = true;
        };
        shell = true;
        terminals = {
          default = "${pkgs.alacritty}/bin/alacritty";
          alacritty = true;
        };
      };
      wm = {
        widgets = {
          mako = true;
          waybar = true;
          wofi = true;
        };
        window_managers = {
          default = "${pkgs.swayfx}/bin/sway";
          default_locker = "${pkgs.hyprlock}/bin/hyprlock";
          sway.enable = true;
          hyprland.hyprlock = true;
        };
      };
    };
}
