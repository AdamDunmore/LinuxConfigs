{ pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mod" = "SUPER";
            bind = [
                "$mod, Return, exec, ${pkgs.alacritty}/bin/alacritty"
                "$mod, D, exec, ${pkgs.wofi}/bin/wofi"

                "$mod, F, fullscreen, active"
                "$mod_SHIFT, f, togglefloating, active"

                "$mod_SHIFT, Q, killactive"
                "$mod, H, togglesplit,"
                "$mod_SHIFT, C, exec, hyprctl reload"
                "$mod, L, exec, ${pkgs.swaylock}/bin/swaylock -C ~/.config/swaylock/config"
                "$mod, C, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\""
                "$mod, A, exec, ${pkgs.ags}/bin/ags -t \"menu\""

                "$mod, S, togglespecialworkspace, magic"
                "$mod_SHIFT, S, movetoworkspace, special:magic"

                "$mod, left, movefocus, l"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"
                "$mod, right, movefocus, r"

                "$mod_SHIFT, left, movewindow, l"
                "$mod_SHIFT, up, movewindow, u"
                "$mod_SHIFT, down, movewindow, c"
                "$mod_SHIFT, right, movewindow, r"

                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"

                "$mod_SHIFT, 1, movetoworkspace, 1"
                "$mod_SHIFT, 2, movetoworkspace, 2"
                "$mod_SHIFT, 3, movetoworkspace, 3"
                "$mod_SHIFT, 4, movetoworkspace, 4"
                "$mod_SHIFT, 5, movetoworkspace, 5"
                "$mod_SHIFT, 6, movetoworkspace, 6"
                "$mod_SHIFT, 7, movetoworkspace, 7"
                "$mod_SHIFT, 8, movetoworkspace, 8"
                "$mod_SHIFT, 9, movetoworkspace, 9"

                ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
                ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
                ", XF86AudioMute, exec, pactl set-sink-volume @DEFAULT_SINK@ 0%"
                ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
                ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
            ];
            exec = [
                "${pkgs.wpaperd}/bin/wpaperd"
                "${pkgs.ags}/bin/ags"
                "${pkgs.kanshi}/bin/kanshi"
            ];
            general = {
                gaps_in = 5;
                gaps_out = 20;

                border_size = 2;

                resize_on_border = true;
                layout = "dwindle";

                monitor = [
                    ",preferred,auto,1"
                ];
            };
            decoration = {
                rounding = 5;
                
                active_opacity = 1.0;
                inactive_opacity = 0.8;
            };
            input = {
                kb_layout = "gb";
                touchpad = {
                    natural_scroll = true;
                };
            };
            gestures = {
                workspace_swipe = true;
                workspace_swipe_fingers = 3;
            };
        };
    };

    programs.hyprlock = {
        # enable = false;
    };
}
