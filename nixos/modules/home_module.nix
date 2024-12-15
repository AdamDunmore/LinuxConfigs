{ lib, config, ... }:

let
  cfg = config.adam;
in
with lib;
{
  imports = [
    ./terminal/terminals.nix
  ];

    options.adam = {
        enable = mkEnableOption "Enable Config";
    };
}
