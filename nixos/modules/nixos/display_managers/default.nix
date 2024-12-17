{ lib, config, pkgs, ... }:

with lib;
{
  imports = [
    ./ly.nix
  ];

  config = mkMerge [
    (mkIf config.adam.wm.window_managers.sway.enable { services.displayManager.sessionPackages = [ pkgs.swayfx ]; })
  ];
}
