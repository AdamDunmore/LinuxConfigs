{ config, ... }:

let

core = import ../../../values/core.nix;

in

{
    home.file = {
        ".config/nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink "${core.config_path}/nixos/modules/configs/nvim/nvim";
        }; 
    };
}
