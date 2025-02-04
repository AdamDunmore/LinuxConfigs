{ lib, config, pkgs, ... }:

let
  cfg = config.adam.terminal.shell.zellij;
in
with lib;
{
    config = mkIf cfg {
        programs.zellij = {
            enable = true;
            settings = {
                default_shell = "${pkgs.zsh}/bin/zsh";
            };
        };
        xdg.configFile."zellij/config.kdl".text = ''
            keybinds clear-defaults=true{
                shared {
                    bind "Alt r" { SwitchToMode "Normal"; }
                    bind "Alt l" { SwitchToMode "Locked"; }
                }

                normal {
                    bind "i" { SwitchToMode "Locked"; }
                    bind "n" { NewPane "Right"; }
                    bind "x" { CloseFocus; }
                    bind "f" { ToggleFocusFullscreen; }
                    bind "e" { Quit; }
                }

                locked {
                    bind "Esc" { SwitchToMode "Normal"; }
                }
            }
        '';
    };
}
