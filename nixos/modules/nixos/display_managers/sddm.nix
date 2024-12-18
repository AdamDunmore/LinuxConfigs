{ pkgs, lib, config, ... }:

let
  cfg = config.adam.display_managers.sddm;
in
{
  config = lib.mkIf cfg {
    services.displayManager.sddm = {
      enable = true;
      package = pkgs.sddm;
      wayland.enable = true;
      settings = {};
      # theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
    };
  };
}
