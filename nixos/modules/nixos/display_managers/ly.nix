{ config, lib, pkgs, ... }:

let
  cfg = config.adam.display_managers.ly;
in
with lib;
{
  config = mkIf cfg { 
    services.displayManager.ly = {
      enable = true;
      package = pkgs.ly;
      settings = {
        tty = 1; 
      };
    };
  };
}
