{ lib, config, ... }:

let
  cfg = config.adam;
in
with lib;
{
  imports = [
    ./terminal
    ./wm
  ];

    options.adam = {
        enable = mkEnableOption "Enable Config";
    };
}
