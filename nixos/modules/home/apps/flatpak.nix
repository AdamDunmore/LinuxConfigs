
{ config, lib, ... }:

let
    cfg = config.adam.apps;
in
with lib;
{
    config = mkIf (cfg.light || cfg.all) {
        services.flatpak = {
            enable = true;
            packages = [
                "io.github.zen_browser.zen"
            ];
        };
    };
}
