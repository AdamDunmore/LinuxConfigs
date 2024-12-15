{ lib, config, pkgs, ... }:

let 

colours = import ../../values/colours.nix;
cfg = config.adam.terminal.terminals.alacritty;

in
with lib;
{  
  options.adam.terminal.terminals.alacritty = {

  };
  
  config = mkIf cfg {
    programs.alacritty = {
        enable = true;
        settings = {
            terminal.shell = "${pkgs.zsh}/bin/zsh";
            colors = {
                primary = {
                    background = "${colours.blue.three}";
                    foreground = "${colours.white.one}";
                };
            };
            keyboard.bindings = [
                    { key = "N"; mods = "Control"; action = "ToggleFullscreen"; }
                    { key = "E"; mods = "Control"; command = "${pkgs.neovim}/bin/nvim"; }
            ];
        };
    };
  };
}
