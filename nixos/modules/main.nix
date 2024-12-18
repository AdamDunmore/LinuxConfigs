{ pkgs, ... }:

let

core = import ../values/core.nix;

in

{
    imports = [
        (import ./apps { isHomeModule = false; })
        (import ./system { isHomeModule = false; }) 
        (import ./wm { isHomeModule = false; })

        ./nixos
    ];

    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    adam.display_managers.greetd = true;

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
