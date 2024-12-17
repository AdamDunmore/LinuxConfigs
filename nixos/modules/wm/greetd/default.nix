{ pkgs, ... }:

let
    agsConfig = pkgs.writeText "greeter.js" ''${builtins.readFile ./greeter.js}'';
    swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "${pkgs.ags}/bin/ags --config ${agsConfig}; swaymsg exit"
  '';

    cageCommand = "${pkgs.cage}/bin/cage -s -- ${pkgs.ags}/bin/ags --config ${agsConfig}";
    swayCommand = "${pkgs.swayfx}/bin/sway --config ${swayConfig}"; # Doesn't work
in
{
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${cageCommand}";
            };
        };
    };
}
