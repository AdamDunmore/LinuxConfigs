{ lib, config, ... }:

let
  cfg = config.adam.keyboard;
in
with lib;
{
  config = mkIf cfg.enable {
    console.keyMap = "uk";

    services.xserver = {
        xkb = {
            variant = "";
            layout = "gb";
        };
        enable = true;
    };
  }; 
}
