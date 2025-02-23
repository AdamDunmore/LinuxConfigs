{ lib, config, pkgs, ...}:

let
  cfg = config.adam.wm.window_managers;
in
with lib;
{
  imports = [
    ./hyprland.nix
    ./river.nix
    ./sway.nix
  ];

  config = mkMerge [
    { home.sessionVariables = {
        ADAM_WM = cfg.default;
        ADAM_LOCKER = cfg.default_locker;
    };}

    (
        mkIf (cfg.sway.enable || cfg.river.enable || cfg.hyprland.enable) {
            home.packages = with pkgs; [
                wl-clipboard
                swaysome
                ags
                grim
                slurp
                wpaperd
                wofi
                kanshi
                xdg-desktop-portal
            ];
        } 
    )
  ]; 
}
