{ lib, config, ... }:

let
  cfg = config.adam.keyboard;
in
with lib;
{
    config = mkIf cfg.custom_layout {
        services.keyd = {
            enable = true;
            keyboards.default.settings = {
                main = {
                    capslock = "layer(renamed)";
                };
                renamed = {
                    esc = "`"; 
                    z = "102nd";
                    #p = "marco(G-102nd space)";
                };
            };
        };   
    };
}
