{ lib, config, ... }:

let
  cfg = config.adam;
in
with lib;
{
  imports = [
    ./terminal/editors.nix
    ./terminal/terminals.nix
    ./wm/widgets.nix
  ];

    options.adam = {
        enable = mkEnableOption "Enable Config";
    };
}
