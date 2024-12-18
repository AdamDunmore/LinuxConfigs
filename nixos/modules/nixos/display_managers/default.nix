{ lib, config, pkgs, ... }:

with lib;
{
  imports = [
    ./greetd
    ./ly.nix
    ./sddm.nix
  ];

  config = mkMerge [
    ({ services.displayManager.sessionPackages = [ pkgs.swayfx pkgs.hyprland pkgs.river ]; })
    # ({ services.displayManager.defaultSession = ""; })
  ];
}
