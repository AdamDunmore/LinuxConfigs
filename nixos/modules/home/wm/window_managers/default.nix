{ lib, config, pkgs, ...}:

let
  cfg = config.adam.wm.window_managers;
in
with lib;
{
  imports = [
    ./hyprland.nix
    ./river.nix
    ./sway.nix
  ];

  options.adam.wm.window_managers = {
    default = mkOption {
      type = types.str;
      default = "${pkgs.i3}/bin/i3";
      example = "\${pkgs.i3}/bin/i3";
      description = "The binary for your default Window Manager/Compositor";
      
    };
    default_locker = mkOption {
      type = types.str;
      default = "${pkgs.swaylock}/bin/swaylock";
      example = "\${pkgs.swaylock}/bin/swaylock";
      description = "The binary for your default Wayland locker";
    }; 
  };

  config = mkMerge [
    { home.sessionVariables = {
        ADAM_WM = cfg.default;
        ADAM_LOCKER = cfg.default_locker;
    };}
  ]; 
}
