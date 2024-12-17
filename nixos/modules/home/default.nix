{ lib, config, ... }:

let
  cfg = config.adam;
in
with lib;
{
  imports = [
    ../common.nix
    
    ./terminal
    ./wm
  ];
}