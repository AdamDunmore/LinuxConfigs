{ pkgs, ... }:

let
    mod = "Mod4";
in
{
    wayland.windowManager.sway = {
        enable = true;
        config = {
            input = {
                "*" = {
                    xkb_layout = "gb";
                };

                "10182:480:GXTP7863:00_27C6:01E0_Touchpad" = {
                    natural_scroll = "enabled";
                    tap = "enabled";
                };
            };

            modes = {
                resize = {
                        Escape = "mode default";
                        Return = "mode default";
                        Up = "resize shrink height 20px";
                        Left = "resize shrink width 20px";
                        Down = "resize grow height 20px";
                        Right = "resize grow width 20px";

                };
            };

            startup = [
                { command = "${pkgs.ags}/bin/ags"; }
                { command = "${pkgs.wpaperd}/bin/wpaperd"; }
                { command = "${pkgs.kanshi}/bin/kanshi"; }

                { command = "${pkgs.swaysome}/bin/swaysome init 1"; }
            ];

            seat = {
            };

            keybindings = {
                "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
                "${mod}+Shift+Q" = "kill";
                "${mod}+D" = "exec ${pkgs.wofi}/bin/wofi";
                "${mod}+Shift+C" = "reload";
                "${mod}+l" = "exec ${pkgs.swaylock}/bin/swaylock";
                "${mod}+c" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\"";
                "${mod}+a" = "exec ${pkgs.ags}/bin/ags -t \"menu\"";

                #Modes
                "${mod}+R" = "mode \"resize\"";

                #Movements
                "${mod}+Left" = "focus Left";
                "${mod}+Down" = "focus Down";
                "${mod}+Up" = "focus Up";
                "${mod}+Right" = "focus Right";

                "${mod}+Shift+Left" = "move Left";
                "${mod}+Shift+Down" = "move Down";
                "${mod}+Shift+Up" = "move Up";
                "${mod}+Shift+Right" = "move Right";
                
                #Workspaces
                "${mod}+1" = "exec ${pkgs.swaysome}/bin/swaysome focus 1";
                "${mod}+2" = "exec ${pkgs.swaysome}/bin/swaysome focus 2";
                "${mod}+3" = "exec ${pkgs.swaysome}/bin/swaysome focus 3";
                "${mod}+4" = "exec ${pkgs.swaysome}/bin/swaysome focus 4";
                "${mod}+5" = "exec ${pkgs.swaysome}/bin/swaysome focus 5";
                "${mod}+6" = "exec ${pkgs.swaysome}/bin/swaysome focus 6";
                "${mod}+7" = "exec ${pkgs.swaysome}/bin/swaysome focus 7";
                "${mod}+8" = "exec ${pkgs.swaysome}/bin/swaysome focus 8";
                "${mod}+9" = "exec ${pkgs.swaysome}/bin/swaysome focus 9";

                "${mod}+Shift+1" = "exec ${pkgs.swaysome}/bin/swaysome move 1";
                "${mod}+Shift+2" = "exec ${pkgs.swaysome}/bin/swaysome move 2";
                "${mod}+Shift+3" = "exec ${pkgs.swaysome}/bin/swaysome move 3";
                "${mod}+Shift+4" = "exec ${pkgs.swaysome}/bin/swaysome move 4";
                "${mod}+Shift+5" = "exec ${pkgs.swaysome}/bin/swaysome move 5";
                "${mod}+Shift+6" = "exec ${pkgs.swaysome}/bin/swaysome move 6";
                "${mod}+Shift+7" = "exec ${pkgs.swaysome}/bin/swaysome move 7";
                "${mod}+Shift+8" = "exec ${pkgs.swaysome}/bin/swaysome move 8";
                "${mod}+Shift+9" = "exec ${pkgs.swaysome}/bin/swaysome move 9";

                "${mod}+h" = "splith";
                "${mod}+v" = "splitv";
                "${mod}+f" = "fullscreen";
                "${mod}+Shift+f" = "floating toggle";

                "${mod}+Shift+s" = "move scratchpad";
                "${mod}+s" = "scratchpad show";

                "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
                "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
                "XF86AudioMute" = "exec pactl set-sink-volume @DEFAULT_SINK@ 0%";
                "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
                "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
            };

            bars = [];

            gaps = {
                inner = 10;
                outer = 10;
            };


            window = {
                border = 3;
                titlebar = false;
            };

            colors = {
                unfocused = {
                    background = "2E3440FF";
                    border = "2E3440FF";
                    childBorder = "2E3440FF";
                    indicator = "000000";
                    text = "000000";
                };
                focused = {
                    background = "#4C566AFF";
                    border = "#4C566AFF";
                    childBorder = "#4C566AFF";
                    indicator = "000000";
                    text = "000000";
                };
            };

            floating = {
                modifier = "${mod}";
            };
        };
    };

    programs.swaylock = {
        enable = true;
        package = pkgs.swaylock-effects;
        settings = {
            ignore-empty-password = true;
            
            image = "../../wallpapers/wallpaper_nixos.png";

            clock = true;
            timestr = "%R";
            datestr = "%a, %e of %B";

            effect-blur="7x5";
            effect-vignette="0.5:0.5";

            line-color = "00000000";
            ring-color = "333355CC";
            key-hl-color = "555577EE";
            separator-color = "00000010";
            inside-color = "00000060";
            text-color = "FFFFFFAA";

            indicator = true;
            indicator-thickness = 15;
            indicator-radius = 150;
        };
    };
}
