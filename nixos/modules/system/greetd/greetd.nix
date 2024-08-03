{ pkgs, ... }:

let
    agsConfig = pkgs.writeText "greeter.js" ''${builtins.readFile ./greeter.js}'';
    swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "${pkgs.ags}/bin/ags --config ${agsConfig}; swaymsg exit"
  '';
in
{
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.cage}/bin/cage -- ${pkgs.ags}/bin/ags --config ${agsConfig}";
            };
        };
    };
}
