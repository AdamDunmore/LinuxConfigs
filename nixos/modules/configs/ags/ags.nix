{ config, ... }:

let

core = import ../../../values/core.nix;

in

{
    home.file = {
        ".config/ags" = {
            source = config.lib.file.mkOutOfStoreSymlink "${core.config_path}/nixos/modules/configs/ags/ags";
        }; 
    };
}
