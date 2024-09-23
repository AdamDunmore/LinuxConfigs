{ pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enabled = false;

        "$mod" = "SUPER";

        bind = [
            "$mod, D, exec ${pkgs.wofi}/bin/wofi"
        ];
    };

    programs.hyprlock = {
        enabled = false;
    };
}
