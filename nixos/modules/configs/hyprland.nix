{ pkgs, hyprland, inputs, ... }:

{
        wayland.windowManager.hyprland = {
            enable = true;
            package = hyprland.packages.${pkgs.system}.hyprland;
            plugins = [
                #inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
            ];
            settings = {
                "$mod" = "SUPER";

                bind = 
                [
                    "$mod, T, exec, kitty echo '${builtins.getEnv "hostname"}'"

                    "$mod, D, exec,  wofi --show drun --allow-images -a --height 300 --width 600"
                    "$mod, Return, exec, kitty"
                    "$mod SHIFT, Q, killactive,"

                    "$mod, F, fullscreen,"
                    "$mod, P, pseudo,"
                    "$mod, J, togglesplit,"

                    "$mod, left, movefocus, l"
                    "$mod, right, movefocus, r"
                    "$mod, up, movefocus, u"
                    "$mod, down, movefocus, d"

                    "$mod SHIFT, left, movewindow, l"
                    "$mod SHIFT, right, movewindow, r"
                    "$mod SHIFT, up, movewindow, u"
                    "$mod SHIFT, down, movewindow, d" 



                    "$mod, 1, split-workspace, 1"
                    "$mod, 2, split-workspace, 2"
                    "$mod, 3, split-workspace, 3"
                    "$mod, 4, split-workspace, 4"
                    "$mod, 5, split-workspace, 5"
                    "$mod, 6, split-workspace, 6"
                    "$mod, 7, split-workspace, 7"
                    "$mod, 8, split-workspace, 8"
                    "$mod, 9, split-workspace, 9"
                    "$mod, 0, split-workspace, 10"

                    "$mod SHIFT, 1, split-movetoworkspacesilent , 1"
                    "$mod SHIFT, 2, split-movetoworkspacesilent , 2"
                    "$mod SHIFT, 3, split-movetoworkspacesilent , 3"
                    "$mod SHIFT, 4, split-movetoworkspacesilent , 4"
                    "$mod SHIFT, 5, split-movetoworkspacesilent , 5"
                    "$mod SHIFT, 6, split-movetoworkspacesilent , 6"
                    "$mod SHIFT, 7, split-movetoworkspacesilent , 7"
                    "$mod SHIFT, 8, split-movetoworkspacesilent , 8"
                    "$mod SHIFT, 9, split-movetoworkspacesilent , 9"
                    "$mod SHIFT, 0, split-movetoworkspacesilent , 10"


                    "$mod, S, togglespecialworkspace, magic"
                    "$mod SHIFT, S, movetoworkspace, special:magic"


                    ",XF86AudioRaiseVolume, exec, ~/.config/eww/scripts/change_volume.sh +"
                    ",XF86AudioLowerVolume, exec, ~/.config/eww/scripts/change_volume.sh -"
                    ",XF86AudioMute, exec, ~/.config/eww/scripts/change_volume.sh /"

                    ",XF86MonBrightnessUp, exec, ~/.config/eww/scripts/change_brightness.sh +"
                    ",XF86MonBrightnessDown, exec, ~/.config/eww/scripts/change_brightness.sh -"
                ];
            };  
            extraConfig = "
                #Laptop
                monitor=eDP-1,1920x1080,0x0,1

                #Desktop
                monitor=DP-1,1920x1080,0x0,1
                monitor=DP-3, 1920x1080, 1920x0, 1
                monitor=HDMI-A-1, 1920x1080, 3840x0, 1

                #Misc
                monitor=,1920x1080,auto,1

                exec-once = ~/.config/eww/scripts/open.sh
                exec-once = hyprpaper

                env = XCURSOR_SIZE,24

                input {
                    kb_layout = gb
                    kb_variant =
                    kb_model =
                    kb_options =
                    kb_rules =

                    follow_mouse = 1

                    touchpad {
                        natural_scroll = no
                    }

                    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
                }

                general {
                    # See https://wiki.hyprland.org/Configuring/Variables/ for more

                    gaps_in = 10
                    gaps_out = 10
                    border_size = 1
                    col.active_border = rgba(666688ff) 45deg
                    col.inactive_border = rgba(000000ff)

                    layout = dwindle

                    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
                    allow_tearing = false
                }

                decoration {
                    # See https://wiki.hyprland.org/Configuring/Variables/ for more

                    rounding = 10

                    active_opacity = 0.94
                    inactive_opacity = 0.87
                    fullscreen_opacity = 1.0
                    
                    blur {
                        enabled = true
                        size = 8
                        passes = 1
                    }

                    drop_shadow = yes
                    shadow_range = 4
                    shadow_render_power = 3
                    col.shadow = rgba(1a1a1aee)
                }

                animations {
                    enabled = yes

                    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

                    animation = windows, 1, 7, myBezier
                    animation = windowsOut, 1, 7, default, popin 80%
                    animation = border, 1, 10, default
                    animation = borderangle, 1, 8, default
                    animation = fade, 1, 7, default
                    animation = workspaces, 1, 6, default
                }

                dwindle {
                    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
                    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                    preserve_split = yes # you probably want this
                }

                master {
                    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                    new_is_master = true
                }

                gestures {
                    # See https://wiki.hyprland.org/Configuring/Variables/ for more
                    workspace_swipe = on
                }

                misc {

                }
                # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
                device {
                    name = epic-mouse-v1
                    sensitivity = -0.5
                }

                plugin {
                    #split-monitor-workspaces {
                    #    count = 5
                    #    keep_focused = 0
                    #    enable_notifications = 0
                    #}
                }
        ";
        };
}
