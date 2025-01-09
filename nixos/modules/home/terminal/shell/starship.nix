{ lib, config, ... }:

let
  cfg = config.adam.terminal.shell;
in
with lib;
{
  config = mkIf cfg {}
}
