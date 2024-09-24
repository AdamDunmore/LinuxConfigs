{ pkgs, inputs, ... }:

{
    wayland.windowManager.hyprland = {
        enabled = true;
    #     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #     settings = {
    #         "$mod" = "SUPER";
    #         bind = [
    #             "$mod, D, exec ${pkgs.wofi}/bin/wofi"
    #         ];
    #         exec = [
    #             "${pkgs.wpaperd}/bin/wpaperd"
    #         ];
    #     };
    };

    programs.hyprlock = {
        # enabled = false;
    };
}
