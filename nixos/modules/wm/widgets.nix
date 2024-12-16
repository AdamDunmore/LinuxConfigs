{ lib, config, pkgs, ... }:

let
  cfg = config.adam.wm.widgets;
  colours = import ../../values/colours.nix;
  font = import ../../values/font.nix;

  waybarConfig = {
      enable = true;
      settings = {
        mainBar = {
            layer = "top";
            position = "top";
            height = 30;
            # margin-top = 20;
            # margin-left = 100;
            # margin-right = 100;
            margin-bottom = 10;
            spacing = 30;
            # output = [

            # ];

            modules-left = [ "sway/workspaces" ];
            modules-center = [ "clock" "clock#date" ];
            modules-right = [ "backlight" "pulseaudio" "battery" "network" ];

            "backlight" = {
              format = "󰃠    {percent}%";
            };

            "pulseaudio" = {
              format = "   {volume}%";
            };

            "battery" = {
                format = "    {capacity}%";
            };

            "network" = {
              format-wifi = "i    {signalStrength}%";
            };

            "clock" = {
              format = "{:%H:%M}";
            };
            "clock#date" = {
              format = "{:%A, %d %b %Y} ";
            };
        };
      };
      style = ''
            #workspaces button.focused {
                        background-color: ${colours.blue.two};
            }
      '';
    };    
  makoConfig = {
        enable = true;
        actions = true; # Disable if notifications open apps
        anchor = "top-right";
        backgroundColor = "${colours.blue.one}DD";
        borderColor = "${colours.blue.two}FF";
        borderRadius = 30;
        borderSize = 2;
        defaultTimeout = 3000;
        font = "${font.name} 12";
        height = 100;
        icons = true;
        ignoreTimeout = true;
        layer = "top";
        margin = "10,10,10,10";
        maxIconSize = 64;
        maxVisible = 3;
        padding = "5,5,5,5";
        sort = "-time";
        textColor = "${colours.white.one}";
        width = 300;
    };


in
with lib;
{
  imports = [];

  options.adam.wm.widgets = {
    ags = {
      enable = mkEnableOption "Enable Ags"; #TODO: Divide into modules
    };
    waybar = mkEnableOption "Enable Waybar";
    mako = mkEnableOption "Enable Mako";
  };

  config = mkMerge [
    (mkIf cfg.ags.enable {
        home.file = {
            ".config/ags" = {
                source = ./ags;
            }; 
        };
    })
    (mkIf cfg.waybar { programs.waybar = waybarConfig; })
    (mkIf cfg.mako { services.mako = makoConfig; })
  ];
}
